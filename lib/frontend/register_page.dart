import 'package:appointment_doctor/backend/auth/register.dart';
import 'package:appointment_doctor/frontend/login_page.dart';
import 'package:flutter/material.dart';

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
      onPressed: isLoading == false ? () async {

        setState(() {
          isLoading = true;
        });
        
        // createUserWithEmailAndPassword();
        final register = Register(
          fullName: _fullNameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          role: 4
        );

        await register.register();

        setState(() {
          isLoading = false;
        });
      } : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffde1a51),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: isLoading == false ? const Text('Create an account') : const CircularProgressIndicator(color: Colors.white,),
    );
  }

  Widget _goToLoginPage() {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
      },
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xffde1a51),
        foregroundColor: Colors.white,
      ),
      child: const Text('Login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Create your account in a seconds',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _fullNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  else if (value.length < 8){
                    return 'At least 8 characters password';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 32.0),
              _submitButton(),
              const SizedBox(height: 16.0),
              _goToLoginPage()
            ],
          ),
        ),
      ),
    );
  }
}
