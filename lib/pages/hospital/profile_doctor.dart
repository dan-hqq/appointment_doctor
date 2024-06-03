import 'package:appointment_doctor/pages/hospital/edit_profile_doctor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDoctorList extends StatefulWidget {
  const ProfileDoctorList({super.key});

  @override
  State<ProfileDoctorList> createState() => _ProfileDoctorListState();
}

class _ProfileDoctorListState extends State<ProfileDoctorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFDE1A51),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Profil Dokter',
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
                MaterialPageRoute(
                    builder: (context) => const EditProfileDoctor()),
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
                        'assets/images/dokter.png'), // Gambar yang diupload pengguna
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Dokter yang dipilih',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: const Icon(Icons.calendar_month,
                      color: Color(0xFFDE1A51)),
                  title: Text(
                    'Jadwal Praktek',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hari : ' + ' sesuai hari dokter yg dipilih',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Pagi : ' + ' sesuai jam dokter yg dipilih',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
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
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    '+62 12345678',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
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
                    // fungsi untuk hapus dokter
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
                    'Hapus Dokter',
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
