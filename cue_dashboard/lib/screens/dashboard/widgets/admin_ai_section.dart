import 'package:flutter/material.dart';
import 'admin_ai_message.dart';

class AdminAISection extends StatelessWidget {
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
          const Text(
            'Admin AI',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          AdminAIMessage(
            message:
                'I would appreciate adding a voice activated shortcut on home screen.',
            isResponse: false,
          ),
          AdminAIMessage(
            message: 'I like the idea, so how would we start implementing it?',
            isResponse: true,
          ),
        ],
      ),
    );
  }
}
