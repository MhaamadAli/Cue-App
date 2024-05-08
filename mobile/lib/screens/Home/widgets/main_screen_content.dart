import 'package:flutter/material.dart';
import 'package:mobile/models/meeting_model.dart';
import 'package:mobile/screens/Home/widgets/meeting_list_widget.dart';
import 'package:mobile/screens/Home/widgets/tasks_list_widget.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Meeting> meetings = [
      Meeting(
        id: 1,
        title: 'Finish UI - Nour',
        description: 'You should finish the UI with Flutter before Saturday',
        duedatetime: DateTime.now(),
      ),
      Meeting(
        id: 2,
        title: 'Flutter - Taha',
        description: 'Meeting with Taha to have a code review',
        duedatetime: DateTime.now(),
      ),
      Meeting(
        id: 3,
        title: 'Backend - Chris',
        description: 'Meeting with Chris to review backend code',
        duedatetime: DateTime.now(),
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    IconButton(
                      icon: Image.asset('assets/profileAvatar.png',
                          height: 55, width: 55),
                      onPressed: () {
                        Navigator.pushNamed(context, "/profile");
                      },
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Hello Mohammad!',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF07AB81),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.notifications),
                        iconSize: 25,
                        color: Colors.white,
                        onPressed: () {
                          // Notification popup logic
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 220,
                child: Scrollbar(
                  child: PageView.builder(
                    controller: PageController(
                        viewportFraction:
                            1),
                    itemCount: meetings.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: index < meetings.length - 1 ? 5 : 0),
                        child: MeetingListCard(inputMeeting: meetings[index]),
                      );
                    },
                  ),
                ),
              ),
              const TasksListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
