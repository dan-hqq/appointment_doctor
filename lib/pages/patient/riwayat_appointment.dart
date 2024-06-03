import 'package:appointment_doctor/backend/appointment/patient_appointment.dart';
import 'package:appointment_doctor/pages/patient/detail_appointment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RiwayatAppointment extends StatefulWidget {
  const RiwayatAppointment({super.key});

  @override
  State<RiwayatAppointment> createState() => _RiwayatAppointmentState();
}

class _RiwayatAppointmentState extends State<RiwayatAppointment>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Konsultasi',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.pink,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.pink,
          tabs: const [
            Tab(text: 'Pending'),
            Tab(text: 'Diterima'),
            Tab(text: 'Selesai'),
            Tab(text: 'Batal'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AppointmentList(status: 'Pending', color: Colors.orange),
          AppointmentList(status: 'Diterima', color: Colors.green),
          AppointmentList(status: 'Selesai', color: Colors.blue),
          AppointmentList(status: 'Batal', color: Colors.red),
        ],
      ),
    );
  }
}

class AppointmentList extends StatefulWidget {
  final String status;
  final Color color;

  const AppointmentList({super.key, required this.status, required this.color});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  List<Map<String, dynamic>> appointments = [];
  
  @override
  void initState() {
    super.initState();
    fetchAppointments(widget.status);
  }

  void fetchAppointments(String status) async {
    final resultAppointments = await PatientAppointment.getAllAppointments(status);
    setState(() {
      appointments = resultAppointments;
    });
    print(status);
    print(appointments);
  }

  @override
  Widget build(BuildContext context) {
    // Daftar janji temu

    // Tampilkan teks jika tidak ada janji temu
    if (appointments.isEmpty) {
      return Center(
        child: Text(
          'Belum ada janji temu.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return AppointmentCard(
          name: appointment['patientName'],
          date: DateFormat('EEEE, d MMMM y', 'id_ID').format(appointment['date'].toDate()),
          realDate: appointment['date'].toDate(),
          time: appointment['time'],
          hospitalId: appointment['hospitalId'],
          doctorId: appointment['doctorId'],
          userId: appointment['userId'],
          keluhan: appointment['keluhan'],
          note: appointment['note'],
          status: widget.status,
          statusColor: widget.color,
        );
      },
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String name;
  final String date;
  final DateTime realDate;
  final String time;
  final String hospitalId;
  final String doctorId;
  final String userId;
  final String status;
  final String keluhan;
  final String? note;
  final Color statusColor;

  const AppointmentCard({
    super.key,
    required this.name,
    required this.date,
    required this.realDate,
    required this.time,
    required this.hospitalId,
    required this.doctorId,
    required this.userId,
    required this.status,
    required this.keluhan,
    this.note,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Implementasikan navigasi ke detail janji temu di sini
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailAppointment(name: name, date: date,time: time, hospitalId: hospitalId,doctorId: doctorId,userId: userId,status: status, keluhan: keluhan, realDate: realDate, note: note,),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade300, width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
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
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
