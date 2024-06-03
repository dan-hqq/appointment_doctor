import 'package:appointment_doctor/backend/appointment/patient_appointment.dart';
import 'package:appointment_doctor/model/doctor_model.dart';
import 'package:appointment_doctor/model/hospital_model.dart';
import 'package:appointment_doctor/model/schedule_hospital_model.dart';
import 'package:appointment_doctor/pages/patient/main_pasien.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

Map<int, String> months = {
  1: "Januari",
  2: "Februaru",
  3: "Maret",
  4: "April",
  5: "Mei",
  6: "Juni",
  7: "Juli",
  8: "Agustus",
  9: "September",
  10: "Oktober",
  11: "November",
  12: "Desember"
};

class JanjiTemuDokter extends StatefulWidget {
  final String title;
  final DoctorModel doctor;
  final HospitalModel hospital;

  const JanjiTemuDokter({Key? key, required this.title, required this.doctor, required this.hospital}) : super(key: key);

  @override
  _JanjiTemuDokterState createState() => _JanjiTemuDokterState();
}

class _JanjiTemuDokterState extends State<JanjiTemuDokter> {
  String selectedDay = '';
  String selectedDate = '';
  String selectedTime = '';
  String selectedMonth = '';
  DateTime? selectedFullDate;
  List<int> shiftDays = [];
  List<String> availableTimes = [];
  String keluhan = "";

  bool isInputValid() {
    return selectedDay.isNotEmpty &&
           selectedDate.isNotEmpty &&
           selectedTime.isNotEmpty &&
           keluhan.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    fetchShiftDays();
  }

  void fetchShiftDays() async {
    final fetchingShiftDays = await ScheduleHospitalModel.getShiftDays(widget.doctor.id!, widget.hospital.id!);
    setState(() {
      shiftDays = fetchingShiftDays;
    });
  }

  void fetchAvailableTimes(DateTime date) async {
    final times = await ScheduleHospitalModel.getTimeAppointment(widget.doctor.id!, widget.hospital.id!, date);
    setState(() {
      availableTimes = times;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFDE1A51),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(widget.doctor.profileDoctor!),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.doctor.nama!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.doctor.spesialis!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.pink),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lokasi Praktek',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.hospital.namaRS}\n${widget.hospital.alamat}',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Tanggal Kunjungan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                IconButton(
                  icon: Icon(Icons.calendar_today, color: Color(0xFFDE1A51)),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
                Text(selectedDay == "" ? "Tanggal dipilih: " : "Tanggal dipilih: ${selectedDay}, ${selectedDate} ${selectedMonth}")
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Waktu Kunjungan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: _buildTimeChips()
            ),
            SizedBox(height: 16),
            Text(
              'Keluhan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  keluhan = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Masukkan keluhan Anda',
                border: OutlineInputBorder(),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isInputValid() ? () async {
                  // Handle logic for appointment creation here
                  try {
                    print(selectedFullDate);
                    print(selectedTime);
                    print(keluhan);
                    await PatientAppointment.makeNewAppointment(widget.doctor.id!, widget.hospital.id!, selectedFullDate!, selectedTime, keluhan);

                    showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.success(
                        message: "Kamu telah berhasil membuat appointment, silahkan tunggu konfirmasi dari dokter",
                      ),
                    );

                    Get.offAll(() => const MyAppPasien());

                  } 
                  catch (e) {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.error(
                        message: "Gagal membuat appointment: $e",
                      ),
                    );
                  }
                } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Buat Janji',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTimeChips() {
    List<Widget> chips = [];
    for (String time in availableTimes) {
      chips.add(_buildTimeChip(context, time));
    }
    return chips;
  }

  Widget _buildTimeChip(BuildContext context, String time) {
    bool isSelected = selectedTime == time;
    return ChoiceChip(
      label: Text(
        time,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontSize: 12),
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          selectedTime = time;
        });
      },
      selectedColor: Colors.pink,
      backgroundColor: Colors.grey[200],
      labelPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      showCheckmark: false,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime((DateTime.now().month == 12) ? DateTime.now().year + 1 : DateTime.now().year, (DateTime.now().month == 12) ? 1 : DateTime.now().month + 1, DateTime.now().day),
      selectableDayPredicate: (DateTime date) {
        // Menentukan apakah tanggal bisa dipilih atau tidak berdasarkan hari
        return shiftDays.contains(date.weekday);
      },
    );
    if (picked != null) {
      setState(() {
        String newDay = _getDayOfWeek(picked.weekday);
        String newDate = picked.day.toString();
        int newMonth = picked.month;
        selectedDay = newDay;
        selectedDate = newDate;
        selectedMonth = months[newMonth]!;
        selectedTime = '';
        selectedFullDate = picked;
        fetchAvailableTimes(picked);
      });
    }
  }


  String _getDayOfWeek(int day) {
    switch (day) {
      case 1:
        return 'Senin';
      case 2:
        return 'Selasa';
      case 3:
        return 'Rabu';
      case 4:
        return 'Kamis';
      case 5:
        return 'Jumat';
      case 6:
        return 'Sabtu';
      case 7:
        return 'Minggu';
      default:
        return '';
    }
  }
}
