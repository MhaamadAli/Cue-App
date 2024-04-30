import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/profileAvatar.png'),
                radius: 30,
              ),
              SizedBox(width: 10),
              
            ],
          ),
        ),
      ),
    );
  }
}
