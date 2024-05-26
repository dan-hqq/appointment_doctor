import 'package:appointment_doctor/pages/patient/home_pasien.dart';
import 'package:appointment_doctor/pages/patient/profil_pasien.dart';
import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/doctor/home_dokter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreenPasien(),
      routes: {
        '/home': (context) => HomePasien(),
        '/riwayat': (context) => HomePasien(),
        '/profil': (context) => ProfilPasien(),
      },
    );
  }
}

class HomeScreenPasien extends StatefulWidget {
  @override
  _HomeScreenPasienState createState() => _HomeScreenPasienState();
}

class _HomeScreenPasienState extends State<HomeScreenPasien> {
  int _selectedIndex = 0;

  static const List<String> _routes = <String>[
    '/home',
    '/riwayat',
    '/profil',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _selectedIndex == 0
            ? HomeDokter()
            : _selectedIndex == 1
                ? HomeDokter()
                : HomeDokter(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat Konsultasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: Color(0xFFE91E63),
        onTap: _onItemTapped,
      ),
    );
  }
}
