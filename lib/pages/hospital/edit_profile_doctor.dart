import 'dart:io';
import 'package:appointment_doctor/backend/doctor/complete_biodata_doctor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class EditProfileDoctor extends StatefulWidget {
  const EditProfileDoctor({super.key});

  @override
  State<EditProfileDoctor> createState() => _EditProfileDoctorState();
}

class _EditProfileDoctorState extends State<EditProfileDoctor> {
  Specialty? selectedSpecialty;
  late String? nama;
  late String? email;
  late String? password;
  late String? telepon;
  late int? gender = 1;
  late String? profileDoctor = '';
  bool isSaving = false;
  late List<String> hariPraktek = [];
  TimeOfDay? waktuPraktekMulai;
  TimeOfDay? waktuPraktekSelesai;

  final List<String> jadwalPraktek = [
    'Minggu',
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
  ];

  void _onChangeImagePath(String newPath) {
    setState(() {
      profileDoctor = newPath;
    });
  }

  void _showValidationMessage(String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
      ),
    );
  }

  void _selectedTime(bool isStart) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: isStart
          ? waktuPraktekMulai ?? TimeOfDay.now()
          : waktuPraktekSelesai ?? TimeOfDay.now(),
    );

    if (newTime != null) {
      setState(() {
        if (isStart) {
          waktuPraktekMulai = newTime;
        } else {
          waktuPraktekSelesai = newTime;
        }
      });
    }
  }

  void _saveData() async {
    if (selectedSpecialty == null) {
      _showValidationMessage('Spesialis tidak boleh kosong');
      return;
    }
    if (nama == null || nama!.isEmpty) {
      _showValidationMessage('Nama tidak boleh kosong');
      return;
    }
    if (email == null || email!.isEmpty) {
      _showValidationMessage('Email tidak boleh kosong');
      return;
    }
    if (password == null || password!.isEmpty) {
      _showValidationMessage('Password tidak boleh kosong');
      return;
    }
    if (telepon == null || telepon!.isEmpty) {
      _showValidationMessage('Telepon tidak boleh kosong');
      return;
    }
    if (hariPraktek.isEmpty) {
      _showValidationMessage('jadwal hari praktek tidak boleh kosong');
      return;
    }
    if (waktuPraktekMulai == null && waktuPraktekSelesai == null) {
      _showValidationMessage('jsdwal waktu praktek tidak boleh kosong');
      return;
    }
    if (profileDoctor == null || profileDoctor!.isEmpty) {
      _showValidationMessage('Foto profil tidak boleh kosong');
      return;
    }

    setState(() {
      isSaving = true;
    });

    final biodataDoctor = CompleteBiodataDoctor(
      nama: nama!,
      spesialis: selectedSpecialty!.name,
      telepon: telepon!,
      gender: gender!,
      profileDoctor: profileDoctor!,
    );

    await biodataDoctor.compleBiodataDoctor(context);

    setState(() {
      isSaving = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          'Lengkapi Biodata',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Center(
              child: GestureDetector(
                onTap: () async {
                  final picker = ImagePicker();
                  final pickedImage =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    File imageFile = File(pickedImage.path);
                    _onChangeImagePath(imageFile.path);
                  }
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFDE1A51),
                      width: 3,
                    ),
                  ),
                  child: Center(
                    child: profileDoctor!.isNotEmpty
                        ? Image.file(
                            File(profileDoctor!),
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          )
                        : const Icon(
                            Icons.add_photo_alternate,
                            size: 50,
                            color: Colors.grey,
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Tambahkan Foto',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Spesialis',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<Specialty>(
                  decoration: InputDecoration(
                    labelText: 'Pilih Spesialis',
                    labelStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  value: selectedSpecialty,
                  items: getSpecialties().map((Specialty specialty) {
                    return DropdownMenuItem<Specialty>(
                      value: specialty,
                      child: Row(
                        children: [
                          Image.asset(specialty.imageUrl,
                              width: 24, height: 24),
                          const SizedBox(width: 10),
                          Text(specialty.name,
                              style: const TextStyle(
                                  fontFamily: 'Poppins', fontSize: 16)),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (Specialty? value) {
                    setState(() {
                      selectedSpecialty = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Nama',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Masukkan nama',
                    labelStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      nama = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Email',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Masukkan email',
                    labelStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'password',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Masukkan password',
                    labelStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Telepon',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Masukkan nomor telepon',
                    labelStyle: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      telepon = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Jenis Kelamin',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
                Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: gender,
                      onChanged: (int? value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                    const Text('Laki-laki',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                    Radio<int>(
                      value: 0,
                      groupValue: gender,
                      onChanged: (int? value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                    const Text('Perempuan',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 10),
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
                          selected: hariPraktek.contains(jadwal),
                          selectedColor: const Color(0xFFDE1A51),
                          onSelected: (bool selected) {
                            setState(() {
                              if (selected) {
                                hariPraktek.add(jadwal);
                              } else {
                                hariPraktek.remove(jadwal);
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
                              waktuPraktekMulai?.format(context) ?? '00:00',
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
                            child: Text(waktuPraktekSelesai?.format(context) ??
                                '00:00'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isSaving ? null : _saveData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDE1A51),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: isSaving
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : const Text(
                                'Simpan',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Specialty {
  final String name;
  final String imageUrl;

  Specialty({
    required this.name,
    required this.imageUrl,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    return other is Specialty &&
        other.name == name &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => name.hashCode ^ imageUrl.hashCode;
}

List<Specialty> getSpecialties() {
  return [
    Specialty(name: 'Kulit', imageUrl: 'assets/images/kulit.png'),
    Specialty(name: 'Anak', imageUrl: 'assets/images/anak.png'),
    Specialty(name: 'Dokter Umum', imageUrl: 'assets/images/dokter_umum.png'),
    Specialty(
        name: 'Penyakit Dalam', imageUrl: 'assets/images/penyakit_dalam.png'),
    Specialty(
        name: 'Psikologi Klinis',
        imageUrl: 'assets/images/psikologi_klinis.png'),
    Specialty(name: 'COVID-19', imageUrl: 'assets/images/covid19.png'),
    Specialty(name: 'Gizi Klinik', imageUrl: 'assets/images/gizi_klinik.png'),
    Specialty(name: 'Kandungan', imageUrl: 'assets/images/kandungan.png'),
    Specialty(name: 'Dokter Hewan', imageUrl: 'assets/images/hewan.png'),
    Specialty(name: 'THT', imageUrl: 'assets/images/tht.png'),
    Specialty(name: 'Konsultasi', imageUrl: 'assets/images/konsultasi.png'),
    Specialty(name: 'Gigi', imageUrl: 'assets/images/gigi.png'),
    Specialty(name: 'Psikiater', imageUrl: 'assets/images/psikiater.png'),
    Specialty(name: 'Seksologi', imageUrl: 'assets/images/seksologi.png'),
    Specialty(name: 'Bedah', imageUrl: 'assets/images/bedah.png'),
    Specialty(name: 'Saraf', imageUrl: 'assets/images/saraf.png'),
    Specialty(name: 'Jantung', imageUrl: 'assets/images/jantung.png'),
    Specialty(name: 'Laktasi', imageUrl: 'assets/images/laktasi.png'),
    Specialty(
        name: 'Program Hamil', imageUrl: 'assets/images/program_hamil.png'),
    Specialty(name: 'Mata', imageUrl: 'assets/images/mata.png'),
    Specialty(name: 'Paru', imageUrl: 'assets/images/paru.png'),
    Specialty(name: 'Fisioterapi', imageUrl: 'assets/images/fisioterapi.png'),
    Specialty(name: 'Medikolegal', imageUrl: 'assets/images/medikolegal.png'),
    Specialty(name: 'Talk Therapy', imageUrl: 'assets/images/talk_therapy.png'),
    Specialty(
        name: 'Pemeriksaan Lab', imageUrl: 'assets/images/pemeriksaan_lab.png'),
    Specialty(name: 'Bidanku', imageUrl: 'assets/images/bidanku.png'),
    Specialty(
        name: 'Layanan Kontrasepsi',
        imageUrl: 'assets/images/layanan_kontrasepsi.png'),
  ];
}
