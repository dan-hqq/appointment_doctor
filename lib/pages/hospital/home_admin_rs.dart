import 'package:appointment_doctor/pages/hospital/daftarspesialis.dart';
import 'package:appointment_doctor/pages/hospital/list_daftar_dokter.dart';
import 'package:appointment_doctor/pages/hospital/list_specialty.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAdminRS extends StatelessWidget {
  const HomeAdminRS({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: 50, left: 15, right: 15), // Atur padding sesuai kebutuhan
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halo, John Doe!",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
                height: 10), // Atur jarak antara teks dengan bagian selanjutnya
            SizedBox(
              width: MediaQuery.of(context).size.width -
                  20, // Mengatur lebar sesuai dengan lebar layar dikurangi 30
              height: 210,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 4.0), // Atur jarak gambar dari kanan
                child: Image.asset(
                  'assets/images/gambar.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 7.0),
              child: Text(
                "Menu",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1, // Set flex untuk gambar menu 1
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0), // Atur padding kiri pada gambar menu 1
                    child: Image.asset(
                      'assets/images/daftarspesialis.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10), // Tambahkan jarak antara gambar menu
                Expanded(
                  flex: 1, // Set flex untuk gambar menu 2
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 5.0), // Atur padding kanan pada gambar menu 2
                    child: Image.asset(
                      'assets/images/daftardokter.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
