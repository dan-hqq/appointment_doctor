
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Map<String, int> dayStringToInt = {
  "Senin": 1,
  "Selasa": 2,
  "Rabu": 3,
  "Kamis": 4,
  "Jumat": 5,
  "Sabtu": 6,
  "Minggu": 7
};

Map<int, String> dayIntToString = {
  1: "Senin",
  2: "Selasa",
  3: "Rabu",
  4: "Kamis",
  5: "Jumat",
  6: "Sabtu",
  7: "Minggu"
};

class ScheduleHospitalModel {
  final String? id;
  final Map<String, Map<String, List< String > > >? doctorsSchedule;

  const ScheduleHospitalModel({
    this.id,
    this.doctorsSchedule
  });

  static Future<void> inviteDoctor(String doctorId, Map<String, List<String>> doctorSchedule) async {
    
    Map<String, Map<String, List<String>>> currentSchedule = await fetchCurrentSchedule();

    if (!currentSchedule.containsKey(doctorId)) {
      currentSchedule[doctorId] = {};
    }

    doctorSchedule.forEach((day, times) {
      if (currentSchedule[doctorId]!.containsKey(day)) {
        currentSchedule[doctorId]![day]!.addAll(times);
      } else {
        currentSchedule[doctorId]![day] = times;
      }
    });

    currentSchedule.forEach((doctorId, schedule) {
      schedule.forEach((day, times) {
        times = times.toSet().toList()..sort();
        schedule[day] = times;
      });
    });

    await saveUpdatedSchedule(currentSchedule);
  }

  static Future<Map<String, Map<String, List<String>>>> fetchCurrentSchedule() async {

    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection('schedules')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (!docSnapshot.exists) {
      return {};
    }

    Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
    Map<String, Map<String, List<String>>> schedule = {};

    data.forEach((doctorId, scheduleData) {
      Map<String, List<String>> doctorSchedule = {};
      (scheduleData as Map<String, dynamic>).forEach((day, times) {
        doctorSchedule[day] = List<String>.from(times);
      });
      schedule[doctorId] = doctorSchedule;
    });

    return schedule;
  }


  static Future<void> saveUpdatedSchedule(Map<String, Map<String, List<String>>> updatedSchedule) async {
    await FirebaseFirestore.instance
      .collection('schedules')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .set(updatedSchedule);
  }

  static Future<List<int>> getShiftDays(String doctorId, String hospitalId) async {
    
    List<int> shiftDays = [];
    
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
      .collection('schedules')
      .doc(hospitalId)
      .get();

    Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

    if (data.containsKey(doctorId)) {
      data[doctorId]!.forEach((day, times) {
        if(times.length > 0){
          shiftDays.add(dayStringToInt[day]!);
        }
      });
    }

    print(data);
    print(shiftDays);

    return shiftDays;
  }


  static Future<List<String>> getShiftTimes(String doctorId, String hospitalId, String day) async {
  List<String> shiftTimes = [];

  DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
    .collection('schedules')
    .doc(hospitalId)
    .get();

  if (docSnapshot.exists) {
    Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

    if (data.containsKey(doctorId) && data[doctorId]!.containsKey(day)) {
      // Ambil waktu shift untuk dokter dan hari yang sesuai
      List<dynamic> times = data[doctorId]![day];
      shiftTimes = List<String>.from(times);
    }
  }
  print(shiftTimes);
  return shiftTimes;
}


  static Future<List<String>> getAppointments(String doctorId, String hospitalId, DateTime date) async {
    List<String> appointments = [];

    // Mendapatkan janji temu pada tanggal yang dipilih
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('appointments')
      .where('doctorId', isEqualTo: doctorId)
      .where('hospitalId', isEqualTo: hospitalId)
      .where('date', isEqualTo: date)
      .where('status', whereIn: ['pending', 'diterima'])
      .get();

    // Memasukkan waktu janji temu ke dalam daftar appointments
    if(querySnapshot.docs.isNotEmpty){
      print(querySnapshot.docs);
      querySnapshot.docs.forEach((doc) {
        appointments.add(doc['time']);
      });
    }

    return appointments;
  }

  static Future<List<String>> getTimeAppointment(String doctorId, String hospitalId, DateTime date) async {
    // Mendapatkan jadwal kerja dokter pada hari yang dipilih
    List<String> shiftTimes = await getShiftTimes(doctorId, hospitalId, dayIntToString[date.weekday]!);

    // Mendapatkan janji temu pada hari yang dipilih
    List<String> appointments = await getAppointments(doctorId, hospitalId, date);

    // Menyaring shiftTimes berdasarkan janji temu yang sudah ada
    List<String> availableTimes = shiftTimes.where((time) => !appointments.contains(time)).toList();

    return availableTimes;
  }
}