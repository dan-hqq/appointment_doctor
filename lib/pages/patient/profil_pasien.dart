import 'package:appointment_doctor/backend/auth/auth.dart';
import 'package:appointment_doctor/pages/patient/edit_profil_pasien.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class ProfilPasien extends StatefulWidget {
  const ProfilPasien({super.key});

  @override
  State<ProfilPasien> createState() => _ProfilPasien();
}

class _ProfilPasien extends State<ProfilPasien> {
  String _imagePath = '';
  final Auth _auth = Get.put(Auth()); // Ensure Auth is correctly injected

  void _onChangeImagePath(String path) {
    setState(() {
      _imagePath = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // Tinggi AppBar
        child: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true, // Menengahkan judul appbar
          title: Padding(
            padding:
                EdgeInsets.only(top: 30), // Menambah jarak dari atas pada judul
            child: Text(
              "Profil",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20, // Ukuran teks judul
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  right: 10, top: 30), // Menambah jarak dari kanan dan atas
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EditProfilPasien(title: 'Edit Profil'),
                    ),
                  );
                },
                child: Text(
                  "Edit",
                  style: TextStyle(color: Color(0xFFDE1A51)),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                final picker = ImagePicker();
                final pickedImage =
                    await picker.getImage(source: ImageSource.gallery);
                if (pickedImage != null) {
                  File imageFile = File(pickedImage.path);
                  _onChangeImagePath(imageFile.path);
                }
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFDE1A51),
                    width: 3,
                  ),
                ),
                child: ClipOval(
                  child: _imagePath.isNotEmpty
                      ? Image.file(
                          File(_imagePath),
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/profil.png', // Ganti dengan path foto template dari assets
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "John Doe",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "ID : NhusdjW28739DJSHUSjcsud",
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white, // Mengubah warna container menjadi putih
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey[300]!, // Warna border abu-abu
                  width: 1, // Lebar border
                ), // Memberi radius border pada container
              ),
              child: Card(
                elevation: 0, // Menghilangkan shadow pada card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Memberi radius border pada card
                ),
                child: const ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Color(0xFFDE1A51),
                  ),
                  title: Text(
                    "Alamat",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Jl. Soekarno gang 15, LebakBulus"),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white, // Mengubah warna container menjadi putih
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey[300]!, // Warna border abu-abu
                  width: 1, // Lebar border
                ), // Memberi radius border pada container
              ),
              child: Card(
                elevation: 0, // Menghilangkan shadow pada card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Memberi radius border pada card
                ),
                child: const ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Color(0xFFDE1A51),
                  ),
                  title: Text(
                    "Telepon",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("+62 12345678"),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      _auth.logout(); // Call logout method using the instance
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFDE1A51),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const ListTile(
                          title: Center(
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
