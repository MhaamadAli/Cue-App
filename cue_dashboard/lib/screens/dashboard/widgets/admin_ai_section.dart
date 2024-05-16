import 'package:cue_dashboard/screens/dashboard/widgets/admin_ai_message.dart';
import 'package:flutter/material.dart';

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
          const Row(
            children: [
              Icon(Icons.ad_units, color: Colors.black54),
              SizedBox(width: 8.0),
              Text(
                'Admin AI',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                AdminAIMessage(
                  message:
                      'I would appreciate adding a voice activated shortcut on the home screen.',
                  isResponse: false,
                ),
                AdminAIMessage(
                  message:
                      'I like the idea, so how would we start implementing it?',
                  isResponse: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Message Admin AI...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.black54),
                  onPressed: () {
                    // Handle send action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
