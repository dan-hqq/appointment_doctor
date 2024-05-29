import 'package:flutter/material.dart';
import 'package:appointment_doctor/backend/auth/auth.dart';
import 'dart:io';
import 'package:get/get.dart';

class ProfileDokter extends StatefulWidget {
  const ProfileDokter({super.key});

  @override
  State<ProfileDokter> createState() => _ProfileDokterState();
}

class _ProfileDokterState extends State<ProfileDokter> {
  final Auth _auth = Auth(); // Inisialisasi Auth

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
                  color: Color(0xFFDE1A51), // Warna border
                  width: 4.0, // Ketebalan border
                ),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/images/dokter.png'), // Ganti dengan path gambar yang sesuai
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Dr. Dodi Maulana',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'ID : NDFArcWbELqU8RhcCLuehN6jbEjMUCo2',
              style: TextStyle(
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
              child: const ListTile(
                leading: Icon(Icons.calendar_today, color: Color(0xFFDE1A51)),
                title: Text(
                  'Jadwal Praktek',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Hari Selasa - Kamis\nPagi: 08:00 - 13:00'),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.0),
                border: Border.all(color: Colors.grey.shade300, width: 1.0),
              ),
              child: const ListTile(
                leading: Icon(Icons.phone, color: Color(0xFFDE1A51)),
                title: Text(
                  'Telepon',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('+62 12345678'),
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
                  backgroundColor: Color(0xFFDE1A51),
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
