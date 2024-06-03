import 'package:appointment_doctor/model/doctor_model.dart';
import 'package:appointment_doctor/model/hospital_model.dart';
import 'package:flutter/material.dart';

class FilterDokter extends StatefulWidget {
  final List<DoctorModel> doctors;
  final HospitalModel hospital;

  FilterDokter({required this.doctors, required this.hospital});

  @override
  _FilterDokterState createState() => _FilterDokterState();
}

class _FilterDokterState extends State<FilterDokter> {
  TextEditingController _searchController = TextEditingController();
  List<DoctorModel> _filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    _filteredDoctors = widget.doctors;
    _searchController.addListener(_filterDoctors);
  }

  void _filterDoctors() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredDoctors = widget.doctors;
      } else {
        _filteredDoctors = widget.doctors
            .where((doctor) =>
                doctor.nama!.toLowerCase().contains(query) ||
                doctor.spesialis!.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterDoctors);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Hospital background and information
          Stack(
            children: [
              Image.asset(
                'assets/images/bgrs.png',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Color(0xFFDE1A51),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.hospital.namaRS!,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.hospital.alamat!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      widget.hospital.telepon!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0), // Mengurangi padding vertikal
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari dokter...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredDoctors.length,
              itemBuilder: (context, index) {
                final doctor = _filteredDoctors[index];
                return Card(
                  margin: EdgeInsets.symmetric(
                      vertical: 0.0,
                      horizontal: 16.0), // Mengurangi margin vertikal
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: [
                        Image.network(
                          doctor.profileDoctor!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor.nama!,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(doctor.spesialis!),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle chat doctor action
                                },
                                child: Text('Janji Temu'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFDE1A51),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
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
