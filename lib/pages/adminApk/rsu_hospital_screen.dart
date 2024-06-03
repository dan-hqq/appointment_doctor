import 'package:appointment_doctor/model/doctor_model.dart';
import 'package:appointment_doctor/model/hospital_model.dart';
import 'package:appointment_doctor/pages/adminApk/detail_dokter.dart';
import 'package:appointment_doctor/pages/adminApk/detail_rs.dart';
import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/list_specialty.dart';
import 'package:appointment_doctor/pages/filter_dokter.dart';

class RSUHospitalScreen extends StatefulWidget {
  final HospitalModel hospital;

  const RSUHospitalScreen({super.key, 
    required this.hospital
  });

  @override
  State<RSUHospitalScreen> createState() => _RSUHospitalScreenState();
}

class _RSUHospitalScreenState extends State<RSUHospitalScreen> {
  
  final TextEditingController _searchController = TextEditingController();
  List<DoctorModel> _doctors = [];
  List<DoctorModel> _filteredDoctors = [];
  String _filterGroup = 'Dokter'; // State variable for radio buttons

  @override
  void initState() {
    super.initState();
    _loadDoctors();
  }

  void _loadDoctors() async {
    _doctors = await HospitalModel.getDoctorsHospital(widget.hospital.id!);
    setState(() {
      _filteredDoctors = _doctors;
    });
  }

  void _filterDoctors(String? query) {
    setState(() {
      if (query == null || query.isEmpty) {
        _filteredDoctors = _doctors;
      } else {
        _filteredDoctors = _doctors
            .where((doctor) =>
                doctor.nama!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _resetFilters() {
    setState(() {
      _filteredDoctors = _doctors;
      _filterGroup = 'Dokter'; // Reset radio button
    });
  }

  void _handleFilterChange(String? value) {
    if (value != null) {
      setState(() {
        _filterGroup = value;
      });
    }
  }

  void _applyFilters() {
    if (_filterGroup == 'Dokter') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FilterDokter(doctors: _filteredDoctors, hospital: widget.hospital),
        ),
      );
    } else if (_filterGroup == 'Spesialis') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListSpecialty(doctors: _doctors, hospital: widget.hospital)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: const Text('Filters', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                trailing: TextButton(
                  onPressed: _resetFilters,
                  child: const Text('Reset', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300)),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Urut berdasarkan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    RadioListTile<String>(
                      title: const Text('Dokter'),
                      value: 'Dokter',
                      groupValue: _filterGroup,
                      onChanged: _handleFilterChange,
                      activeColor: const Color(0xFFDE1A51), // Set the color of the radio button
                      controlAffinity: ListTileControlAffinity.trailing, // Position radio to the right
                    ),
                    RadioListTile<String>(
                      title: const Text('Spesialis'),
                      value: 'Spesialis',
                      groupValue: _filterGroup,
                      onChanged: _handleFilterChange,
                      activeColor: const Color(0xFFDE1A51), // Set the color of the radio button
                      controlAffinity: ListTileControlAffinity.trailing, // Position radio to the right
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()), // This pushes the button to the bottom
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: _applyFilters,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDE1A51),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Make the border square
                      ),
                    ),
                    child: const Text('Tampilkan Hasil'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Image.network(
                widget.hospital.imageUrl!,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 120),
            ],
          ),
        Positioned(
  top: 40,
  left: 16,
  child: GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: const CircleAvatar(
      backgroundColor: Color(0xFFDE1A51),
      child: Icon(Icons.arrow_back, color: Colors.white),
    ),
  ),
),
Positioned(
  top: 40,
  right: 16,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      GestureDetector(
        onTap: () {
          showMenu(
            context: context,
            position: const RelativeRect.fromLTRB(90, 80, 10, 0),
            items: [
              const PopupMenuItem(
                value: 'view_detail',
                child: Text('View Detail'),
              ),
            ],
            elevation: 5.0,
          ).then((value) {
            if(value == 'view_detail') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailRS(hospital: widget.hospital)
                ),
              );
            }
          });
        },
        child: const CircleAvatar(
          backgroundColor: Color(0xFFDE1A51),
          child: Icon(Icons.more_horiz, color: Colors.white),
        ),
      ),
    ],
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
                  widget.hospital.namaRS!,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.hospital.alamat!,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.hospital.telepon!,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 280,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Cari dokter...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search),
                    ),
                    onChanged: _filterDoctors,
                  ),
                ),
                const SizedBox(width: 10),
                Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: const Icon(Icons.filter_list),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDE1A51),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
  top: 320,
  left: 20,
  right: 20,
  bottom: 0,
  child: ListView.builder(
    itemCount: _filteredDoctors.length,
    itemBuilder: (context, index) {
      final doctor = _filteredDoctors[index];
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailDoctor(doctor: doctor),
            ),
          );
        },
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.network(
                  doctor.profileDoctor!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.nama!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        doctor.spesialis!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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