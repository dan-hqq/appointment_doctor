import 'package:flutter/material.dart';

class RiwayatKonsultasi extends StatefulWidget {
  const RiwayatKonsultasi({super.key});

  @override
  State<RiwayatKonsultasi> createState() => _RiwayatKonsultasiState();
}

class _RiwayatKonsultasiState extends State<RiwayatKonsultasi> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Riwayat Konsultasi!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}