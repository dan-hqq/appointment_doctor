import 'package:flutter/material.dart';

class ProfileDokter extends StatefulWidget {
  const ProfileDokter({super.key});

  @override
  State<ProfileDokter> createState() => _ProfileDokterState();
}

class _ProfileDokterState extends State<ProfileDokter> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Page Profile Dokter!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}