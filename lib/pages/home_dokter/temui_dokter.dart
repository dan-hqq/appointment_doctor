import 'package:flutter/material.dart';

class TemuiDokter extends StatefulWidget {
  const TemuiDokter({super.key});

  @override
  State<TemuiDokter> createState() => _TemuiDokterState();
}

class _TemuiDokterState extends State<TemuiDokter> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Page Temui Dokter!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}