import 'package:flutter/material.dart';
import 'package:mobile/screens/Assistant/assistant_screen.dart';
import 'package:mobile/screens/Home/widgets/main_screen_content.dart';
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

  final List<Widget> _pages = [
    // home
    HomeScreenContent(),
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
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.task_alt_sharp), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.keyboard_voice_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: ''),
        ],
        selectedItemColor: Color(0xFF07AB81),
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
