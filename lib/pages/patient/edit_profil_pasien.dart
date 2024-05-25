import 'dart:ffi';

import 'package:flutter/material.dart';

class EditProfilPasien extends StatefulWidget {
  const EditProfilPasien({Key? key}) : super(key: key);

  @override
  State<EditProfilPasien> createState() => _EditProfilPasienState();
}

class _EditProfilPasienState extends State<EditProfilPasien> {
  String _selectedGender = 'Laki-laki';
  String _nama = ''; // deklarasi variabel _namaRS
  int _telepon = 0; // deklarasi variabel _telepon
  String _alamat = ''; // deklarasi variabel _alamat

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.red,
            shape: CircleBorder(),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.red),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text('Edit Profil', style: TextStyle(color: Colors.red)),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          // Nama
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Nama',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Jefri Rinantoro',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _nama = value;
                  });
                },
              ),
            ],
          ),
           // Jenis Kelamin
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(height: 20),
    Text(
      'Jenis Kelamin',
      style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 10),
    // Bullet list in one row
    Row(
      mainAxisAlignment: MainAxisAlignment.start, // align to the start
      children: [
        Expanded(
          child: RadioListTile(
            title: Text('Laki-laki'),
            value: 'Laki-laki',
            groupValue: _selectedGender,
            onChanged: (value) {
              setState(() {
                _selectedGender = value.toString();
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: Text('Perempuan'),
            value: 'Perempuan',
            groupValue: _selectedGender,
            onChanged: (value) {
              setState(() {
                _selectedGender = value.toString();
              });
            },
          ),
        ),
      ],
    ),
  ],
),
          // Telepon
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Telepon',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '+62 7383 8772',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _telepon = int.parse(value);
                  });
                },
              ),
            ],
          ),
          // Alamat
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Alamat',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Jl. Sekar Ramadhani Selatan',
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
            ],
          ),
         SizedBox(height: 160),
Container(
  width: double.infinity, // Membuat tombol memiliki panjang yang sama dengan form
  child: ElevatedButton(
    onPressed: () {
      // Proses simpan data di sini
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFDE1A51), // Warna latar belakang merah
    ),
     child: Container(
      width: double.infinity, // Membuat tombol memiliki panjang yang sama dengan parent
      padding: EdgeInsets.symmetric(vertical: 16.0), // Menambahkan padding vertikal
      child: Center(
        child: Text(
          'Simpan',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white, // Warna teks putih
          ),
        ),
      ),
    ),
  ),
),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EditProfilPasien(),
  ));
}
