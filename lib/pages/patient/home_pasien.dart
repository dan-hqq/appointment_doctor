import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/patient/list_daftar_rs.dart';
import 'package:appointment_doctor/pages/patient/list_daftar_dokter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class HomePasien extends StatelessWidget {
  const HomePasien({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: 50, left: 15, right: 15), // Atur padding sesuai kebutuhan
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Halo, John Doe!",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Keputih", // Nama lokasi
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.location_on), // Icon lokasi
                  ],
                ),
              ],
            ),
            SizedBox(height: 5), // Atur jarak antara teks dengan bagian selanjutnya
            SizedBox(
              width: MediaQuery.of(context).size.width - 20, // Mengatur lebar sesuai dengan lebar layar dikurangi 20
              height: 210,
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0), // Atur jarak gambar dari kanan
                child: FittedBox(
                  fit: BoxFit.contain, // Menggunakan FittedBox untuk menyesuaikan gambar
                  child: Image.asset(
                    'assets/images/gambar.png',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 7.0),
              child: Text(
                "Menu",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1, // Set flex untuk gambar menu 1
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0), // Atur padding kiri pada gambar menu 1
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorListPage(
                              title: 'Daftar Dokter',
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/daftardokterpasien.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Tambahkan jarak antara gambar menu
                Expanded(
                  flex: 1, // Set flex untuk gambar menu 2
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0), // Atur padding kanan pada gambar menu 2
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HospitalListPage(
                              title: 'Daftar Rumah Sakit',
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/daftarRS.png',
                        fit: BoxFit.cover,
                      ),
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

void main() {
  runApp(MaterialApp(
    home: HomePasien(),
  ));
}
