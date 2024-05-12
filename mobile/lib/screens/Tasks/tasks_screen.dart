import 'package:flutter/material.dart';
import 'package:mobile/models/task_model.dart';
import 'package:mobile/widgets/task_card.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Task> tasks = [
      Task(
          id: 1,
          title: 'Finish UI with Flutter',
          description: 'You should finish the UI with Flutter before Saturday',
          bannerColor: 'ORANGE',
          isChecked: true
          ),
      Task(
          id: 1,
          title: 'Start with the Backend',
          description: 'Task small Description',
          bannerColor: 'GREEN'),
    ];

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
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  Task task = tasks[index];
                  return TaskCard(inputTask: task);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
