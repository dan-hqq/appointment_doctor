import 'package:appointment_doctor/pages/adminApk/temu_chat_dokter.dart';
import 'package:flutter/material.dart';
import 'package:appointment_doctor/model/hospital_model.dart';
import 'package:appointment_doctor/pages/adminApk/list_daftar_rs.dart';
import 'package:appointment_doctor/pages/adminApk/list_daftar_dokter.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAdminApk extends StatefulWidget {
  const HomeAdminApk({Key? key}) : super(key: key);

  @override
  _HomeAdminApkState createState() => _HomeAdminApkState();
}

class _HomeAdminApkState extends State<HomeAdminApk> {
  List<HospitalModel> hospitals = [];
  List<HospitalModel> filteredHospitals = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchHospitals();
    searchController.addListener(filterHospitals);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void fetchHospitals() async {
    hospitals = await HospitalModel.getAllHospital();
    setState(() {
      filteredHospitals = hospitals;
    });
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
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 17, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Halo, John Doe!",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              height: 210,
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset(
                    'assets/images/gambar.png',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 7.0),
              child: Text(
                "Menu",
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorListPage(
                              title: 'Daftar Dokter',
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/menu1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HospitalListPage(
                              title: 'Daftar Rumah Sakit',
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/images/menu2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 10.0),
              child: Row(
                children: [
                  Text(
                    "Rumah Sakit Terkini",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HospitalListPage(
                              title: 'Pilih Rumah Sakit',
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "Lihat Semua",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                          ),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                ],
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
      ),
    );
  }
}
