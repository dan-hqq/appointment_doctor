import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/doctor/temui_dokter.dart';
import 'package:appointment_doctor/pages/doctor/konsul_dokter.dart';
import 'package:appointment_doctor/pages/doctor/detail_appointment.dart';

class HomeDokter extends StatelessWidget {
  const HomeDokter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halo, John Doe!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 240,
              child: Container(
                child: Image.asset(
                  'assets/images/gambar.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 7.0),
              child: Text(
                "Menu",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TemuiDokter()),
                          );
                        },
                        child: Image.asset(
                          'assets/images/bookingdokter.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const KonsulDokter()),
                          );
                        },
                        child: Image.asset(
                          'assets/images/konsuldokter.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pengajuan Terkini",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TemuiDokter()),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "Lihat Semua",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey[400],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  PatientCard(
                    name: 'Jefri Rinantoro',
                    date: 'Selasa, 17 Juni 2024',
                    time: '17:00 PM',
                  ),
                  PatientCard(
                    name: 'Christoper Yudhis',
                    date: 'Kamis, 19 Juni 2024',
                    time: '10:00 AM',
                  ),
                  PatientCard(
                    name: 'Jefri Rinantoro',
                    date: 'Rabu, 18 Juni 2024',
                    time: '17:00 PM',
                  ),
                  PatientCard(
                    name: 'Jefri Rinantoro',
                    date: 'Rabu, 18 Juni 2024',
                    time: '17:00 PM',
                  ),
                  PatientCard(
                    name: 'Jefri Rinantoro',
                    date: 'Rabu, 18 Juni 2024',
                    time: '17:00 PM',
                  ),
                  PatientCard(
                    name: 'Jefri Rinantoro',
                    date: 'Rabu, 18 Juni 2024',
                    time: '17:00 PM',
                  ),
                  PatientCard(
                    name: 'Jefri Rinantoro',
                    date: 'Rabu, 18 Juni 2024',
                    time: '17:00 PM',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PatientCard extends StatelessWidget {
  final String name;
  final String date;
  final String time;

  const PatientCard({
    required this.name,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailAppointment(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade300, width: 1.0),
        ),
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE0B2),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text(
                        'Menunggu Konfirmasi',
                        style: TextStyle(
                          color: Color(0xFFFFA726),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Pasien',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '$date | $time',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
