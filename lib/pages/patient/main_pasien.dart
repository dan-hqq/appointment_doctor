import 'package:appointment_doctor/pages/patient/riwayat_appointment.dart';
import 'package:appointment_doctor/pages/patient/home_pasien.dart';
import 'package:appointment_doctor/pages/patient/profil_pasien.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppPasien extends StatefulWidget {
  const MyAppPasien({super.key});

  @override
  _MyAppPasienState createState() => _MyAppPasienState();
}

class _MyAppPasienState extends State<MyAppPasien> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = [
      HomePasien(),
      RiwayatAppointment(),
     ProfilPasien(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
              icon: Icon(Icons.history_outlined, color: Colors.white),
              selectedIcon: Icon(Icons.history, color: Colors.white),
              label: 'Riwayat Konsultasi',
              
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
  runApp(const MyAppPasien());
}
