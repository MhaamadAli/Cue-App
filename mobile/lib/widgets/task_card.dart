import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final Color bannerColor;
  final bool isChecked;

  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.bannerColor,
    this.isChecked = false,
  });

  String getShortDescription() {
    if (description.length > 40) {
      return '${description.substring(0, 40)}...';
    }
    return description;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 320,
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 15,
            height: 60,
            decoration: BoxDecoration(
              color: bannerColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: GoogleFonts.monomaniacOne(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                Text(
                  getShortDescription(),
                  style: GoogleFonts.monomaniacOne(
                    fontWeight: FontWeight.w200,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 1),
          Icon(
            isChecked ? Icons.check_circle : Icons.check_circle_outline,
            color: Colors.green,
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}