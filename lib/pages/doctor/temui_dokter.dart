import 'package:appointment_doctor/backend/appointment/doctor_appointment.dart';
import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/doctor/detail_appointment.dart';
import 'package:intl/intl.dart';

class TemuiDokter extends StatefulWidget {
  const TemuiDokter({super.key});

  @override
  State<TemuiDokter> createState() => _TemuiDokterState();
}

class _TemuiDokterState extends State<TemuiDokter> {

  late Future<List<Map<String, dynamic>>> _appointmentsFuture;

  @override
  void initState() {
    super.initState();
    _loadAppointments();
  }

  void _loadAppointments() {
    _appointmentsFuture = DoctorAppointment.getAllAppointments('pending');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: const Color(0xFFDE1A51),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const Text(
          ' Booking Dokter ',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _appointmentsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> appointments = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> appointment = appointments[index];
                return PatientCard(
                  name: appointment['patientName'],
                  date: DateFormat('EEEE, d MMMM y', 'id_ID').format(appointment['date'].toDate()),
                  realDate: appointment['date'].toDate(),
                  time: appointment['time'],
                  hospitalId: appointment['hospitalId'],
                  doctorId: appointment['doctorId'],
                  userId: appointment['userId'],
                  status: 'Pending',
                  keluhan: appointment['keluhan']
                );
              },
            );
          }
        },
      )
    );
  }
}

class PatientCard extends StatelessWidget {
  final String name;
  final String date;
  final DateTime realDate;
  final String time;
  final String hospitalId;
  final String doctorId;
  final String userId;
  final String status;
  final String keluhan;

  const PatientCard({
    required this.name,
    required this.date,
    required this.realDate,
    required this.time,
    required this.hospitalId,
    required this.doctorId,
    required this.userId,
    required this.status,
    required this.keluhan
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailAppointment(name: name, date: date,time: time, hospitalId: hospitalId,doctorId: doctorId,userId: userId,status: status, keluhan: keluhan, realDate: realDate,),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade300, width: 1.0),
        ),
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                    'assets/images/profile.png'), // Ganti dengan path gambar avatar yang sesuai
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: const Color(
                            0xFFFFE0B2), // Warna background label "Menunggu Konfirmasi"
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text(
                        'Menunggu Konfirmasi',
                        style: TextStyle(
                          color: Color(
                              0xFFFFA726), // Warna teks label "Menunggu Konfirmasi"
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '$date | $time',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
