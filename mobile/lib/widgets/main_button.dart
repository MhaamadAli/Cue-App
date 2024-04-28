import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onPressed;
  const MainButton(
      {super.key,
      required this.buttonColor,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 283,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Text(buttonText,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ),
    );
  }
}
