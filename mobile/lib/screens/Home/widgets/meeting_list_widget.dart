import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MeetingListCard extends StatelessWidget {
  const MeetingListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF07AB81),
        borderRadius: BorderRadius.circular(
            25),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF07AB81).withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      
    );
  }
}
