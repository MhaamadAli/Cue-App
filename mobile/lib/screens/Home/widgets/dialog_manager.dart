import 'package:flutter/material.dart';

void showNotificationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          width: 300,
          height: 280,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              const Spacer(),
              const Icon(Icons.notifications, size: 60, color: Colors.grey),
              const SizedBox(height: 40),
              const Text('Your notifications live here',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
              const Spacer(),
            ],
          ),
        ),
      );
    },
  );
}
