import 'package:appointment_doctor/model/hospital_model.dart';
import 'package:flutter/material.dart';

class DetailAppointment extends StatefulWidget {
  final String name;
  final String date;
  final DateTime realDate;
  final String time;
  final String hospitalId;
  final String doctorId;
  final String userId;
  final String status;
  final String keluhan;
  final String? note;
  
  const DetailAppointment({
    super.key, 
    required this.name,
    required this.date,
    required this.realDate,
    required this.time,
    required this.hospitalId,
    required this.doctorId,
    required this.userId,
    required this.status,
    required this.keluhan,
    this.note
  });

  @override
  State<DetailAppointment> createState() => _DetailAppointmentState();
}

class _DetailAppointmentState extends State<DetailAppointment> {

  HospitalModel hospital = HospitalModel.empty();

  Color statusColor = Colors.orange[300]!;
  Color textColor = Colors.white;
  bool isConfirmed = true;
  String? tempStatus;

  @override
  void initState() {
    super.initState();
    tempStatus = widget.status;
    fetchHospitalDetail();
  }

  void fetchHospitalDetail() async {
    final fetchHospital = await HospitalModel.getHospitalDetailsWithId(widget.hospitalId);
    setState(() {
      hospital = fetchHospital;
      isConfirmed = !(widget.status == "pending" || widget.status == "Pending") || (tempStatus != "pending" && tempStatus != "Pending");
      statusColor = (widget.status == "diterima" || widget.status == "Diterima") ? const Color(0xFFA1DD70) : (widget.status == "batal" || widget.status == "Batal") ? Color(0xFFFFC0CB) : (widget.status == "selesai" || widget.status == "Selesai") ? Color(0xB5C0D0) : Colors.orange[300]!;
      textColor = (widget.status == "diterima" || widget.status == "Diterima") ? const Color(0xFF0A6847) : (widget.status == "batal" || widget.status == "Batal") ? Color(0xFFDE1A51) : (widget.status == "selesai" || widget.status == "Selesai") ? Colors.black : Colors.white;
    });
  }

  String? doctorNote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detail Konsultasi',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFDE1A51),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.white,
            constraints: const BoxConstraints(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1.0),
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: statusColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          tempStatus!,
                          style: TextStyle(color: textColor),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'assets/images/doctor1.png'), // Update this path to your asset image
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300, width: 1.0),
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 2,
                          //     blurRadius: 5,
                          //     offset: const Offset(0, 3),
                          //   ),
                          // ],
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Color(0xFFDE1A51),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lokasi Praktek',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8),
                                Text(hospital.namaRS!),
                                Text(hospital.alamat!),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Tanggal Kunjungan :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(widget.date),
                      const SizedBox(height: 16),
                      const Text(
                        'Waktu Kunjungan :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(widget.time),
                      const SizedBox(height: 16),
                      const Text(
                        'Keluhan :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(widget.keluhan),
                      (widget.status == "selesai" || tempStatus == "selesai" || tempStatus == "Selesai") ?
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            const Text(
                              'Catatan Dokter :',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(widget.note ?? doctorNote!)
                          ],
                        )
                      : const SizedBox(height: 16)
                      // End If
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
