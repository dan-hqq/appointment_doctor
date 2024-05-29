import 'package:flutter/material.dart';

class UndangDokter extends StatefulWidget {
  const UndangDokter({super.key});

  @override
  State<UndangDokter> createState() => _UndangDokterState();
}

class _UndangDokterState extends State<UndangDokter> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Udang Dokter Page!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}