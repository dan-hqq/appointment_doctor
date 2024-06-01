import 'dart:convert';
import 'package:appointment_doctor/backend/auth/auth.dart';
import 'package:appointment_doctor/model/doctor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CompleteBiodataDoctor {
  
  final String nama;
  final String spesialis;
  final String telepon;
  final int gender;
  final String profileDoctor;

  const CompleteBiodataDoctor({
    required this.nama,
    required this.spesialis,
    required this.telepon,
    required this.gender,
    required this.profileDoctor
  });

  // Upload Image to Cloudinary
  Future<String?> uploadImageToCloudinary(String? imagePath) async {
    if (imagePath == null) return null;

    final url = Uri.parse("https://api.cloudinary.com/v1_1/dp3h9gw5l/upload");

    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = 'kalwsmfz'
      ..files.add(await http.MultipartFile.fromPath('file', imagePath));

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);
      final urlImage = jsonMap['url'];
      return urlImage;
    }

    return null;
  }

  Future<void> compleBiodataDoctor(BuildContext context) async {
    try {

      String? urlProfileDoctor = await uploadImageToCloudinary(profileDoctor);

      final biodataDoctor = DoctorModel(
        nama: nama,
        telepon: telepon,
        spesialis: spesialis,
        gender: gender,
        profileDoctor: urlProfileDoctor,
        status: "valid"
      );

      await FirebaseFirestore.instance.collection('doctors').doc(FirebaseAuth.instance.currentUser!.uid).update(biodataDoctor.toJson());

      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: "Kamu telah berhasil melengkapi biodata",
        ),
      );

      Auth.instance.screenRedirect();
    }
    catch (e) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: e.toString(),
        ),
      );  
    }
  }

}