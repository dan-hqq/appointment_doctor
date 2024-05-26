import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailRS extends StatefulWidget {
  const DetailRS({super.key});

  @override
  State<DetailRS> createState() => _DetailRSState();
}

class _DetailRSState extends State<DetailRS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail Rumah Sakit',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color(0xFFDE1A51),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFDE1A51),
                    width: 4.0, // Ketebalan border
                  ),
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/rumah_sakit.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'RSU Siloam Surabaya',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.location_on, color: Colors.pink),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Jl. Soekarno No.40 Gebang Surabaya Jawa Timur 60183',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.phone, color: Colors.pink),
                SizedBox(width: 8),
                Text(
                  '+62 12345678',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.email, color: Colors.pink),
                SizedBox(width: 8),
                Text(
                  'siloamhospitalsby@gmail.com',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Hapus Rumah Sakit'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.pink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
