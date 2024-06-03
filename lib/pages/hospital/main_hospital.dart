import 'package:appointment_doctor/pages/hospital/undang_dokter.dart';
import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/hospital/home_admin_rs.dart';
import 'package:appointment_doctor/pages/hospital/profile_admin_rs.dart';

class MyAppHospital extends StatefulWidget {
  const MyAppHospital({super.key});

  @override
  _MyAppHospitalState createState() => _MyAppHospitalState();
}

class _MyAppHospitalState extends State<MyAppHospital> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    HomeAdminRS(),
    UndangDokter(),
    ProfileAdminRS(),
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
            icon: Icon(Icons.add),
            label: 'Undang',
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

// class MyAppHospital extends StatelessWidget {
//   const MyAppHospital({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const HomeScreenAdminRS(),
//       routes: {
//         '/home': (context) => const HomeAdminRS(),
//         '/undang': (context) => const UndangDokter(),
//         '/profil': (context) => const ProfilAdminRS(),
//       },
//     );
//   }
// }

// class HomeScreenAdminRS extends StatefulWidget {
//   const HomeScreenAdminRS({super.key});

//   @override
//   _HomeScreenAdminRSState createState() => _HomeScreenAdminRSState();
// }

// class _HomeScreenAdminRSState extends State<HomeScreenAdminRS> {
//   int _selectedIndex = 0;

//   static const List<String> _routes = <String>[
//     '/home',
//     '/undang',
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
//             ? const HomeAdminRS()
//             : _selectedIndex == 1
//                 ? const UndangDokter()
//                 : const ProfilAdminRS(),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Beranda',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add),
//             label: 'Undang Dokter',
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
