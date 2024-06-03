import 'package:appointment_doctor/model/doctor_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:appointment_doctor/backend/auth/auth.dart';
import 'package:appointment_doctor/pages/doctor/jadwal_praktek.dart'; // Import halaman JadwalPraktek

class ProfileDokter extends StatefulWidget {
  const ProfileDokter({super.key});

  @override
  State<ProfileDokter> createState() => _ProfileDokterState();
}

class _ProfileDokterState extends State<ProfileDokter> {
  final Auth _auth = Auth(); // Inisialisasi Auth

  DoctorModel? doctor;

  @override
  void initState() {
    super.initState();
    fetchDetailDoctor();
  }

  void fetchDetailDoctor() async {
    final fetchedDoctor = await DoctorModel.getLoginDetailDoctor();
    setState(() {
      doctor = fetchedDoctor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 26.0, right: 26, top: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Profil',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFDE1A51), // Warna border
                  width: 4.0, // Ketebalan border
                ),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: const AssetImage('assets/images/dokter.png'), // Ganti dengan path gambar yang sesuai
                foregroundImage:  doctor?.profileDoctor != null ? NetworkImage(doctor!.profileDoctor!) : null,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              doctor?.nama! ?? "",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'ID : ${FirebaseAuth.instance.currentUser?.uid}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(color: Colors.grey.shade300, width: 1.0),
              ),
              child: ListTile(
                leading: const Icon(Icons.calendar_today, color: Color(0xFFDE1A51)),
                title: const Text(
                  'Jadwal Praktek',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JadwalPraktek()),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(color: Colors.grey.shade300, width: 1.0),
              ),
              child: ListTile(
                leading: const Icon(Icons.phone, color: Color(0xFFDE1A51)),
                title: const Text(
                  'Telepon',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(doctor?.telepon ?? ""),
              ),
            ),
            const SizedBox(
                height:
                    30), // Spacer untuk memberi jarak antara informasi telepon dan tombol logout
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _auth.logout();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDE1A51),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
                height:
                    20), // Optional: Menambahkan jarak di bawah tombol logout
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProfileDokter(),
  ));
}
