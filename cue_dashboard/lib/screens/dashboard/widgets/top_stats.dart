import 'package:flutter/material.dart';
import 'stat_card.dart';

class TopStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        StatCard(
          title: 'Number of Users',
          count: '29',
        ),
        StatCard(
          title: 'New Users This Month',
          count: '12',
        ),
      ],
    );
  }
}
