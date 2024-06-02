import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DaftarSpesialis(),
    );
  }
}

class DaftarSpesialis extends StatefulWidget {
  const DaftarSpesialis({super.key});

  @override
  State<DaftarSpesialis> createState() => _DaftarSpesialisState();
}

class _DaftarSpesialisState extends State<DaftarSpesialis> {
  final List<Map<String, String>> specializations = [
    {"title": "Anak", "image": "assets/images/anak.png"},
    {"title": "Dokter Umum", "image": "assets/images/dokter_umum.png"},
    {"title": "Kulit", "image": "assets/images/kulit.png"},
    {"title": "Penyakit Dalam", "image": "assets/images/penyakit_dalam.png"},
    {"title": "Psikolog Klinis", "image": "assets/images/psikologi_klinis.png"},
    {"title": "COVID-19", "image": "assets/images/covid19.png"},
    {"title": "Gizi Klinik", "image": "assets/images/gizi_klinik.png"},
    {"title": "Kandungan", "image": "assets/images/kandungan.png"},
    {"title": "Hewan", "image": "assets/images/hewan.png"},
    {"title": "THT", "image": "assets/images/tht.png"},
    {"title": "Konsulen", "image": "assets/images/konsultasi.png"},
    {"title": "Gigi", "image": "assets/images/gigi.png"},
    {"title": "Psikiater", "image": "assets/images/psikiater.png"},
    {"title": "Seksologi", "image": "assets/images/seksologi.png"},
    {"title": "Bedah", "image": "assets/images/bedah.png"},
    {"title": "Saraf", "image": "assets/images/saraf.png"},
    {"title": "Jantung", "image": "assets/images/jantung.png"},
    {"title": "Laktasi", "image": "assets/images/laktasi.png"},
    {"title": "Program Hamil", "image": "assets/images/program_hamil.png"},
    {"title": "Mata", "image": "assets/images/mata.png"},
    {"title": "Paru", "image": "assets/images/paru.png"},
    {"title": "Fisioterapi", "image": "assets/images/fisioterapi.png"},
    {"title": "Medikolegal", "image": "assets/images/medikolegal.png"},
    {"title": "Talk Therapy Clinic", "image": "assets/images/talk_therapy.png"},
    {"title": "Pemeriksaan Lab", "image": "assets/images/pemeriksaan_lab.png"},
    {"title": "Bidanku", "image": "assets/images/bidanku.png"},
    {
      "title": "Layanan Kontrasepsi",
      "image": "assets/images/layanan_kontrasepsi.png"
    },
  ];

  List<Map<String, String>> filteredSpesialis = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredSpesialis = specializations;
    searchController.addListener(() {
      filterSpesialis();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterSpesialis() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredSpesialis = specializations.where((spesialis) {
        final spesialisName = spesialis['title']!.toLowerCase();
        return spesialisName.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Daftar Spesialis',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFDE1A51),
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Cari...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: filteredSpesialis.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade200,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child:
                              Image.asset(filteredSpesialis[index]['image']!),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        filteredSpesialis[index]['title']!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
