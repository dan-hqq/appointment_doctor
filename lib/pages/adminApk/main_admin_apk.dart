import 'package:appointment_doctor/pages/adminApk/add_dokter.dart';
import 'package:appointment_doctor/pages/adminApk/add_rs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appointment_doctor/pages/adminApk/profile_admin_apk.dart';
import 'package:appointment_doctor/pages/adminApk/home_admin_apk.dart';

class MyAppAdminApk extends StatefulWidget {
  const MyAppAdminApk({super.key});

  @override
  _MyAppAdminApkState createState() => _MyAppAdminApkState();
}

class _MyAppAdminApkState extends State<MyAppAdminApk> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    HomeAdminApk(),
    HomeAdminApk(),
    ProfileAdminApk(),
  ];

  void _onItemTapped(int index) {
    if (index == 1) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E63),
                  ),
                  onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TambahRS(),
                    ),
                  );
                },
                  child: Text(
                    'Tambah Rumah Sakit',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E63),
                  ),
                  onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddDoctorPage(title: 'Tambah Dokter',),
                    ),
                  );
                },
                  child: Text(
                    'Tambah Dokter',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Widget _buildScreen() {
    return _screens.elementAt(_selectedIndex);
  }

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _buildScreen(),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: _onItemTapped,
          selectedIndex: _selectedIndex,
          indicatorColor: Color(0xFFE78895), // Ganti warna indikator
          height: 60,
          backgroundColor: const Color(0xFFDE1A51),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: const <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: Colors.white),
              selectedIcon: Icon(Icons.home, color: Colors.white),
              label: 'Beranda',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_outlined, color: Colors.white),
              selectedIcon: Icon(Icons.add, color: Colors.white),
              label: '',
              
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline, color: Colors.white),
              selectedIcon: Icon(Icons.person, color: Colors.white),
              label: 'Profil',
            ),
          ],
        ),
      ),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(), // Atur font family
      ),
    );
  }
}

void main() {
  runApp(const MyAppAdminApk());
}

