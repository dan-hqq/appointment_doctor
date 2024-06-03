import 'package:appointment_doctor/model/schedule_hospital_model.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UndangDokter extends StatefulWidget {
  const UndangDokter({super.key});

  @override
  _UndangDokterState createState() => _UndangDokterState();
}

class _UndangDokterState extends State<UndangDokter> {
  final Map<String, List<TimeOfDay>> doctorSchedule = {
    "Minggu": [],
    "Senin": [],
    "Selasa": [],
    "Rabu": [],
    "Kamis": [],
    "Jumat": [],
    "Sabtu": [],
  };

  String selectedDay = "Minggu";
  final TextEditingController doctorIdController = TextEditingController();

  void _addOrUpdateTimeSlot(String day, TimeOfDay time, {int? index}) {
    setState(() {
      if (index != null) {
        doctorSchedule[day]?[index] = time;
      } else {
        doctorSchedule[day]?.add(time);
      }
    });
  }

  void _showTimePicker(String day, {int? index}) async {
    TimeOfDay initialTime = index != null
        ? doctorSchedule[day]![index]
        : TimeOfDay.now();
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (selectedTime != null) {
      if (!_isTimeSlotDuplicate(day, selectedTime, index) &&
          _isTimeSlotValid(day, selectedTime, index)) {
        _addOrUpdateTimeSlot(day, selectedTime, index: index);
      } else {
        _showErrorDialog();
      }
    }
  }

  bool _isTimeSlotDuplicate(String day, TimeOfDay time, int? index) {
    for (int i = 0; i < doctorSchedule[day]!.length; i++) {
      if (doctorSchedule[day]![i] == time && i != index) {
        return true;
      }
    }
    return false;
  }

  bool _isTimeSlotValid(String day, TimeOfDay time, int? index) {
    for (int i = 0; i < doctorSchedule[day]!.length; i++) {
      if (i != index) {
        final existingTime = doctorSchedule[day]![i];
        final difference = (time.hour * 60 + time.minute) -
            (existingTime.hour * 60 + existingTime.minute);
        if (difference.abs() < 30) {
          return false;
        }
      }
    }
    return true;
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Waktu Tertumpuk'),
          content: Text(
              'Waktu tidak boleh sama atau jaraknya harus minimal 30 menit.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  void _clearInputs() {
    doctorIdController.clear();
    setState(() {
      doctorSchedule.forEach((key, value) {
        value.clear();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Undang Dokter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: doctorIdController,
              decoration: InputDecoration(
                labelText: 'ID Dokter',
              ),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedDay,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDay = newValue!;
                });
              },
              items: <String>[
                'Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _showTimePicker(selectedDay),
              child: Text('Tambah Waktu Praktek'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: doctorSchedule.entries.map((entry) {
                  return ExpansionTile(
                    title: Text(entry.key),
                    children: entry.value.asMap().entries.map((timeEntry) {
                      return ListTile(
                        title: Text(_formatTimeOfDay(timeEntry.value)),
                        trailing: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => _showTimePicker(
                              entry.key, index: timeEntry.key),
                        ),
                      );
                    }).toList(),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // Simpan data doctorSchedule
                final Map<String, List<String>> formattedSchedule = {};
                doctorSchedule.forEach((key, value) {
                  formattedSchedule[key] =
                      value.map((time) => _formatTimeOfDay(time)).toList();
                });
                print(formattedSchedule);
                try {
                  await ScheduleHospitalModel.inviteDoctor(
                    doctorIdController.text, 
                    formattedSchedule
                  );
                  showTopSnackBar(
                    Overlay.of(context),
                    const CustomSnackBar.success(
                      message: "Kamu telah berhasil mengundang dokter",
                    ),
                  );
                  _clearInputs();
                } catch (e) {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(
                      message: "Gagal mengundang dokter: $e",
                    ),
                  );
                }
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}