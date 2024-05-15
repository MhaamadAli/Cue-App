import 'package:flutter/material.dart';

class FeedbackItem extends StatelessWidget {
  final String date;
  final String userName;
  final String feedback;
  final Color indicatorColor;

  FeedbackItem({
    required this.date,
    required this.userName,
    required this.feedback,
    required this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
        ],
      ),
    );
  }
}
