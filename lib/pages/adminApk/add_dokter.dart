import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDoctorPage extends StatefulWidget {
  final String title;

  const AddDoctorPage({Key? key, required this.title}) : super(key: key);

  @override
  State<AddDoctorPage> createState() => _AddDoctorPageState();
}

class _AddDoctorPageState extends State<AddDoctorPage> {
  String _email = ''; // deklarasi 
  String _password = ''; // deklarasi 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          'Tambah Dokter',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black, // Sesuaikan warna teks sesuai kebutuhan
            ),
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
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          // Nama
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Email',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan email',
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
            ],
          ),
         
          
          // password
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Password',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan password',
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
              ),
            ],
          ),
          // Alamat
          
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
