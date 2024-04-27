import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        'CUE',
        style: TextStyle(
          fontSize: 64,
          color: Color(0xFF06D6A0),
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w900
        ),
      ),),
    );
  }
}
