import 'package:flutter/material.dart';
import 'package:mobile/screens/Assistant/assistant_screen.dart';
import 'package:mobile/screens/Home/widgets/main_screen_content.dart';
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
    return const Scaffold(
        body: Center(
      child: HomeScreenContent(),
    ));
  }
}
