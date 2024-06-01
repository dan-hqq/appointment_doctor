import 'package:appointment_doctor/pages/adminApk/detail_dokter.dart';
import 'package:appointment_doctor/pages/adminApk/detail_rs.dart';
import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/list_specialty.dart';
import 'package:appointment_doctor/pages/filter_dokter.dart';

class RSUHospitalScreen extends StatefulWidget {
  final String imageUrl;
  final String hospitalName;
  final String address;
  final String phoneNumber;

  const RSUHospitalScreen({super.key, 
    required this.imageUrl,
    required this.hospitalName,
    required this.address,
    required this.phoneNumber,
  });

  @override
  State<RSUHospitalScreen> createState() => _RSUHospitalScreenState();
}

class _RSUHospitalScreenState extends State<RSUHospitalScreen> {
  
  final TextEditingController _searchController = TextEditingController();
  List<Doctor> _doctors = [];
  List<Doctor> _filteredDoctors = [];
  String _filterGroup = 'Dokter'; // State variable for radio buttons

  @override
  void initState() {
    super.initState();
    _loadDoctors();
  }

  void _loadDoctors() {
    _doctors = getDoctors();
    _filteredDoctors = _doctors;
  }

  void _filterDoctors(String? query) {
    setState(() {
      if (query == null || query.isEmpty) {
        _filteredDoctors = _doctors;
      } else {
        _filteredDoctors = _doctors
            .where((doctor) =>
                doctor.name.toLowerCase().contains(query.toLowerCase()))
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
          builder: (context) => FilterDokter(doctors: _filteredDoctors),
        ),
      );
    } else if (_filterGroup == 'Spesialis') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListSpecialty()),
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
                title: Text('Filters', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                trailing: TextButton(
                  onPressed: _resetFilters,
                  child: Text('Reset', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300)),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Urut berdasarkan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    RadioListTile<String>(
                      title: Text('Dokter'),
                      value: 'Dokter',
                      groupValue: _filterGroup,
                      onChanged: _handleFilterChange,
                      activeColor: Color(0xFFDE1A51), // Set the color of the radio button
                      controlAffinity: ListTileControlAffinity.trailing, // Position radio to the right
                    ),
                    RadioListTile<String>(
                      title: Text('Spesialis'),
                      value: 'Spesialis',
                      groupValue: _filterGroup,
                      onChanged: _handleFilterChange,
                      activeColor: Color(0xFFDE1A51), // Set the color of the radio button
                      controlAffinity: ListTileControlAffinity.trailing, // Position radio to the right
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox()), // This pushes the button to the bottom
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: _applyFilters,
                    child: Text('Tampilkan Hasil'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDE1A51),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Make the border square
                      ),
                    ),
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
                widget.imageUrl,
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
  child: GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: CircleAvatar(
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
            position: RelativeRect.fromLTRB(90, 80, 10, 0),
            items: [
              PopupMenuItem(
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
                  builder: (context) => DetailRS(),
                ),
              );
            }
          });
        },
        child: CircleAvatar(
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
                  widget.hospitalName,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.address,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.phoneNumber,
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
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: _filterDoctors,
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
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DetailDoctor(),
          //   ),
          // );
        },
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.asset(
                  doctor.imageUrl,
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
                        doctor.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        doctor.specialty,
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

List<Doctor> getDoctors() {
  return [
    Doctor(
        name: 'Dr. Dodi Maulana',
        specialty: 'Dokter Umum',
        imageUrl: 'assets/images/doctor1.png'),
    Doctor(
        name: 'Dr. Siti Azizah',
        specialty: 'Sp. Penyakit Dalam',
        imageUrl: 'assets/images/doctor2.png'),
    Doctor(
        name: 'Dr. Carla Levara',
        specialty: 'Sp. Kulit & Kelamin',
        imageUrl: 'assets/images/doctor3.png'),
    Doctor(
        name: 'Dr. Hendry Agus',
        specialty: 'Sp. Gizi Klinik',
        imageUrl: 'assets/images/doctor4.png'),
    Doctor(
        name: 'Dr. Endang Pratiwi',
        specialty: 'Sp. Kandungan',
        imageUrl: 'assets/images/doctor5.png'),
  ];
}