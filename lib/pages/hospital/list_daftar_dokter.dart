import 'package:appointment_doctor/pages/hospital/profile_doctor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorListPage extends StatefulWidget {
  final String title;

  const DoctorListPage({super.key, required this.title});

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  final List<Map<String, String>> doctors = [
    {
      "name": "Dr. Dodi Maulana",
      "specialty": "Umum",

      "image": "assets/images/dokter.png" // replace with actual image URL
    },
    {
      "name": "Dr. Hendry Agus",
      "specialty": "Bedah",
      "image": "assets/images/dokter.png" // replace with actual image URL
    },
    {
      "name": "Dr. Yono Bakrie",
      "specialty": "Bedah",
      "image": "assets/images/dokter.png" // replace with actual image URL
    },
    {
      "name": "Dr. Abdullah Majid",
      "specialty": "Bedah",
      "image": "assets/images/dokter.png" // replace with actual image URL
    },
    {
      "name": "Dr. Ahmad Dzkrie",
      "specialty": "Bedah",
      "image": "assets/images/dokter.png" // replace with actual image URL
    },
    {
      "name": "Dr. Budie Goenadi",
      "specialty": "Bedah",
      "image": "assets/images/dokter.png" // replace with actual image URL
    },
    // Tambahkan data dokter lainnya di sini
  ];

  List<Map<String, String>> filteredDoctors = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredDoctors = doctors;
    searchController.addListener(() {
      filterDoctors();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterDoctors() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredDoctors = doctors.where((doctor) {
        final doctorName = doctor['name']!.toLowerCase();
        return doctorName.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Daftar Dokter',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Cari dokter...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDoctors.length,
              itemBuilder: (context, index) {
                final doctor = filteredDoctors[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileDoctorList(),
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: AspectRatio(
                              aspectRatio: 8 / 7,
                              child: Image.asset(
                                doctor['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doctor['name']!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  doctor['specialty']!,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
