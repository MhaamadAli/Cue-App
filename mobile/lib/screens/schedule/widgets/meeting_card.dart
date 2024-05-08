import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/models/meeting_model.dart';

class MeetingCard extends StatelessWidget {
  final Meeting inputMeeting;

  const MeetingCard({
    super.key,
    required this.inputMeeting,
  });

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return Container(
      width: screensize.width * 0.90,
      height: screensize.height * 0.07,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xFFF3D3AA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                inputMeeting.title,
                style: GoogleFonts.monomaniacOne(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Row(
                children: [
                 Icon(Icons.access_time_outlined,
                      size: 20, color: Colors.black.withOpacity(0.7)),
                  const SizedBox(width: 4),
                  Text(
                    inputMeeting.getFormattedTime(),
                    style: GoogleFonts.lexend(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
