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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Meeting Title here',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 16),
            child: Text(
              'Description here,Description here,Description here,Description here',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 20, color: Colors.white),
                  SizedBox(width: 4),
                  Text(
                    '20/04/2024',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(children: [
                SizedBox(width: 30),
                Icon(Icons.access_time, size: 20, color: Colors.white),
                SizedBox(width: 4),
                Text(
                  '11:00 AM',
                  style: TextStyle(
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
