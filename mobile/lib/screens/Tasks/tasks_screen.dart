import 'package:flutter/material.dart';
import 'package:mobile/screens/Home/widgets/main_screen_content.dart';
import 'package:mobile/widgets/task_card.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

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
        title: const Text('tasks', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  TaskCard(
                    title: 'Finish UI with Flutter',
                    description:
                        'You should finish the UI with Flutter before Saturday',
                    bannerColor: Colors.orange,
                    isChecked: false,
                  ),
                  TaskCard(
                    title: 'Start with the Backend',
                    description: 'Task small Description',
                    bannerColor: Colors.green,
                    isChecked: false,
                  ),
                  TaskCard(
                    title: 'Start with the Backend',
                    description: 'Task small Description',
                    bannerColor: Colors.orange,
                    isChecked: true,
                  ),
                  TaskCard(
                    title: 'Start with the Backend',
                    description: 'Task small Description',
                    bannerColor: Colors.red,
                    isChecked: true,
                  ),
                  TaskCard(
                    title: 'Start with the Backend',
                    description: 'Task small Description',
                    bannerColor: Colors.red,
                    isChecked: true,
                  ),
                  TaskCard(
                    title: 'Finish UI with Flutter',
                    description:
                        'You should finish the UI with Flutter before Saturday',
                    bannerColor: Colors.orange,
                    isChecked: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
