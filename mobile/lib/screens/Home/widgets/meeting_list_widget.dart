import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MeetingListCard extends StatelessWidget {
  const MeetingListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 200,
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
            'Meeting Title here',
            style: GoogleFonts.monomaniacOne(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w400,
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: Text(
              'Description here,Description here,Description here,Description here',
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
                  const Icon(Icons.calendar_month_outlined, size: 20, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    '20/04/2024',
                    style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(children: [
                const SizedBox(width: 30),
                const Icon(Icons.access_time_outlined, size: 20, color: Colors.white),
                const SizedBox(width: 4),
                Text(
                  '11:00 AM',
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
