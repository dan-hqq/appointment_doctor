import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Pastikan paket ini ada di pubspec.yaml
import 'dart:io';
import 'package:appointment_doctor/backend/auth/auth.dart'; // Pastikan jalur impor benar

class ProfilAdminRS extends StatefulWidget {
  const ProfilAdminRS({super.key});

  @override
  State<ProfilAdminRS> createState() => _ProfilAdminRSState();
}

class _ProfilAdminRSState extends State<ProfilAdminRS> {
  final Auth _auth = Auth(); // Inisialisasi Auth

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profil Rumah Sakit',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Tambahkan aksi untuk tombol edit di sini
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFDE1A51),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/bgrs.png'), // Gambar yang diupload pengguna
              ),
              SizedBox(height: 20),
              Text(
                'RSU Siloam Surabaya',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Icon(Icons.location_on, color: Color(0xFFDE1A51)),
                  title: Text(
                    'Alamat',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      'Jl. Y. Sadantho No. 40, Citraland, Surabaya, Jawa Timur 60200'),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Color(0xFFDE1A51)),
                  title: Text(
                    'Telepon',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('+62 12345678'),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Icon(Icons.email, color: Color(0xFFDE1A51)),
                  title: Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('siloamhospitalby@gmail.com'),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _auth.logout();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFDE1A51),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilAdminRS(),
  ));
}
