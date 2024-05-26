import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/list_daftar_rs.dart';
import 'package:appointment_doctor/pages/list_daftar_dokter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class HomeAdminApk extends StatelessWidget {
  const HomeAdminApk({Key? key}) : super(key: key);

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
            Text(
              "Halo, John Doe!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
                height: 5), // Atur jarak antara teks dengan bagian selanjutnya
            SizedBox(
              width: MediaQuery.of(context).size.width -
                  20, // Mengatur lebar sesuai dengan lebar layar dikurangi 20
              height: 210,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 4.0), // Atur jarak gambar dari kanan
                child: FittedBox(
                  fit: BoxFit
                      .contain, // Menggunakan FittedBox untuk menyesuaikan gambar
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
                    padding: const EdgeInsets.only(
                        left: 5.0), // Atur padding kiri pada gambar menu 1
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
                        'assets/images/menu1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Tambahkan jarak antara gambar menu
                Expanded(
                  flex: 1, // Set flex untuk gambar menu 2
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 5.0), // Atur padding kanan pada gambar menu 2
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
                        'assets/images/menu2.png',
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
                    "Rumah Sakit Terkini",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HospitalListPage(
                              title: 'Pilih Rumah Sakit',
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "Lihat Semua",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                          ),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.only(
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
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: AspectRatio(
                              aspectRatio: 8 / 7,
                              child: Image.asset(
                                'assets/images/rs.png',
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
                                  'RSU. Aslam Surabaya',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Jl. Raya Gubeng No.70 Surabaya',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '+62 897 09282',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 13,
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

class ListDaftarRumahSakit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Rumah Sakit'),
      ),
      body: Center(
        child: Text('List of Hospitals'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeAdminApk(),
  ));
}
