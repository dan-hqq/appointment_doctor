import 'package:flutter/material.dart';

class HomeDokter extends StatelessWidget {
  const HomeDokter({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 15, right: 15), // Atur padding sesuai kebutuhan
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halo, John Doe!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // Atur jarak antara teks dengan bagian selanjutnya
            SizedBox(
              width: MediaQuery.of(context).size.width - 20, // Mengatur lebar sesuai dengan lebar layar dikurangi 30
              height: 210,
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0), // Atur jarak gambar dari kanan
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
                    child: Image.asset(
                      'assets/images/temuidokter.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10), // Tambahkan jarak antara gambar menu
                Expanded(
                  flex: 1, // Set flex untuk gambar menu 2
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0), // Atur padding kanan pada gambar menu 2
                    child: Image.asset(
                      'assets/images/chatdokter.png',
                      fit: BoxFit.cover,
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