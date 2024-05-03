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
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/house.png', height: 29, width: 29),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/taskPage.png', height: 29, width: 29),
              label: 'task'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/assistant.png', height: 29, width: 29),
              label: 'assistant'),
          BottomNavigationBarItem(
              icon:
                  Image.asset('assets/schedulePage.png', height: 29, width: 29),
              label: 'schedule'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/location.png', height: 29, width: 29),
              label: 'maps'),
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
