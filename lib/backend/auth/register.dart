import 'package:appointment_doctor/backend/auth/auth.dart';
import 'package:appointment_doctor/frontend/verify_email_page.dart';
import 'package:appointment_doctor/model/user_model.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class Register{

  final String fullName;
  final String email;
  final String password;
  final int role;

  const Register({
    required this.fullName,
    required this.email,
    required this.password,
    required this.role
  });
  
  register() async {
    try {

      final newUserAuth = await Auth.instance.registerWithEmailAndPassword(email.trim(), password.trim());

      final newUser = UserModel(
        id: newUserAuth.user!.uid,
        fullName: fullName.trim(),
        email: email.trim(),
        role: role
      );

      final tempUserModel = UserModel();
      await tempUserModel.createUserInDatabase(newUser);

      // Show Success Message
      MaterialBanner(
        elevation: 0,
        backgroundColor: Colors.transparent,
        forceActionsBelow: true,
        content: AwesomeSnackbarContent(
          title: 'Registration Success',
          message: 'Jangan lupa verifikasi email-mu!',
          contentType: ContentType.success,
          // to configure for material banner
          inMaterialBanner: true,
        ), actions: const [SizedBox.shrink()],
      );

      // Move to Verify Email Page
      Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyEmailPage()));

    } 
    catch (e) {
      MaterialBanner(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        backgroundColor: Colors.transparent,
        forceActionsBelow: true,
        content: AwesomeSnackbarContent(
          title: 'Error',
          message: e.toString(),
          contentType: ContentType.failure,
          // to configure for material banner
          inMaterialBanner: true,
        ), actions: const [SizedBox.shrink()],
      );
    }
  }
}

// class SignupController extends GetxController {
//   static SignupController get instance => Get.find();

//   /// Variables
//   final hidePassword = true.obs;
//   final name = TextEditingController();
//   final email = TextEditingController();
//   final password = TextEditingController();
//   GlobalKey<FormState> signupFormKey =
//       GlobalKey<FormState>(); // form key for form validation
//   final isLoading = false.obs;

//   /// Signup
//   signup() async {
//     try {
//       // start Loading
//       isLoading.value = true;

//       // Check Internet Connectivity

//       // Form Validation
//       if (!signupFormKey.currentState!.validate()) {
//         isLoading.value = false;
//         return;
//       }

//       // Register user in the Firebase Authentication & Save user data in the firestore
//       final userCredential = await AuthenticationRepository.instance
//           .registerWithEmailAndPassword(
//               email.text.trim(), password.text.trim());

//       // Save Authenticated user data in the Firebase Firestore
//       final newUser = UserModel(
//         id: userCredential.user!.uid,
//         name: name.text.trim(),
//         email: email.text.trim(),
//       );

//       final userRepository = Get.put(UserRepository());
//       await userRepository.saveUserRecord(newUser);

//       // Show Success Message
//       TLoaders.successSnackBar(
//           title: 'Congratulations',
//           message: 'Your account has been created! Verify email to continue.');

//       // Move to Verify Email Screen
//       Get.to(() => VerifyEmailScreen(email: email.text.trim()));

//       // Stop Loading
//       isLoading.value = false;

//     } catch (e) {
//       // Show some Generic error to the user
//       TLoaders.errorSnackBar(title: 'Oh, Snap!', message: e.toString());

//       // Stop Loading
//       isLoading.value = false;
//     }
//   }
// }
