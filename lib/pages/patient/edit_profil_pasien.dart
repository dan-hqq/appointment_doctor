import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilPasien extends StatefulWidget {
  final String title;

  const EditProfilPasien({Key? key, required this.title}) : super(key: key);

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
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
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
                  labelText: 'Masukkan nama anda',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start, // align to the start
                children: [
                  Row(
  mainAxisAlignment: MainAxisAlignment.start, // align to the start
  children: [
    IntrinsicWidth(
      child: RadioListTile(
        dense: true,
        contentPadding: EdgeInsets.all(0),
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
    IntrinsicWidth(
      child: RadioListTile(
        dense: true,
        contentPadding: EdgeInsets.all(0),
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
                  labelText: 'Masukkan nomor telepon anda',
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
                  labelText: 'Masukkan alamat anda',
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
    home: EditProfilPasien(title: 'Edit Profil'),
  ));
}
