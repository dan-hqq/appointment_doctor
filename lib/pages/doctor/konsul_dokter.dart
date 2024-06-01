import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/doctor/detail_appointment.dart';

class KonsulDokter extends StatefulWidget {
  const KonsulDokter({super.key});

  @override
  State<KonsulDokter> createState() => _KonsulDokterState();
}

class _KonsulDokterState extends State<KonsulDokter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFDE1A51),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
          },
        ),
        title: const Text(
          'Konsultasi Mendatang',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          PatientCard(
            name: 'Jefri Rinantoro',
            role: 'Pasien',
            visitDate: 'Selasa, 17 Juni 2024',
            visitTime: '17:00 PM',
            location: 'RSU Siloam Surabaya',
            address: 'Jl. Raya Gubeng No.70 Surabaya',
          ),
          PatientCard(
            name: 'Christoper Yudhis',
            role: 'Pasien',
            visitDate: 'Kamis, 19 Juni 2024',
            visitTime: '10:00 AM',
            location: 'RSU Mitra Keluarga Kenjeran',
            address: 'Jl. Kenjeran No.90 Surabaya',
          ),
        ],
      ),
    );
  }
}

class PatientCard extends StatelessWidget {
  final String name;
  final String role;
  final String visitDate;
  final String visitTime;
  final String location;
  final String address;

  const PatientCard({
    super.key,
    required this.name,
    required this.role,
    required this.visitDate,
    required this.visitTime,
    required this.location,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailAppointment()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade300, width: 1.0),
          boxShadow: [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        role,
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
            const SizedBox(height: 16),
            Text(
              location,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(address),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tanggal Kunjungan:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(visitDate),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Waktu Kunjungan:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(visitTime),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
