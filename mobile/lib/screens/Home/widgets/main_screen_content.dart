import 'package:flutter/material.dart';
import 'package:mobile/screens/Home/widgets/meeting_list_widget.dart';
import 'package:mobile/screens/Home/widgets/tasks_list_widget.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
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
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
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
                          // to be done: notification popup
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // use list view instead
              // listview.builder
              //pass scroll behavior ( snapping)
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MeetingListCard(),
                    SizedBox(width: 20),
                    MeetingListCard(),
                    SizedBox(width: 20),
                    MeetingListCard(),
                  ],
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
