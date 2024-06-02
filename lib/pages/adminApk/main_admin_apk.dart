import 'package:appointment_doctor/pages/adminApk/profile_admin_apk.dart';
import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/adminApk/home_admin_apk.dart';
import 'package:appointment_doctor/pages/adminApk/add_admin_rs.dart';


// void main() {
//   runApp(MyApp());
// }

class MyAppAdminApk extends StatefulWidget {
  const MyAppAdminApk({super.key});

  @override
  _MyAppAdminApkState createState() => _MyAppAdminApkState();
}

class _MyAppAdminApkState extends State<MyAppAdminApk> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    HomeAdminApk(),
    AddAdminRS(),
    ProfileAdminApk(),
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
            label: '',
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

// class MyAppAdminApk extends StatelessWidget {
//   const MyAppAdminApk({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const HomeScreenAdminApk(),
//       routes: {
//         '/home': (context) => const HomeAdminApk(),
//         '/add-admin': (context) => const AddAdminRS(),
//         '/profil': (context) => const ProfileAdminApk(),
//       },
//     );
//   }
// }

// class HomeScreenAdminApk extends StatefulWidget {
//   const HomeScreenAdminApk({super.key});

//   @override
//   _HomeScreenAdminApkState createState() => _HomeScreenAdminApkState();
// }

// class _HomeScreenAdminApkState extends State<HomeScreenAdminApk> {
//   int _selectedIndex = 0;

//   static const List<String> _routes = <String>[
//     '/home',
//     '/add-admin',
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
//             ? const HomeAdminApk()
//             : _selectedIndex == 1
//                 ? const AddAdminRS()
//                 : const ProfileAdminApk(),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Beranda',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add),
//             label: ''
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
