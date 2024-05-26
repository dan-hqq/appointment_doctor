import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/home_dokter/homepage_dokter.dart';

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
        '/riwayat': (context) => RiwayatKonsul(), // Update with the correct class for Riwayat Konsultasi
        '/profil': (context) => Profil(), // Update with the correct class for Profil
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
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            HomeDokter(),
            RiwayatKonsul(), // Ensure this is the correct widget for Riwayat Konsultasi
            Profil(), // Ensure this is the correct widget for Profil
          ],
        ),
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

class HomeDokter extends StatelessWidget {
  const HomeDokter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halo, John Doe!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              height: 210,
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Image.asset(
                  'assets/images/gambar.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 7.0),
              child: Text(
                "Menu",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Image.asset(
                      'assets/images/temuidokter.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Image.asset(
                      'assets/images/chatdokter.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Example classes for RiwayatKonsul and Profil
class RiwayatKonsul extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Riwayat Konsultasi Page"),
      ),
    );
  }
}

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profil Page"),
      ),
    );
  }
}
