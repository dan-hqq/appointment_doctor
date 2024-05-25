import 'package:appointment_doctor/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SuccessVerifyEmailPage extends StatelessWidget {
  const SuccessVerifyEmailPage({super.key});

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
              'Akunmu Telah Sukses Dibuat!',
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
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => const MainApp()))),
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
                  'Continue',
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
