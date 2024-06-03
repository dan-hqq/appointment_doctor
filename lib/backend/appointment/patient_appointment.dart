import 'package:appointment_doctor/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PatientAppointment {

  static Future<void> makeNewAppointment(String doctorId, String hospitalId, DateTime date, String time, String keluhan) async {
    
    UserModel user = await UserModel.getUserDetails();
    
    await FirebaseFirestore.instance.collection("appointments").add({
      "hospitalId": hospitalId,
      "doctorId": doctorId,
      "userId": FirebaseAuth.instance.currentUser!.uid,
      "patientName": user.fullName!,
      "date": date,
      "time": time,
      "keluhan": keluhan,
      "status": "pending"
    });
  }

  static Future<List<Map<String, dynamic>>> getAllAppointments(String status) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('appointments')
      .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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



}