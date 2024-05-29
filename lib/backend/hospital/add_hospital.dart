import 'dart:convert';

import 'package:appointment_doctor/model/hospital_model.dart';
import 'package:appointment_doctor/model/user_model.dart';
import 'package:appointment_doctor/pages/doctor/main_doctor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddHospital {
  final String namaRS;
  final String telepon;
  final String alamat;
  final double latitude;
  final double longitude;
  final String imagePath;
  final String email;
  final String password;

  const AddHospital({
    required this.namaRS,
    required this.telepon,
    required this.alamat,
    required this.latitude,
    required this.longitude,
    required this.imagePath,
    required this.email,
    required this.password
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

  Future<void> addNewHospital(BuildContext context) async {
    FirebaseApp app = await Firebase.initializeApp(name: FirebaseAuth.instance.currentUser?.uid, options: Firebase.app().options);
    
    try {
      
      UserCredential newAdminHospitalCredential= await FirebaseAuth.instanceFor(app: app).createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      await FirebaseAuth.instanceFor(app: app).currentUser?.sendEmailVerification();
      
      // Set the UID generated to a variable so we can use it later
      // String? uid = newAdminHospitalCredential.user?.uid;

      // Simpan kredensial Admin Aplikasi
      // final adminAppCredential = await FirebaseAuth.instance.currentUser?.getIdToken();

      // final newAdminHospitalCredential = await Auth.instance.registerWithEmailAndPassword(email.trim(), password.trim());

      // Auth.instance.sendEmailVerification(); 
      
      final newAdminHospital = UserModel(
        id: newAdminHospitalCredential.user!.uid,
        fullName: namaRS.trim(),
        email: email.trim(),
        role: 2
      );

      final tempUserModel = UserModel();
      await tempUserModel.createUserInDatabase(newAdminHospital);     

      final imageUrl = await uploadImageToCloudinary(imagePath); 

      final newHospital = HospitalModel(
        id: newAdminHospitalCredential.user!.uid,
        namaRS: namaRS.trim(), 
        telepon: telepon.trim(), 
        alamat: alamat.trim(), 
        position: GeoFlutterFire().point(latitude: latitude, longitude: longitude),
        imageUrl: imageUrl!
      );

      await HospitalModel.createHospitalInDatabase(newHospital);

      FirebaseAuth.instanceFor(app: app).signOut();

      // Login kembali sebagai Admin Aplikasi
      // final credential = GoogleAuthProvider.credential(idToken: adminAppCredential);
      // await FirebaseAuth.instance.signInWithCredential(credential);

      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: "Kamu telah menambahkan rumah sakit",
        ),
      );

      Get.offAll(() => const MyAppDoctor());
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