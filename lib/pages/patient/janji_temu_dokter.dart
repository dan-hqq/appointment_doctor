import 'package:appointment_doctor/pages/doctor/detail_appointment.dart';
import 'package:flutter/material.dart';

class JanjiTemuDokter extends StatefulWidget {
  final String title;

  const JanjiTemuDokter({Key? key, required this.title}) : super(key: key);

  @override
  _JanjiTemuDokterState createState() => _JanjiTemuDokterState();
}

class _JanjiTemuDokterState extends State<JanjiTemuDokter> {
  String selectedDay = 'Rab';
  String selectedDate = '18';
  String selectedTime = '17:00';
  List<Map<String, String>> visitDates = [
    {'day': 'Sel', 'date': '17'},
    {'day': 'Rab', 'date': '18'},
    {'day': 'Kam', 'date': '19'},
    {'day': 'Jum', 'date': '24'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFDE1A51),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/doctor1.png'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Carla Levara',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Sp. Kulit & Kelamin',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.pink),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lokasi Praktek',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'RSU Siloam Surabaya\nJl. Raya Gubeng No.70 Surabaya',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Tanggal Kunjungan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                ...visitDates.map((date) => _buildDateChip(context, date['day']!, date['date']!)).toList(),
                _buildDateChip(context, 'Jun', '', isIcon: true),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Waktu Kunjungan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                _buildTimeChip(context, '16:00'),
                _buildTimeChip(context, '17:00'),
                _buildTimeChip(context, '18:00'),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailAppointment(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Buat Janji',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateChip(BuildContext context, String day, String date, {bool isIcon = false}) {
    bool isSelected = selectedDay == day && selectedDate == date;
    return ChoiceChip(
      label: isIcon
          ? Icon(Icons.calendar_today, color: isSelected ? Colors.white : Colors.black)
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(day, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontSize: 12)),
                if (date.isNotEmpty)
                  Text(date, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontSize: 12)),
              ],
            ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          if (isIcon) {
            _selectDate(context);
          } else {
            selectedDay = day;
            selectedDate = date;
          }
        });
      },
      selectedColor: Colors.pink,
      backgroundColor: Colors.grey[200],
      labelPadding: EdgeInsets.symmetric(vertical: isIcon ? 4 : 4, horizontal: 8),
      showCheckmark: false,
    );
  }

  Widget _buildTimeChip(BuildContext context, String time) {
    bool isSelected = selectedTime == time;
    return ChoiceChip(
      label: Text(
        time,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontSize: 12),
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          selectedTime = time;
        });
      },
      selectedColor: Colors.pink,
      backgroundColor: Colors.grey[200],
      labelPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      showCheckmark: false,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        String newDay = _getDayOfWeek(picked.weekday);
        String newDate = picked.day.toString();
        visitDates.add({'day': newDay, 'date': newDate});
      });
    }
  }

  String _getDayOfWeek(int day) {
    switch (day) {
      case 1:
        return 'Sen';
      case 2:
        return 'Sel';
      case 3:
        return 'Rab';
      case 4:
        return 'Kam';
      case 5:
        return 'Jum';
      case 6:
        return 'Sab';
      case 7:
        return 'Min';
      default:
        return '';
    }
  }
}
