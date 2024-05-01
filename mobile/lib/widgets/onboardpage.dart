import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/widgets/main_button.dart';

class OnboardPage extends StatelessWidget {
  final String imagePath;
  final String text;
  final String secondaryText;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const OnboardPage({
    super.key,
    required this.imagePath,
    required this.text,
    required this.secondaryText,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          Image.asset(imagePath),
          const Spacer(),
          Text(
            text,
            style: GoogleFonts.lexend(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            secondaryText,
            style: GoogleFonts.lexend(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: MainButton(
              buttonText: buttonText,
              buttonColor: Color(0xFF06D6A0),
              onPressed: () {
                onButtonPressed();
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
