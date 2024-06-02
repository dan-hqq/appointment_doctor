import 'package:flutter/material.dart';

class DetailAppointment extends StatefulWidget {
  const DetailAppointment({super.key});

  @override
  State<DetailAppointment> createState() => _DetailAppointmentState();
}

class _DetailAppointmentState extends State<DetailAppointment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Page Detail Appointment!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
