import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:appointment_doctor/backend/hospital/add_hospital.dart';

class EditProfileRS extends StatefulWidget {
  const EditProfileRS({super.key});

  @override
  State<EditProfileRS> createState() => _EditProfileRSState();
}

class _EditProfileRSState extends State<EditProfileRS> {
  late String _namaRS;
  late String _telepon;
  late String _alamat;
  late String _email;
  late String _password;
  late String _imagePath = '';
  double _latitude = 0.0;
  double _longitude = 0.0;
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  void _onChangeImagePath(String newPath) {
    setState(() {
      _imagePath = newPath;
    });
  }

  @override
  void dispose() {
    _latitudeController.dispose();
    _longitudeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Rumah Sakit',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color(0xFFDE1A51),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
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
                      color: Color(0xFFDE1A51),
                      width: 3,
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
                        : Icon(
                            Icons.add_photo_alternate,
                            size: 50,
                            color: Colors.grey,
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Ganti Foto',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama Rumah Sakit',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Masukkan nama rumah sakit',
                    labelStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _namaRS = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Telepon',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Masukkan nomor telepon rumah sakit',
                    labelStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _telepon = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Alamat',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Masukkan alamat rumah sakit',
                    labelStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _alamat = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _latitudeController,
                        decoration: InputDecoration(
                          labelText: 'Latitude',
                          labelStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _latitude = double.tryParse(value) ?? 0.0;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _longitudeController,
                        decoration: InputDecoration(
                          labelText: 'Longitude',
                          labelStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _longitude = double.tryParse(value) ?? 0.0;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Email',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Masukkan email rumah sakit',
                    labelStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Password',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Masukkan password rumah sakit',
                    labelStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_namaRS.isNotEmpty &&
                          _telepon.isNotEmpty &&
                          _alamat.isNotEmpty &&
                          _email.isNotEmpty &&
                          _password.isNotEmpty &&
                          _imagePath.isNotEmpty &&
                          _latitude >= -90 &&
                          _latitude <= 90 &&
                          _longitude >= -180 &&
                          _longitude <= 180) {
                        final addHospital = AddHospital(
                          namaRS: _namaRS,
                          telepon: _telepon,
                          alamat: _alamat,
                          latitude: _latitude,
                          longitude: _longitude,
                          imagePath: _imagePath,
                          email: _email,
                          password: _password,
                        );

                        await addHospital.addNewHospital(context);
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Error'),
                            content: const Text(
                              'Harap isi semua field terlebih dahulu.\nNilai latitude atau longitude tidak valid. Silakan masukkan nilai dalam rentang: Latitude (-90 hingga 90), Longitude (-180 hingga 180)',
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDE1A51),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: const Center(
                        child: Text(
                          'Simpan',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
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
