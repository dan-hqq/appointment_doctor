import 'package:appointment_doctor/model/doctor_model.dart';
import 'package:appointment_doctor/model/hospital_model.dart';
import 'package:appointment_doctor/pages/adminApk/detail_dokter.dart';
import 'package:appointment_doctor/pages/patient/janji_temu_dokter.dart';
import 'package:flutter/material.dart';


class DoctorListPage extends StatefulWidget {
  final String title;

  const DoctorListPage({super.key, required this.title});

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {

  List<DoctorModel> doctors = [];

  List<DoctorModel> filteredDoctors = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }

  void fetchDoctors() async {
    doctors = await DoctorModel.getAllDoctors();
    setState(() {
      filteredDoctors = doctors;
    });
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
        final doctorName = doctor.nama!.toLowerCase();
        return doctorName.contains(query);
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
          widget.title,
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
              builder: (context) => DetailDoctor(doctor: doctor),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
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
                      doctor.profileDoctor!,
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
          doctor.nama!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          doctor.spesialis!,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 4),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JanjiTemuDokter(title: 'Temui Dokter', doctor: DoctorModel.empty(), hospital: HospitalModel.empty(),),
              ),
            );// Tambahkan logika untuk tombol janji temu di sini
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFDE1A51), // Warna tombol
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Ubah sesuai kebutuhan
            ),
          ),
          child: Text(
            'Janji Temu',
            style: TextStyle(color: Colors.white),
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