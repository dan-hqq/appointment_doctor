import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UndangDokter extends StatefulWidget {
  const UndangDokter({super.key});

  @override
  State<UndangDokter> createState() => _UndangDokterState();
}

class _UndangDokterState extends State<UndangDokter> {
  late String _id;
  final List<String> _hariDipilih = [];
  TimeOfDay? _waktuPraktekMulai;
  TimeOfDay? _waktuPraktekSelesai;

  final List<String> jadwalPraktek = [
    'Minggu',
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
  ];

  void _selectedTime(bool isStart) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: isStart
          ? _waktuPraktekMulai ?? TimeOfDay.now()
          : _waktuPraktekSelesai ?? TimeOfDay.now(),
    );

    if (newTime != null) {
      setState(() {
        if (isStart) {
          _waktuPraktekMulai = newTime;
        } else {
          _waktuPraktekSelesai = newTime;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Undang Dokter',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              'ID Dokter',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Masukkan ID Dokter',
                labelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(8), // Menambahkan border radius
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _id = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: Text(
                'Jadwal Praktek',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              children: [
                Wrap(
                  spacing: 8,
                  children: jadwalPraktek.map((jadwal) {
                    return ChoiceChip(
                      label: Text(jadwal),
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 14,
                      ),
                      selected: _hariDipilih.contains(jadwal),
                      selectedColor: const Color(0xFFDE1A51),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            _hariDipilih.add(jadwal);
                          } else {
                            _hariDipilih.remove(jadwal);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => _selectedTime(true),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          _waktuPraktekMulai?.format(context) ?? '00:00',
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _selectedTime(false),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                            _waktuPraktekSelesai?.format(context) ?? '00:00'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_hariDipilih.isNotEmpty &&
                      _waktuPraktekMulai != null &&
                      _waktuPraktekSelesai != null) {
                    // Fungsi untuk menyimpan data
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Peringatan'),
                        content: const Text(
                            'Harap isi semua field terlebih dahulu.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDE1A51),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Simpan',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
