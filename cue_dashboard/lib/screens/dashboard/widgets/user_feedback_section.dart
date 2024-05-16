import 'package:cue_dashboard/provider/feedback_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feedback_item.dart';

class UserFeedbackSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Row(
            children: [
              Icon(Icons.feedback, color: Colors.black54),
              SizedBox(width: 8.0),
              Text(
                'User Feedback',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Consumer<FeedbackProvider>(
              builder: (context, feedbackProvider, child) {
                if (feedbackProvider.feedbacks.isEmpty) {
                  feedbackProvider.fetchFeedbacks();
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: feedbackProvider.feedbacks.length,
                    itemBuilder: (context, index) {
                      final feedback = feedbackProvider.feedbacks[index];
                      return FeedbackItem(feedback: feedback);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
