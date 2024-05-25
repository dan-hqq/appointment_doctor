
import 'package:appointment_doctor/pages/adminApk/add_admin_rs.dart';
import 'package:appointment_doctor/pages/hospital/home_admin_aplikasi.dart';
import 'package:appointment_doctor/pages/hospital/home_admin_rs.dart';
import 'package:appointment_doctor/pages/doctor/home_dokter.dart';
import 'package:appointment_doctor/pages/patient/home_pasien.dart';
import 'package:appointment_doctor/pages/patient/profil_pasien.dart';
import 'package:appointment_doctor/pages/hospital/profile_admin_rs.dart';
import 'package:flutter/material.dart';


void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Navigation(),
    );
  }
}

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;

  final List<Widget> _pages = [
    HomeAdminApk(),
    AddAdminRS(),
    ProfilPasien(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDE1A51),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFDE1A51),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: currentPageIndex,
        onTap: _onItemTapped,
        selectedIconTheme: IconThemeData(color: Colors.white, size: 30.0),
        unselectedIconTheme: IconThemeData(color: Colors.white.withOpacity(0.5), size: 24.0),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Tambah Admin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
      body: _pages[currentPageIndex],
    );
  }
}