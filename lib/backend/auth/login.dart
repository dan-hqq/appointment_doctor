import 'package:appointment_doctor/backend/auth/auth.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class Login{

  final String email;
  final String password;

  const Login({
    required this.email,
    required this.password
  });
  
  login() async {
    try {
      
      await Auth.instance.loginWithEmailAndPassword(email.trim(), password.trim());

      // Show Success Message
      MaterialBanner(
        elevation: 0,
        backgroundColor: Colors.transparent,
        forceActionsBelow: true,
        content: AwesomeSnackbarContent(
          title: 'Login Success',
          message: 'Kamu telah berhasil login!',
          contentType: ContentType.success,
          // to configure for material banner
          inMaterialBanner: true,
        ), actions: const [SizedBox.shrink()],
      );

      Auth.instance.screenRedirect();

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
