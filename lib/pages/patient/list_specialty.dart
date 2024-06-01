import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Specialty {
  final String name;
  final String imageUrl;

  Specialty({
    required this.name,
    required this.imageUrl,
  });
}

List<Specialty> getSpecialties() {
  return [
    Specialty(name: 'Kulit', imageUrl: 'assets/images/kulit.png'),
    Specialty(name: 'Anak', imageUrl: 'assets/images/anak.png'),
    Specialty(name: 'Dokter Umum', imageUrl: 'assets/images/dokter_umum.png'),
    Specialty(name: 'Penyakit Dalam', imageUrl: 'assets/images/penyakit_dalam.png'),
    Specialty(name: 'Psikologi Klinis', imageUrl: 'assets/images/psikologi_klinis.png'),
    Specialty(name: 'COVID-19', imageUrl: 'assets/images/covid19.png'),
    Specialty(name: 'Gizi Klinik', imageUrl: 'assets/images/gizi_klinik.png'),
    Specialty(name: 'Kandungan', imageUrl: 'assets/images/kandungan.png'),
    Specialty(name: 'Dokter Hewan', imageUrl: 'assets/images/hewan.png'),
    Specialty(name: 'THT', imageUrl: 'assets/images/tht.png'),
    Specialty(name: 'Konsultasi', imageUrl: 'assets/images/konsultasi.png'),
    Specialty(name: 'Gigi', imageUrl: 'assets/images/gigi.png'),
    Specialty(name: 'Psikiater', imageUrl: 'assets/images/psikiater.png'),
    Specialty(name: 'Seksologi', imageUrl: 'assets/images/seksologi.png'),
    Specialty(name: 'Bedah', imageUrl: 'assets/images/bedah.png'),
    Specialty(name: 'Saraf', imageUrl: 'assets/images/saraf.png'),
    Specialty(name: 'Jantung', imageUrl: 'assets/images/jantung.png'),
    Specialty(name: 'Laktasi', imageUrl: 'assets/images/laktasi.png'),
    Specialty(name: 'Program Hamil', imageUrl: 'assets/images/program_hamil.png'),
    Specialty(name: 'Mata', imageUrl: 'assets/images/mata.png'),
    Specialty(name: 'Paru', imageUrl: 'assets/images/paru.png'),
    Specialty(name: 'Fisioterapi', imageUrl: 'assets/images/fisioterapi.png'),
    Specialty(name: 'Medikolegal', imageUrl: 'assets/images/medikolegal.png'),
    Specialty(name: 'Talk Therapy', imageUrl: 'assets/images/talk_therapy.png'),
    Specialty(name: 'Pemeriksaan Lab', imageUrl: 'assets/images/pemeriksaan_lab.png'),
    Specialty(name: 'Bidanku', imageUrl: 'assets/images/bidanku.png'),
    Specialty(name: 'Layanan Kontrasepsi', imageUrl: 'assets/images/layanan_kontrasepsi.png'),
  ];
}

class ListSpecialty extends StatefulWidget {
  @override
  _ListSpecialtyState createState() => _ListSpecialtyState();
}

class _ListSpecialtyState extends State<ListSpecialty> {
  TextEditingController _searchController = TextEditingController();
  List<Specialty> _specialties = [];
  List<Specialty> _filteredSpecialties = [];

  @override
  void initState() {
    super.initState();
    _specialties = getSpecialties();
    _filteredSpecialties = _specialties;
  }

  void _filterSpecialties(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredSpecialties = _specialties;
      } else {
        _filteredSpecialties = _specialties
            .where((specialty) =>
                specialty.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                'assets/images/bgrs.png', // Replace with your background image
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 120),
            ],
          ),
          Positioned(
            top: 40,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Color(0xFFDE1A51),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Positioned(
            top: 155,
            left: 35,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RSU Siloam Surabaya',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Jl. Raya Gubeng No. 70, Surabaya',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '+62 31 500 5333',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 300,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Cari Spesialis...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: _filterSpecialties,
                  ),
                ),
                SizedBox(width: 10),
                Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: Icon(Icons.filter_list),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDE1A51),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 350,
            left: 20,
            right: 20,
            bottom: 0,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Number of items per row
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.7, // Aspect ratio of each item
              ),
              itemCount: _filteredSpecialties.length,
              itemBuilder: (context, index) {
                final specialty = _filteredSpecialties[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListDaftarDokter(specialty: specialty.name),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(specialty.imageUrl),
                      ),
                      SizedBox(height: 5),
                      Text(
                        specialty.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListDaftarDokter extends StatelessWidget {
  final String specialty;

  ListDaftarDokter({required this.specialty});

  @override
  Widget build(BuildContext context) {
    final doctors = getDoctors().where((doctor) => doctor.specialty == specialty).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dokter $specialty',
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
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(doctor.imageUrl, width: 50, height: 50),
              title: Text(doctor.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor.specialty),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(doctor: doctor),
                        ),
                      );
                    },
                    child: Text('Janji Temu'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFFDE1A51),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

List<Doctor> getDoctors() {
  return [
    Doctor(
        name: 'Dr. Dodi Maulana',
        specialty: 'Dokter Umum',
        imageUrl: 'assets/images/doctor1.png'),
    Doctor(
        name: 'Dr. Siti Azizah',
        specialty: 'Penyakit Dalam',
        imageUrl: 'assets/images/doctor2.png'),
    Doctor(
        name: 'Dr. Carla Levara',
        specialty: 'Kulit',
        imageUrl: 'assets/images/doctor3.png'),
    Doctor(
        name: 'Dr. Hendry Agus',
        specialty: 'Gizi Klinik',
        imageUrl: 'assets/images/doctor4.png'),
    Doctor(
        name: 'Dr. Endang Pratiwi',
        specialty: 'Kandungan',
        imageUrl: 'assets/images/doctor5.png'),
  ];
}

class Doctor {
  final String name;
  final String specialty;
  final String imageUrl;

  Doctor({
    required this.name,
    required this.specialty,
    required this.imageUrl,
  });
}

class ChatScreen extends StatelessWidget {
  final Doctor doctor;

  ChatScreen({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Chat with ${doctor.name}',
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
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Chat feature for ${doctor.name}'),
      ),
    );
  }
}
