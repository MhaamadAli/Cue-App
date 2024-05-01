import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 320,
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
    );
  }
}