import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/doctor/detail_chat.dart';

class ChatDokter extends StatefulWidget {
  const ChatDokter({super.key});

  @override
  State<ChatDokter> createState() => _ChatDokterState();
}

class _ChatDokterState extends State<ChatDokter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(8),
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
          'Riwayat Chat Pasien',
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
            phone: '081234567890',
          ),
          PatientCard(
            name: 'Jefri Rinantoro',
            role: 'Pasien',
            phone: '081234567890',
          ),
          PatientCard(
            name: 'Jefri Rinantoro',
            role: 'Pasien',
            phone: '081234567890',
          ),
          PatientCard(
            name: 'Jefri Rinantoro',
            role: 'Pasien',
            phone: '081234567890',
          ),
        ],
      ),
    );
  }
}

class PatientCard extends StatelessWidget {
  final String name;
  final String role;
  final String phone;

  const PatientCard({
    super.key,
    required this.name,
    required this.role,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailChat()),
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
                  Text(
                    phone,
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
    );
  }
}
