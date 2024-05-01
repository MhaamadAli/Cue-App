import 'package:flutter/material.dart';
import 'package:mobile/screens/Assistant/assistant_screen.dart';
import 'package:mobile/screens/Home/widgets/meeting_list_widget.dart';
import 'package:mobile/screens/Tasks/tasks_screen.dart';
import 'package:mobile/screens/map/map_screen.dart';
import 'package:mobile/screens/schedule/schedule_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    // home
    HomeScreen(),
    // tasks
    TasksScreen(),
    // assistant
    AssistantScreen(),
    // schedule
    ScheduleScreen(),
    // map
    MapScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/profileAvatar.png'),
                    radius: 25,
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
              const SizedBox(height: 30),
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
            ],
          ),
        ),
      ),
    );
  }
}
