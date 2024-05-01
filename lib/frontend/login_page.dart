import 'package:appointment_doctor/backend/auth/login.dart';
import 'package:appointment_doctor/frontend/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = 'kok gak bisa ini gimana woyy';
  bool isLogin = true;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Widget _entryField(
  //   String title,
  //   TextEditingController controller,
  // ) {
  //   return TextField(
  //     controller: controller,
  //     decoration: InputDecoration(
  //       border: const OutlineInputBorder(),
  //       labelText: title,
  //     ),
  //   );
  // }

  // Widget _errorMsesage() {
  //   return Text(
  //     errorMessage == '' ? '' : 'Humm ? $errorMessage',
  //     style: const TextStyle(color: Colors.red),
  //   );
  // }

  // void _showErrorMessage(String message) {
  //   final snackBar = SnackBar(
  //     content: Text(message),
  //     backgroundColor: Colors.red,
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  Widget _submitButton() {
    bool isLoading = false;

    return ElevatedButton(
      onPressed: isLoading == false
          ? () async {
              setState(() {
                isLoading = true;
              });

              // signInWithEmailAndPassword();
              final login = Login(
                  email: _emailController.text,
                  password: _passwordController.text);

              await login.login(context);

              setState(() {
                isLoading = false;
              });
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffde1a51),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 135),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.6),
      ),
      child: isLoading == false
          ? Text(
              'Masuk',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          : const CircularProgressIndicator(
              color: Colors.white,
            ),
    );
  }

  Widget _goToRegisterPage() {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Belum punya akun? ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: 'Buat akun',
            style: const TextStyle(
              color: Color(0xffde1a51),
              fontSize: 16,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 75),
              Image.asset(
                'assets/images/hospify-removebg.png',
                height: 180,
              ),
              const SizedBox(height: 25),
              Text(
                'Masuk',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Masuk ke akun Anda',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      style: GoogleFonts.inter(),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      style: GoogleFonts.inter(),
                    ),
                    const SizedBox(height: 20),
                    _submitButton(),
                    const SizedBox(height: 10),
                    _goToRegisterPage(),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
