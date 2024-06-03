import 'package:appointment_doctor/backend/appointment/doctor_appointment.dart';
import 'package:appointment_doctor/model/hospital_model.dart';
import 'package:flutter/material.dart';
import 'package:appointment_doctor/pages/doctor/detail_appointment.dart';
import 'package:intl/intl.dart';

class KonsulDokter extends StatefulWidget {
  const KonsulDokter({super.key});

  @override
  State<KonsulDokter> createState() => _KonsulDokterState();
}

class _KonsulDokterState extends State<KonsulDokter> {
  late Future<List<Map<String, dynamic>>> _appointmentsFuture;

  @override
  void initState() {
    super.initState();
    _loadAppointments();
  }

  void _loadAppointments() {
    _appointmentsFuture = DoctorAppointment.getAllAppointments('Diterima');
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFDE1A51),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
          },
        ),
        title: const Text(
          'Konsultasi Mendatang',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
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
                  status: 'Diterima',
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

class PatientCard extends StatefulWidget {
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
  State<PatientCard> createState() => _PatientCardState();
}

class _PatientCardState extends State<PatientCard> {
  HospitalModel hospital = HospitalModel.empty();

  @override
  void initState() {
    super.initState();

  }

  void fetchDetailHospital() async {
    final fetchHospital = await HospitalModel.getHospitalDetailsWithId(widget.hospitalId);
    setState(() {
      hospital = fetchHospital;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailAppointment(name: widget.name, date: widget.date,time: widget.time, hospitalId: widget.hospitalId,doctorId: widget.doctorId,userId: widget.userId,status: widget.status, keluhan: widget.keluhan, realDate: widget.realDate,)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade300, width: 1.0),
          boxShadow: [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              hospital.namaRS!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(hospital.alamat!),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tanggal Kunjungan:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.date),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Waktu Kunjungan:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.time),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
