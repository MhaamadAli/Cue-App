import 'package:flutter/material.dart';
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
          FeedbackItem(
            date: 'Today, 3:00 AM',
            userName: 'User Name',
            feedback:
                'I would appreciate adding a voice activated shortcut on the home screen.',
            indicatorColor: Colors.purple,
          ),
          FeedbackItem(
            date: 'Apr 25th, 9:00 PM',
            userName: 'User Name',
            feedback:
                'very nice app, maybe a more colorful main color would be better.',
            indicatorColor: Colors.yellow,
          ),
          FeedbackItem(
            date: 'Apr 22nd, 5:00 PM',
            userName: 'User Name',
            feedback:
                'the user experience is very good, well done and the model is very accurate.',
            indicatorColor: Colors.blue,
          ),
          FeedbackItem(
            date: 'March 11th, 4:00 AM',
            userName: 'User Name',
            feedback: 'good experience so far!',
            indicatorColor: Colors.green,
          ),
          FeedbackItem(
            date: 'March 7th, 1:00 PM',
            userName: 'User Name',
            feedback:
                'adding categories to organize the tasks would be a very nice feature.',
            indicatorColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
