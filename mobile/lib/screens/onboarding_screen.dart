import 'package:flutter/material.dart';
import 'package:mobile/widgets/main_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/login");
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(fontSize: 20 ,color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Spacer(),
                  Image.asset('assets/onboarding1.png'),
                  const Spacer(),
                  const Text(
                    'Behind every successful human is someone reminding him of his duties',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Cue is your daily personal assistant, it uses artificial intelligence to keep you on top of your day!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: MainButton(
                      buttonText: 'Next',
                      buttonColor: Color(0xFF06D6A0),
                      onPressed: () {
                        // Handle button press
                        print('Button Pressed!');
                      },
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
