import 'package:flutter/material.dart';

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
          AppointmentList(status: 'Menunggu Konfirmasi', color: Colors.orange),
          AppointmentList(status: 'Diterima', color: Colors.green),
          AppointmentList(status: 'Selesai', color: Colors.blue),
          AppointmentList(status: 'Batal', color: Colors.red),
        ],
      ),
    );
  }
}

class AppointmentList extends StatelessWidget {
  final String status;
  final Color color;

  const AppointmentList({super.key, required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    // Daftar janji temu
    final List<Map<String, String>> appointments = [
      {
        'name': 'Jefri Rinantoro',
        'role': 'Pasien',
        'date': 'Selasa, 17 Juni 2024',
        'time': '17:00 PM'
      },
      // Tambahkan janji temu lainnya jika ada
    ];

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
          name: appointment['name']!,
          role: appointment['role']!,
          date: appointment['date']!,
          time: appointment['time']!,
          status: status,
          statusColor: color,
        );
      },
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String name;
  final String role;
  final String date;
  final String time;
  final String status;
  final Color statusColor;

  const AppointmentCard({
    super.key,
    required this.name,
    required this.role,
    required this.date,
    required this.time,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Implementasikan navigasi ke detail janji temu di sini
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
                    role,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
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
