import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/hospital/home_admin_rs.dart';
import 'package:appointment_doctor/pages/hospital/profile_admin_rs.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreenAdminRS(),
      routes: {
        '/home': (context) => HomeAdminRS(),
        '/riwayat': (context) => HomeAdminRS(),
        '/profil': (context) => ProfilAdminRS(),
      },
    );
  }
}

class HomeScreenAdminRS extends StatefulWidget {
  @override
  _HomeScreenAdminRSState createState() => _HomeScreenAdminRSState();
}

class _HomeScreenAdminRSState extends State<HomeScreenAdminRS> {
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
            ? HomeAdminRS()
            : _selectedIndex == 1
                ? HomeAdminRS()
                : ProfilAdminRS(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Undang Dokter',
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
