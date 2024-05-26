import 'package:flutter/material.dart';

class RiwayatAppointment extends StatefulWidget {
  const RiwayatAppointment({super.key});

  @override
  State<RiwayatAppointment> createState() => _RiwayatAppointmentState();
}

class _RiwayatAppointmentState extends State<RiwayatAppointment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Page Riwayat Appointment!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}