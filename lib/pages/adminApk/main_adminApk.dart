import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/adminApk/home_admin_apk.dart';
import 'package:appointment_doctor/pages/adminApk/add_admin_rs.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreenAdminApk(),
      routes: {
        '/home': (context) => HomeAdminApk(),
        '/riwayat': (context) => AddAdminRS(),
        '/profil': (context) => AddAdminRS(),
      },
    );
  }
}

class HomeScreenAdminApk extends StatefulWidget {
  @override
  _HomeScreenAdminApkState createState() => _HomeScreenAdminApkState();
}

class _HomeScreenAdminApkState extends State<HomeScreenAdminApk> {
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
            ? HomeAdminApk()
            : _selectedIndex == 1
                ? AddAdminRS()
                : AddAdminRS(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
           
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
