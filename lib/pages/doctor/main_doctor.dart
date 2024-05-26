import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/doctor/home_dokter.dart';
import 'package:appointment_doctor/pages/doctor/profile_dokter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreenDoc(),
      routes: {
        '/home': (context) => HomeDokter(),
        '/riwayat': (context) => HomeDokter(),
        '/profil': (context) => ProfileDokter(),
      },
    );
  }
}

class HomeScreenDoc extends StatefulWidget {
  @override
  _HomeScreenDocState createState() => _HomeScreenDocState();
}

class _HomeScreenDocState extends State<HomeScreenDoc> {
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
                : ProfileDokter(),
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
