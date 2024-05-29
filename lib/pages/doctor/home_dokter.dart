import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/doctor/temui_dokter.dart';
import 'package:appointment_doctor/pages/doctor/chat_dokter.dart'; // Pastikan impor ini diakhiri dengan titik koma

class HomeDokter extends StatelessWidget {
  const HomeDokter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: 50, left: 18, right: 18),
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
              SizedBox(
                  height:
                      10),
              SizedBox(
                width: MediaQuery.of(context)
                    .size
                    .width,
                height: 240,
                child: Container(
                  child: Image.asset(
                    'assets/images/gambar.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 7.0),
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
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TemuiDokter()),
                          );
                        },
                        child: Image.asset(
                          'assets/images/temuidokter.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ChatDokter()), // Navigasi ke halaman ChatDokter
                          );
                        },
                        child: Image.asset(
                          'assets/images/chatdokter.png',
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
      ),
    );
  }
}
