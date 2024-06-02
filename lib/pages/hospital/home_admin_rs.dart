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
        padding: const EdgeInsets.only(
            top: 50, left: 17, right: 15), // Atur padding sesuai kebutuhan
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
            const SizedBox(
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
                  fit: BoxFit.cover,
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
                    padding: const EdgeInsets.only(left: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => const ListSpecialty(),
                            builder: (context) => const DaftarSpesialis(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/daftarspesialis.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10), // Tambahkan jarak antara gambar menu
                Expanded(
                  flex: 1, // Set flex untuk gambar menu 2
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DoctorListPage(
                              title: 'Daftar Dokter',
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/daftardokter.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 10.0),
              child: Row(
                children: [
                  Text(
                    "Dokter Terkini",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DoctorListPage(
                              title: 'Pilih Rumah Sakit',
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "Lihat Semua",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.blue,
                            ),
                          ),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.only(
                        left: 5,
                        right: 5), // Atur padding kiri dan kanan pada container
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: AspectRatio(
                              aspectRatio: 8 / 7,
                              child: Image.asset(
                                'assets/images/doctor4.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. icikiwir',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Dokter Umum',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
