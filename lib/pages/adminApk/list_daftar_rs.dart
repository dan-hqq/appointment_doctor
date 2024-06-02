import 'package:appointment_doctor/models/hospital_model.dart';
import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/temu_chat_dokter.dart';

class HospitalListPage extends StatefulWidget {
  final String title;

  HospitalListPage({required this.title});

  @override
  _HospitalListPageState createState() => _HospitalListPageState();
}

class _HospitalListPageState extends State<HospitalListPage> {
  // final List<Map<String, String>> hospitals = [
  //   {
  //     "name": "RSU Siloam Surabaya",
  //     "address": "Jl. Raya Gubeng No.70 Surabaya",
  //     "phone": "+62 31 5038133",
  //     "image": "assets/images/rs.png" // replace with actual image URL
  //   },
  //   {
  //     "name": "RS Mitra Keluarga Kenjeran",
  //     "address": "Jl. Kenjeran 506 60113 Surabaya",
  //     "phone": "+62 31 99000000",
  //     "image": "assets/images/rs.png" // replace with actual image URL
  //   },
  //   {
  //     "name": "RS Haji",
  //     "address": "Jl. Manyar Kertoadi 60116 Surabaya",
  //     "phone": "+62 31 5924000",
  //     "image": "assets/images/rs.png" // replace with actual image URL
  //   },
  //   {
  //     "name": "RSUD Dr. Soetomo Surabaya",
  //     "address": "Jl. Prof. Dr. Moestopo No. 6-8 Surabaya",
  //     "phone": "+62 31 5501078",
  //     "image": "assets/images/rs.png" // replace with actual image URL
  //   },
  //   {
  //     "name": "RS Karang Tembok Surabaya",
  //     "address": "Jl. Karang Tembok",
  //     "phone": "+62 31 5501078",
  //     "image": "assets/images/rs.png" // replace with actual image URL
  //   },
  //   {
  //     "name": "RS Karang Menjangan",
  //     "address": "Jl. Karang Menjangan",
  //     "phone": "+62 31 5501078",
  //     "image": "assets/images/rs.png" // replace with actual image URL
  //   }
  // ];

  List<HospitalModel> hospitals = [];

  List<HospitalModel> filteredHospitals =
      []; // Inisialisasi dengan daftar kosong
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchHospitals();
  }

  void fetchHospitals() async {
    hospitals = await HospitalModel.getAllHospital();

    setState(() {
      filteredHospitals = hospitals; // Inisialisasi daftar filteredHospitals
    });
    searchController.addListener(() {
      filterHospitals();
    });
  }

  @override
  void dispose() {
    searchController.dispose(); // Jangan lupa dispose controller
    super.dispose();
  }

  void filterHospitals() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredHospitals = hospitals.where((hospital) {
        final hospitalName = hospital.namaRS!.toLowerCase();
        return hospitalName.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          widget.title, // Menggunakan title dari argumen
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFDE1A51),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
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
                hintText: 'Cari rumah sakit...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredHospitals.length,
              itemBuilder: (context, index) {
                final hospital = filteredHospitals[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RSUHospitalScreen(
                          imageUrl: hospital.imageUrl!,
                          hospitalName: hospital.namaRS!,
                          address: hospital.alamat!,
                          phoneNumber: hospital.telepon!,
                        ),
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
                              child: Image.network(
                                hospital.imageUrl!,
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
                                  hospital.namaRS!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  hospital.alamat!,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  hospital.telepon!,
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
