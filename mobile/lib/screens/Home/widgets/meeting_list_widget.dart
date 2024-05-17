import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/models/meeting_model.dart';

class MeetingListCard extends StatelessWidget {
  final Meeting inputMeeting;

  const MeetingListCard({
    super.key,
    required this.inputMeeting,
  });

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return Container(
      width: screensize.width * 0.88,
      height: screensize.height * 0.23,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF07AB81).withOpacity(0.9),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF07AB81).withOpacity(0.25),
            spreadRadius: 5,
            blurRadius: 8,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            inputMeeting.title,
            style: GoogleFonts.monomaniacOne(
              color: Colors.white,
              fontSize: 36,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: Text(
              inputMeeting.description,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 16,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_month_outlined,
                      size: 20, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    inputMeeting.getFormattedDate(),
                    style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(children: [
                const SizedBox(width: 30),
                const Icon(Icons.access_time_outlined,
                    size: 20, color: Colors.white),
                const SizedBox(width: 4),
                Text(
                  inputMeeting.getFormattedTime(),
                  style: GoogleFonts.lexend(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
