import 'package:appointment_doctor/pages/adminApk/main_admin_apk.dart';
import 'package:appointment_doctor/pages/doctor/main_doctor.dart';
import 'package:appointment_doctor/pages/hospital/main_hospital.dart';
import 'package:appointment_doctor/pages/login_page.dart';
import 'package:appointment_doctor/pages/patient/main_pasien.dart';
import 'package:appointment_doctor/pages/verify_email_page.dart';
// import 'package:appointment_doctor/main.dart';
import 'package:appointment_doctor/pages/onboard/onboard.dart';
import 'package:appointment_doctor/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Auth extends GetxController {
  static Auth get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  // final isLoading = false.obs;

  /// Get Authenticated User Data
  User? get authUser => FirebaseAuth.instance.currentUser;

  /// Called fron main.dart on app launch
  @override
  void onReady() {
    // FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      if (user.emailVerified) {
        final userLogin = await UserModel.getUserDetails();
        final userRole = userLogin.role;

        if (userRole == 1) {
          // Admin Aplikasi
          Get.offAll(() => const MyAppAdminApk());
        } else if (userRole == 2) {
          // Admin Rumah Sakit
          Get.offAll(() => const MyAppHospital());
        } else if (userRole == 3) {
          // Dokter
          Get.offAll(() => const MyAppDoctor());
        } else {
          // Pasien
          Get.offAll(() => const MyAppPasien());
        }
      } else {
        Get.offAll(
          () => const VerifyEmailPage(),
        );
      }
    } else {
      // Local storage
      deviceStorage.writeIfNull('isFirstTime', true);

      // check if it's the firs time launching the app
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginPage())
          : Get.offAll(const OnboardPage());
      Get.offAll(() => const LoginPage());
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw 'Format Exeption Error';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw 'Format Exeption Error';
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw 'Format exception error';
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginPage());
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw 'Format exception error';
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
