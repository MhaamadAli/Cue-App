import 'package:flutter/material.dart';
import 'package:mobile/screens/profile/feedback_button.dart';
import 'package:mobile/screens/profile/feedback_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showFeedbackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const FeedbackDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
        ),
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage('assets/profileAvatar.png'),
              ),
            ),
            const SizedBox(height: 24),
            buildTextField(title: 'Full Name', value: 'Mohammad Ali Alawar'),
            buildTextField(title: 'Email', value: 'm.alialawar@gmail.com'),
            buildTextField(title: 'Gender', value: 'Male', isDropdown: true),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: FeedbackButton(
                    onPressed: () {
                      _showFeedbackDialog(context);
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      {required String title, required String value, bool isDropdown = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        if (!isDropdown)
          TextField(
            controller: TextEditingController(text: value),
            readOnly:
                true,
          )
        else
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down, color: Colors.green),
                items: <String>['Male', 'Female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ),
        const SizedBox(height: 16),
      ],
    );
  }
}
