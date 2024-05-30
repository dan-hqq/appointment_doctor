import 'package:flutter/material.dart';
import 'package:appointment_doctor/backend/auth/auth.dart'; // Pastikan jalur impor benar

class ProfileAdminApk extends StatefulWidget {
  const ProfileAdminApk({super.key});

  @override
  State<ProfileAdminApk> createState() => _ProfileAdminApkState();
}

class _ProfileAdminApkState extends State<ProfileAdminApk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Center(
              child: Text(
                'Profil Admin Aplikasi',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 24, fontWeight: FontWeight.bold,),
              ),
            ),
            const Center(
  child: SizedBox(height: 20),
),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/images/bgrs.png'), // Gambar yang diupload pengguna
              ),
              const SizedBox(height: 20),
              const Text(
                'RSU Siloam Surabaya',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const ListTile(
                  leading: Icon(Icons.location_on, color: Color(0xFFDE1A51)),
                  title: Text(
                    'Alamat',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      'Jl. Y. Sadantho No. 40, Citraland, Surabaya, Jawa Timur 60200'),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
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
              const SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const ListTile(
                  leading: Icon(Icons.email, color: Color(0xFFDE1A51)),
                  title: Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('siloamhospitalby@gmail.com'),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await Auth.instance.logout();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDE1A51),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
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