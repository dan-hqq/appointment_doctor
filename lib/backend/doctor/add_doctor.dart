import 'package:appointment_doctor/model/doctor_model.dart';
import 'package:appointment_doctor/model/user_model.dart';
import 'package:appointment_doctor/pages/adminApk/main_admin_apk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddDoctor {
  final String email;
  final String password;

  const AddDoctor({
    required this.email,
    required this.password
  });

  Future<void> addNewDoctor(BuildContext context) async {
    
    FirebaseApp app = await Firebase.initializeApp(name: FirebaseAuth.instance.currentUser?.uid, options: Firebase.app().options);

    try {
      
      UserCredential newDoctorCredential= await FirebaseAuth.instanceFor(app: app).createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      await FirebaseAuth.instanceFor(app: app).currentUser?.sendEmailVerification();

      final newDoctorUser = UserModel(
        id: newDoctorCredential.user!.uid,
        fullName: "Doctor",
        email: email.trim(),
        role: 3
      );

      final tempUserModel = UserModel();
      await tempUserModel.createUserInDatabase(newDoctorUser);

      await DoctorModel.createDoctorInDatabase(newDoctorCredential.user!.uid);

      FirebaseAuth.instanceFor(app: app).signOut();

      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: "Kamu telah berhasil menambahkan akun dokter",
        ),
      );

      Get.offAll(() => const MyAppAdminApk());

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