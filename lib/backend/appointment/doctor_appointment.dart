import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DoctorAppointment {
  static Future<List<Map<String, dynamic>>> getAllAppointments(String status) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('appointments')
      .where('doctorId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where('status', isEqualTo: status.toLowerCase())
      .get();
  
    List<Map<String, dynamic>> appointments = [];
    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?; // Explicit cast
      if (data != null) {
        appointments.add(data);
      }
    });
  
    return appointments;
  }

  static Future<void> confirmAppointment(String doctorId, String hospitalId, String userId, DateTime date, String time, String status) async {
    
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('appointments')
      .where('doctorId', isEqualTo: doctorId)
      .where('hospitalId', isEqualTo: hospitalId)
      .where('userId', isEqualTo: userId)
      .where('date', isEqualTo: date)
      .where('time', isEqualTo: time)
      .get();

    querySnapshot.docs.forEach((doc) async {
      await FirebaseFirestore.instance
          .collection('appointments')
          .doc(doc.id)
          .update({'status': status});
    });
  }

  static Future<void> finishingAppointment(String doctorId, String hospitalId, String userId, DateTime date, String time, String note) async {
    
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('appointments')
      .where('doctorId', isEqualTo: doctorId)
      .where('hospitalId', isEqualTo: hospitalId)
      .where('userId', isEqualTo: userId)
      .where('date', isEqualTo: date)
      .where('time', isEqualTo: time)
      .get();

    querySnapshot.docs.forEach((doc) async {
      await FirebaseFirestore.instance
          .collection('appointments')
          .doc(doc.id)
          .update({
            'status': "selesai",
            'note': note,
          });
    });
  }

}