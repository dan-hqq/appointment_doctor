import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/doctor/detail_appointment.dart';

class TemuiDokter extends StatefulWidget {
  const TemuiDokter({super.key});

  @override
  State<TemuiDokter> createState() => _TemuiDokterState();
}

class _TemuiDokterState extends State<TemuiDokter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: const Color(0xFFDE1A51),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const Text(
          'Terima Pasien',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          PatientCard(
            name: 'Jefri Rinantoro',
            date: 'Selasa, 17 Juni 2024',
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
          PatientCard(
            name: 'Jefri Rinantoro',
            date: 'Rabu, 18 Juni 2024',
            time: '17:00 PM',
          ),
        ],
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
                backgroundImage: AssetImage(
                    'assets/images/profile.png'), // Ganti dengan path gambar avatar yang sesuai
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
                        color: const Color(
                            0xFFFFE0B2), // Warna background label "Menunggu Konfirmasi"
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text(
                        'Menunggu Konfirmasi',
                        style: TextStyle(
                          color: Color(
                              0xFFFFA726), // Warna teks label "Menunggu Konfirmasi"
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
