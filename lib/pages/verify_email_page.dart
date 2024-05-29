import 'dart:async';

import 'package:appointment_doctor/backend/auth/auth.dart';
import 'package:appointment_doctor/pages/success_verify_email_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {

  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    Auth.instance.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 1), (_) => checkEmailVerified(context));
  }

  Future<void> checkEmailVerified(BuildContext context) async {
    await FirebaseAuth.instance.currentUser?.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email Successfully Verified")));
      timer?.cancel();
      Get.offAll(() => const SuccessVerifyEmailPage());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/hospify.png', 
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 80.0,
            ),
            const Text(
              'Verifikasi email Anda!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(FirebaseAuth.instance.currentUser!.email ?? ''),
            const SizedBox(
              height: 40.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () => Auth.instance.sendEmailVerification(),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xffde1a51)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                  ),
                ),
                child: const Text(
                  'Resend email',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class VerifyEmailPage extends StatelessWidget {
//   const VerifyEmailPage({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(40.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/images/verification_email.png',
//               width: 150,
//               height: 150,
//             ),
//             const SizedBox(
//               height: 80.0,
//             ),
//             const Text(
//               'Verifikasi email Anda!',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(FirebaseAuth.instance.currentUser!.email ?? ''),
//             const SizedBox(
//               height: 40.0,
//             ),
//             SizedBox(
//               width: double.infinity,
//               height: 60,
//               child: ElevatedButton(
//                 onPressed: () => controller.sendEmailVerification(),
//                 style: ButtonStyle(
//                   backgroundColor:
//                       MaterialStateProperty.all(const Color(0xFF080A23)),
//                   shape: MaterialStateProperty.all(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                         30,
//                       ),
//                     ),
//                   ),
//                 ),
//                 child: const Text(
//                   'Resend email',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
