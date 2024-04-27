import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget  {
  const SplashScreen({super.key});
    @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CUE',
              style: TextStyle(
                fontSize: 64,
                color: Color(0xFF06D6A0),
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w900,
              ),
            ),
          Text(
              'Your personal Buddy',
              style: TextStyle(
                fontSize: 24, 
                color: Colors.black, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
