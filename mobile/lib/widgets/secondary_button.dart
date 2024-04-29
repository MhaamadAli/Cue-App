import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onPressed;
  const SecondaryButton(
      {super.key,
      required this.buttonColor,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: buttonColor),
          ),
        ),
        onPressed: onPressed,
        child: Text(buttonText,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF06D6A0))),
      ),
    );
  }
}
