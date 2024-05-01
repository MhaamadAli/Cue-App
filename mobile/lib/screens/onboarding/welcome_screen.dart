import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/widgets/main_button.dart';
import 'package:mobile/widgets/secondary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 160),
              Image.asset('assets/cueLogo.png', height: 140),
              const SizedBox(height: 48),
              Text(
                'Welcome to',
                style: GoogleFonts.monomaniacOne(
                  fontSize: 54,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                'CUE 👋',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF06D6A0),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 80),
              MainButton(
                buttonColor: Color(0xFF06D6A0),
                buttonText: 'Log In',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/login");
                },
              ),
              const SizedBox(height: 16),
              SecondaryButton(
                buttonColor: Color(0xFF06D6A0),
                buttonText: 'Sign Up',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/signup");
                },
              ),
              const SizedBox(height: 100),
              TextButton(
                onPressed: () {
                  // to be handled later ( login with google OAuth )
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset('assets/googleLogo.png', height: 34),
                    const SizedBox(width: 8),
                    const Text('Or continue with Google'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
