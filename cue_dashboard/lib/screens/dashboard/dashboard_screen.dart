import 'package:cue_dashboard/screens/dashboard/widgets/admin_ai_section.dart';
import 'package:cue_dashboard/screens/dashboard/widgets/top_stats.dart';
import 'package:cue_dashboard/screens/dashboard/widgets/user_feedback_section.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CUE Dashboard'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TopStats(),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(child: UserFeedbackSection()),
                        Expanded(child: AdminAISection()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
