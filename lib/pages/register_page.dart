import 'package:appointment_doctor/backend/auth/register.dart';
import 'package:appointment_doctor/pages/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? errorMessage = 'kok gak bisa ini gimana woyy';

  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Future<void> createUserWithEmailAndPassword() async {
  //   try {
  //     await Auth().createUserWithEmailAndPassword(
  //       fullName: _fullNameController.text,
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       errorMessage = e.message;
  //     });
  //   }
  // }

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

  // Widget _errorMesage() {
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

              // createUserWithEmailAndPassword();
              final register = Register(
                  fullName: _fullNameController.text,
                  email: _emailController.text,
                  password: _passwordController.text,
                  role: 4);

              await register.register(context);

              setState(() {
                isLoading = false;
              });
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffde1a51),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 120),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.6),
      ),
      child: isLoading == false
          ? Text(
              'Buat Akun',
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

  Widget _goToLoginPage() {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Sudah punya akun? ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: 'Masuk',
            style: const TextStyle(
              color: Color(0xffde1a51),
              fontSize: 16,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
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
                'Buat Akun',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Daftarkan akun Anda dalam',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                ' waktu singkat',
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
                        controller: _fullNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Full Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 8) {
                            return 'At least 8 characters password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _submitButton(),
                      const SizedBox(height: 10),
                      _goToLoginPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
