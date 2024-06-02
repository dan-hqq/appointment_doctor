import 'package:appointment_doctor/pages/hospital/edit_profil_rs.dart';
import 'package:flutter/material.dart';
import 'package:appointment_doctor/backend/auth/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAdminRS extends StatefulWidget {
  const ProfileAdminRS({super.key});

  @override
  State<ProfileAdminRS> createState() => _ProfileAdminRSState();
}

class _ProfileAdminRSState extends State<ProfileAdminRS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profil Rumah Sakit',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfileRS()),
              );
            },
            child: Text(
              'Edit',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.pink,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFDE1A51),
                      width: 4.0, // Ketebalan border
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/images/bgrs.png'), // Gambar yang diupload pengguna
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'RSU Siloam Surabaya',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading:
                      const Icon(Icons.location_on, color: Color(0xFFDE1A51)),
                  title: Text(
                    'Alamat',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    'Jl. Y. Sadantho No. 40, Citraland, Surabaya, Jawa Timur 60200',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: const Icon(Icons.phone, color: Color(0xFFDE1A51)),
                  title: Text(
                    'Telepon',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    '+62 12345678',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: const Icon(Icons.email, color: Color(0xFFDE1A51)),
                  title: Text(
                    'Email',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    'siloamhospitalby@gmail.com',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
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
                  child: Text(
                    'Logut',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
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
