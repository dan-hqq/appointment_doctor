import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class DoctorModel {
  final String? id;
  final String? nama;
  final String? spesialis;
  final String? telepon;
  final int? gender;
  final String? profileDoctor;
  final String? status;

  const DoctorModel(
      {this.id,
      this.nama,
      this.spesialis,
      this.telepon,
      this.gender,
      this.profileDoctor,
      this.status});

  static DoctorModel empty() => const DoctorModel(
      nama: '',
      spesialis: '',
      telepon: '',
      gender: 0,
      profileDoctor: '',
      status: 'invalid');

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'spesialis': spesialis,
      'telepon': telepon,
      'gender': gender,
      'profileDoctor': profileDoctor,
      'status': status
    };
  }

  factory DoctorModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return DoctorModel(
        id: documentSnapshot.id,
        nama: data['nama'],
        spesialis: data['spesialis'],
        telepon: data['telepon'],
        gender: data['gender'],
        profileDoctor: data['profileDoctor'],
        status: data['status']);
  }

  static Future<void> createDoctorInDatabase(String doctorId) async {
    try {
      await FirebaseFirestore.instance
          .collection("doctors")
          .doc(doctorId)
          .set(DoctorModel.empty().toJson());
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw 'Format exeption error';
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again $e';
    }
  }

  static Future<List<DoctorModel>> getAllDoctors() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('doctors').where("status", isEqualTo: "valid").get();

      return snapshot.docs.map((doc) {
        return DoctorModel.fromSnapshot(doc);
      }).toList();
    } catch (e) {
      print('Error retrieving doctor data: $e');
      return [];
    }
  }

  static Future<DoctorModel> getLoginDetailDoctor() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      return DoctorModel.fromSnapshot(snapshot);
    } catch (e) {
      print('Error retrieving doctor data: $e');
      return const DoctorModel();
    }
  }

  // static Future<List<DoctorModel>> getNearestDoctorsWithSpecialist(double latitude, double langitude, String specialist) async {
  //   try{

  //   }
  //   catch(e){
  //     print('Error retrieving doctor data: $e');
  //     return [];
  //   }

  // }
}
