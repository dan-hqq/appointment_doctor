import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAdminRS extends StatefulWidget {
  const AddAdminRS({super.key});

  @override
  State<AddAdminRS> createState() => _AddAdminRSState();
}

class _AddAdminRSState extends State<AddAdminRS> {
  late String _namaRS;
  late String _telepon;
  late String _alamat;
  late String _email;
  late String _password;
  late String _imagePath = '';

  void _onChangeImagePath(String newPath) {
    setState(() {
      _imagePath = newPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 50),
          Center(
            child: Text(
              'Tambah Rumah Sakit',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          const Center(
            child: SizedBox(height: 20),
          ),
          Center(
            child: GestureDetector(
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
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFDE1A51), // Warna merah FFDE1A51
                    width: 3, // Lebar border
                  ),
                ),
                child: Center(
                  child: _imagePath.isNotEmpty
                      ? Image.file(
                          File(_imagePath),
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.add_photo_alternate,
                          size: 50,
                          color: Colors.grey,
                        ),
                ),
              ),
            ),
          ),
          const SizedBox(
              height: 10), // Spasi antara gambar dan teks "Tambahkan Foto"
          Center(
            child: Text(
              'Tambahkan Foto',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w200,
                color: Colors.grey,
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Nama Rumah Sakit',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan nama rumah sakit',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Menambahkan border radius
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _namaRS = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              Text(
                'Telepon',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan nomor telepon rumah sakit',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Menambahkan border radius
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _telepon = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              Text(
                'Alamat',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Container(
                height: 200, // Atur tinggi sesuai kebutuhan
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Warna border
                    width: 1.0, // Lebar border
                  ),
                  borderRadius:
                      BorderRadius.circular(15.0), // Menambahkan border radius
                ),
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(0, 0), // Koordinat awal peta
                    zoom: 15.0, // Zoom awal peta
                  ),
                  markers: {
                    // Anda dapat menambahkan marker di sini
                  },
                  onMapCreated: (GoogleMapController controller) {
                    // Callback yang dipanggil saat peta telah dibuat
                  },
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan alamat rumah sakit',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Menambahkan border radius
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _alamat = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Latitude',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Menambahkan border radius
                        ),
                      ),
                      onChanged: (value) {
                        // Anda dapat menyimpan nilai latitude di sini
                      },
                    ),
                  ),
                  const SizedBox(
                      width: 10), // Memberikan jarak antara dua TextFormField
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Longitude',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Menambahkan border radius
                        ),
                      ),
                      onChanged: (value) {
                        // Anda dapat menyimpan nilai longitude di sini
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Email',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan email rumah sakit',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Menambahkan border radius
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              Text(
                'Password',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan password rumah sakit',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Menambahkan border radius
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Container(
                width: double
                    .infinity, // Membuat tombol memiliki panjang yang sama dengan form
                child: ElevatedButton(
                  onPressed: () {
                    // Proses simpan data di sini
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFDE1A51), // Warna latar belakang merah
                  ),
                  child: Container(
                    width: double
                        .infinity, // Membuat tombol memiliki panjang yang sama dengan parent
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0), // Menambahkan padding vertikal
                    child: Center(
                      child: Text(
                        'Simpan',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
