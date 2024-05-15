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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.circle,
                size: 10.0,
                color: indicatorColor,
              ),
              const SizedBox(width: 8.0),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // To be continued
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
