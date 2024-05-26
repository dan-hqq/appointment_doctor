import 'package:flutter/material.dart';

class ProfileAdminApk extends StatefulWidget {
  const ProfileAdminApk({super.key});

  @override
  State<ProfileAdminApk> createState() => _ProfileAdminApkState();
}

class _ProfileAdminApkState extends State<ProfileAdminApk> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Page Profile Admin Aplikasi!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}