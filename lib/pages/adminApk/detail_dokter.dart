import 'package:appointment_doctor/model/doctor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailDoctor extends StatefulWidget {
  
  final DoctorModel doctor;
  
  const DetailDoctor({super.key, required this.doctor});

  @override
  State<DetailDoctor> createState() => _DetailDoctorState();
}

class _DetailDoctorState extends State<DetailDoctor> {
  

  String email = "";

  @override
  void initState() {
    super.initState();
    fetchEmailDoctor();
  }

  void fetchEmailDoctor() async {
    
    final snapshot = await FirebaseFirestore.instance.collection('users').doc(widget.doctor.id).get();

    final data = snapshot.data();
    setState(() {
      email = data!["email"];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail Dokter',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
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
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: const AssetImage('assets/images/doctor1.png'), // Gambar yang diupload pengguna
                    foregroundImage: widget.doctor.profileDoctor != null ? NetworkImage(widget.doctor.profileDoctor!) : null,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.doctor.nama ?? "",
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
                    'Lokasi Praktek',
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
                    email,
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
                    widget.doctor.telepon ?? "",
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
                    // ganti tombol buat ngehapus
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