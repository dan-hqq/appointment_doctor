import 'package:appointment_doctor/backend/auth/auth.dart';
import 'package:appointment_doctor/model/user_model.dart';
// import 'package:appointment_doctor/pages/patient/edit_profil_pasien.dart';
// import 'package:appointment_doctor/pages/patient/location_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProfilPasien extends StatefulWidget {
  const ProfilPasien({super.key});

  @override
  State<ProfilPasien> createState() => _ProfilPasien();
}

class _ProfilPasien extends State<ProfilPasien> {
  String _imagePath = '';
  final Auth _auth = Get.put(Auth());
  UserModel user = UserModel.empty();
  LatLng? _selectedLocation;

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
    // _loadLocation();
  }

  void fetchUserDetails() async {
    final fetchuser = await UserModel.getUserDetails();
    setState(() {
      user = fetchuser;
    });
  }

  void _onChangeImagePath(String path) {
    setState(() {
      _imagePath = path;
    });
  }

  // void _loadLocation() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final double? lat = prefs.getDouble('latitude');
  //   final double? lng = prefs.getDouble('longitude');
  //   if (lat != null && lng != null) {
  //     setState(() {
  //       _selectedLocation = LatLng(lat, lng);
  //     });
  //   }
  // }

  // void _pickLocation() async {
  //   final selectedLocation = await Navigator.of(context).push<LatLng>(
  //     MaterialPageRoute(
  //       builder: (ctx) => LocationPicker(),
  //     ),
  //   );
  //   if (selectedLocation != null) {
  //     setState(() {
  //       _selectedLocation = selectedLocation;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Profil",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                final picker = ImagePicker();
                final pickedImage = await picker.pickImage(source: ImageSource.gallery);
                if (pickedImage != null) {
                  File imageFile = File(pickedImage.path);
                  _onChangeImagePath(imageFile.path);
                }
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFDE1A51),
                    width: 3,
                  ),
                ),
                child: ClipOval(
                  child: _imagePath.isNotEmpty
                      ? Image.file(
                          File(_imagePath),
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/profil.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              user.fullName ?? "Loading",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "ID : ${FirebaseAuth.instance.currentUser!.uid}",
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.location_on,
                    color: Color(0xFFDE1A51),
                  ),
                  title: const Text(
                    "Alamat",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: _selectedLocation == null
                      ? const Text("Pilih Lokasi")
                      : Text("Lat: ${_selectedLocation!.latitude}, Lng: ${_selectedLocation!.longitude}"),
                  // onTap: _pickLocation,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      _auth.logout();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFDE1A51),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const ListTile(
                          title: Center(
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
