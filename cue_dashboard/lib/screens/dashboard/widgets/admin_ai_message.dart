import 'package:flutter/material.dart';

class AdminAIMessage extends StatelessWidget {
  final String message;
  final bool isResponse;

  AdminAIMessage({required this.message, required this.isResponse});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isResponse ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isResponse ? Colors.green.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
