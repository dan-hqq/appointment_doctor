import 'package:appointment_doctor/pages/doctor/riwayat_appointment.dart';
import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/doctor/home_dokter.dart';
import 'package:appointment_doctor/pages/doctor/profile_dokter.dart';

// void main() {
//   runApp(MyApp());
// }

class MyAppDoctor extends StatefulWidget {
  const MyAppDoctor({super.key});

  @override
  _MyAppDoctorState createState() => _MyAppDoctorState();
}

class _MyAppDoctorState extends State<MyAppDoctor> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    HomeDokter(),
    RiwayatAppointment(),
    ProfileDokter(),
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

// class MyAppDoctor extends StatelessWidget {
//   const MyAppDoctor({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const HomeScreenDoc(),
//       routes: {
//         '/home': (context) => const HomeDokter(),
//         '/riwayat': (context) => const RiwayatAppointment(),
//         '/profil': (context) => const ProfileDokter(),
//       },
//     );
//   }
// }

// class HomeScreenDoc extends StatefulWidget {
//   const HomeScreenDoc({super.key});

//   @override
//   _HomeScreenDocState createState() => _HomeScreenDocState();
// }

// class _HomeScreenDocState extends State<HomeScreenDoc> {
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
//                 ? const RiwayatAppointment()
//                 : const ProfileDokter(),
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
