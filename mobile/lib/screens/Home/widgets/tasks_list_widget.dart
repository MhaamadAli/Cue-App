import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/models/task_model.dart';
import 'package:mobile/widgets/task_card.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Task> tasks = [
      Task(
        id: 1,
        title: 'Finish UI with Flutter',
        description: 'You should finish the UI with Flutter before Saturday',
        bannerColor: Colors.orange,
      ),
      Task(
        id: 1,
        title: 'Start with the Backend',
        description: 'Task small Description',
        bannerColor: Colors.green,
        isChecked: true,
      ),
    ];
    final screensize = MediaQuery.of(context).size;
    return Container(
      width: screensize.width * 0.9,
      height: screensize.height * 0.46,
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
                  )),
            ],
          ),
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
    );
  }
}
