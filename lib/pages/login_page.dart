import 'package:appointment_doctor/backend/auth/login.dart';
import 'package:appointment_doctor/pages/register_page.dart';
import 'package:flutter/material.dart';

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
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xffde1a51),
        foregroundColor: Colors.white,
      ),
      child: isLoading == false
          ? const Text('Login')
          : const CircularProgressIndicator(
              color: Colors.white,
            ),
    );
  }

  Widget _goToRegisterPage() {
    return TextButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RegisterPage()));
      },
      child: const Text('Register', style: TextStyle(color: Color(0xffde1a51))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Enter to your account in a seconds',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 32.0),
              _submitButton(),
              const SizedBox(height: 16.0),
              _goToRegisterPage(),
            ],
          ),
        ),
      ),
    );
  }
}
