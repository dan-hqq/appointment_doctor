import 'package:appointment_doctor/pages/patient/home_pasien.dart';
import 'package:appointment_doctor/pages/patient/profil_pasien.dart';
import 'package:appointment_doctor/pages/patient/riwayat_konsultasi.dart';
import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/doctor/home_dokter.dart';

// void main() {
//   runApp(MyApp());
// }

class MyAppPasien extends StatefulWidget {
  const MyAppPasien({super.key});

  @override
  _MyAppPasienState createState() => _MyAppPasienState();
}

class _MyAppPasienState extends State<MyAppPasien> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    const HomePasien(),
    const RiwayatKonsultasi(),
    ProfilPasien()
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
    return Scaffold(
      body: _buildScreen(),
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
        backgroundColor: const Color(0xFFE91E63),
        onTap: _onItemTapped,
      ),
    );
  }
}

// class MyAppPasien extends StatelessWidget {
//   const MyAppPasien({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const HomeScreenPasien(),
//       routes: {
//         '/home': (context) => const HomePasien(),
//         '/riwayat': (context) => const RiwayatKonsultasi(),
//         '/profil': (context) => ProfilPasien(),
//       },
//     );
//   }
// }

// class HomeScreenPasien extends StatefulWidget {
//   const HomeScreenPasien({super.key});

//   @override
//   _HomeScreenPasienState createState() => _HomeScreenPasienState();
// }

// class _HomeScreenPasienState extends State<HomeScreenPasien> {
//   int _selectedIndex = 0;

//   static const List<String> _routes = <String>[
//     '/home',
//     '/riwayat',
//     '/profil',
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     Navigator.pushNamed(context, _routes[index]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _selectedIndex == 0
//             ? const HomeDokter()
//             : _selectedIndex == 1
//                 ? const RiwayatKonsultasi()
//                 : const HomeDokter(),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Beranda',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'Riwayat Konsultasi',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profil',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white70,
//         backgroundColor: const Color(0xFFE91E63),
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
