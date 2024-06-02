import 'package:flutter/material.dart';

class JadwalPraktek extends StatelessWidget {
  const JadwalPraktek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: const Color(0xFFDE1A51),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const Text(
          'Jadwal Praktek',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1.0),
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
            child: Card(
              color: Colors.white, // Mengubah warna card menjadi putih
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0, // Menghilangkan bayangan card
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'RSU Siloam Surabaya',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('Hari Kunjungan :'),
                    Text('Selasa, Rabu, Kamis'),
                    SizedBox(height: 8),
                    Text('Waktu Kunjungan :'),
                    Text('14:00 PM - 17:00 PM'),
                  ],
                ),
              ),
            ),
          ),
          Container( // Hapus SizedBox(height: 16) di sini
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1.0),
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
            child: Card(
              color: Colors.white, // Mengubah warna card menjadi putih
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0, // Menghilangkan bayangan card
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'RS Mitra Keluarga Kenjeran',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('Hari Kunjungan :'),
                    Text('Senin, Selasa, Kamis'),
                    SizedBox(height: 8),
                    Text('Waktu Kunjungan :'),
                    Text('09:00 AM - 11:00 AM'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
