import 'package:flutter/material.dart';

class ChatDokter extends StatefulWidget {
  const ChatDokter({super.key});

  @override
  State<ChatDokter> createState() => _ChatDokterState();
}

class _ChatDokterState extends State<ChatDokter> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Page ChatDokter!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}