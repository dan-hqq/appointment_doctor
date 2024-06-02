import 'package:flutter/material.dart';


class DoctorListPage extends StatefulWidget {
  final String title;

  DoctorListPage({required this.title});

  @override
  _DoctorListPageState createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  final List<Map<String, String>> doctors = [
    {
      "name": "Dr. Dodi Maulana",
      "specialty": "Umum",
      "phone": "+62 123 4567890",
      "image": "assets/images/dokter.png" // replace with actual image URL
    },
    {
      "name": "Dr. Hendry Agus",
      "specialty": "Bedah",
      "phone": "+62 987 6543210",
      "image": "assets/images/dokter.png" // replace with actual image URL
    },
    {
      "name": "Dr. Yono Bakrie",
      "specialty": "Bedah",
      "phone": "+62 987 6543210",
      "image": "assets/images/dokter.png" // replace with actual image URL
    },
    {
      "name": "Dr. Abdullah Majid",
      "specialty": "Bedah",
      "phone": "+62 987 6543210",
      "image": "assets/images/dokter.png" // replace with actual image URL
    },
    {
      "name": "Dr. Ahmad Dzkrie",
      "specialty": "Bedah",
      "phone": "+62 987 6543210",
      "image": "assets/images/dokter.png" // replace with actual image URL
    },
     {
      "name": "Dr. Budie Goenadi",
      "specialty": "Bedah",
      "phone": "+62 987 6543210",
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
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
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
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Cari dokter...',
                prefixIcon: Icon(Icons.search),
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
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(8),
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
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                doctor['specialty']!,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                doctor['phone']!,
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}