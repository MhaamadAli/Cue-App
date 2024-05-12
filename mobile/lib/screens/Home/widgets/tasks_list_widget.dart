import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/provider/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:mobile/models/task_model.dart';
import 'package:mobile/widgets/task_card.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.9,
      height: screenSize.height * 0.46,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      decoration: BoxDecoration(
        color: Color(0xFF07AB81).withOpacity(0.4),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF07AB81).withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today\'s Tasks',
                style: GoogleFonts.monomaniacOne(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tasks');
                },
                child: Text(
                  'See All',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Consumer<TasksProvider>(
              builder: (context, tasksProvider, child) {
                final tasks = tasksProvider.todoTasks;
                if (tasks.isEmpty) {
                  return const Center(
                      child: Text('No tasks found',
                          style: TextStyle(color: Colors.white)));
                }
                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    Task task = tasks[index];
                    return TaskCard(
                      inputTask: task,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(task.title),
                            content: Text(task.description),
                            actions: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('Mark as Done')),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
