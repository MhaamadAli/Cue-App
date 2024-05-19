import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final Task inputTask;
  final VoidCallback onTap;

  const TaskCard({
    super.key,
    required this.inputTask,
    required this.onTap,
  });

  String getShortDescription() {
    return inputTask.description.length > 38
        ? '${inputTask.description.substring(0, 38)}...'
        : inputTask.description;
  }

  Color getBannerColor() {
    switch (inputTask.bannerColor) {
      case 'RED':
        return Colors.red;
      case 'GREEN':
        return Colors.green;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
        child: Row(
          children: [
            Container(
              width: 15,
              height: 60,
              decoration: BoxDecoration(
                color: getBannerColor(),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    inputTask.title,
                    style: GoogleFonts.monomaniacOne(
                      color: Color.fromARGB(255, 75, 75, 75),
                      fontSize: 26,
                    ),
                  ),
                  Text(
                    getShortDescription(),
                    style: GoogleFonts.monomaniacOne(
                      fontWeight: FontWeight.w200,
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: inputTask.isChecked
                  ? Image.asset('assets/taskDone.png', height: 29, width: 29)
                  : Image.asset('assets/task.png', height: 30, width: 30),
            ),
          ],
        ),
      ),
    );
  }
}
