import 'package:flutter/material.dart';

class ProfilAdminRS extends StatefulWidget {
  const ProfilAdminRS({super.key});

  @override
  State<ProfilAdminRS> createState() => _ProfilAdminRSState();
}

class _ProfilAdminRSState extends State<ProfilAdminRS> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Ini profile!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}