import 'package:appointment_doctor/pages/login_page.dart';
import 'package:appointment_doctor/pages/verify_email_page.dart';
import 'package:appointment_doctor/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Auth extends GetxController {
  static Auth get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final firebaseAuth = FirebaseAuth.instance;
  // final isLoading = false.obs;

  /// Get Authenticated User Data
  User? get authUser => firebaseAuth.currentUser;

  /// Called fron main.dart on app launch
  @override
  void onReady() {
    // FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = firebaseAuth.currentUser;
    
    if(user != null){
      if(user.emailVerified){
        Get.offAll(() => const MainApp());
      } 
      else {
        Get.offAll(
          () => const VerifyEmailPage(),
        );
      }
    } 
    else {
      // Local storage
      // deviceStorage.writeIfNull('isFirstTime', true);
      // check if it's the firs time launching the app
      // deviceStorage.read('isFirstTime') != true
      // ? Get.offAll(() => const LoginPage());
      // : Get.offAll(const OnBoardingScreen());
      Get.offAll(() => const LoginPage());
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
    } 
    on FirebaseAuthException catch (e) {
      throw e.code;
    } 
    on FirebaseException catch (e) {
      throw e.code;
    } 
    on FormatException catch (_) {
      throw 'Format Exeption Error';
    } 
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
    } 
    on FirebaseAuthException catch (e) {
      throw e.code;
    } 
    on FirebaseException catch (e) {
      throw e.code;
    } 
    on FormatException catch (_) {
      throw 'Format Exeption Error';
    } 
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await firebaseAuth.currentUser?.sendEmailVerification();
    } 
    on FirebaseAuthException catch (e) {
      throw e.code;
    } 
    on FirebaseException catch (e) {
      throw e.code;
    } 
    on FormatException catch (_) {
      throw 'Format exception error';
    } 
    on PlatformException catch (e) {
      throw e.code;
    } 
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginPage());
    } 
    on FirebaseAuthException catch (e) {
      throw e.code;
    } 
    on FirebaseException catch (e) {
      throw e.code;
    } 
    on FormatException catch (_) {
      throw 'Format exception error';
    } 
    on PlatformException catch (e) {
      throw e.code;
    } 
    catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

}
