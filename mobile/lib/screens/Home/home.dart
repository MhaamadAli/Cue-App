import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/provider/meeting_provider.dart';
import 'package:mobile/provider/task_provider.dart';
import 'package:mobile/provider/user_provider.dart';
import 'package:mobile/screens/Assistant/assistant_screen.dart';
import 'package:mobile/screens/Home/widgets/main_screen_content.dart';
import 'package:mobile/screens/Tasks/tasks_screen.dart';
import 'package:mobile/screens/map/map_screen.dart';
import 'package:mobile/screens/schedule/schedule_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Provider.of<UserProvider>(context, listen: false).user != null) {
        Provider.of<TasksProvider>(context, listen: false).loadAllTasks();
        Provider.of<TasksProvider>(context, listen: false).loadTodoTasks();
        Provider.of<MeetingsProvider>(context, listen: false).loadAllMeetings();
      }
    });
  }

  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToHome() {
    setState(() {
      _selectedIndex = 0;
    });
  }

  List<Widget> _pages() {
    return [
      HomeScreenContent(),
      TasksScreen(),
      AssistantScreen(
        onBack: () => _navigateToHome(),
      ),
      ScheduleScreen(),
      MapScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages(),
      ),
      bottomNavigationBar: _selectedIndex != 2
          ? BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _navigateBottomBar,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/houseGrey.svg',
                        height: 29,
                        width: 29,
                        color: _selectedIndex == 0
                            ? Color(0xFF07AB81)
                            : Colors.grey),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/taskGrey.svg',
                        height: 29,
                        width: 29,
                        color: _selectedIndex == 1
                            ? Color(0xFF07AB81)
                            : Colors.grey),
                    label: 'task'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/assistantGrey.svg',
                        height: 29,
                        width: 29,
                        color: _selectedIndex == 2
                            ? Color(0xFF07AB81)
                            : Colors.grey),
                    label: 'assistant'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/calendarGrey.svg',
                        height: 29,
                        width: 29,
                        color: _selectedIndex == 3
                            ? Color(0xFF07AB81)
                            : Colors.grey),
                    label: 'schedule'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/mapsGrey.svg',
                        height: 29,
                        width: 29,
                        color: _selectedIndex == 4
                            ? Color(0xFF07AB81)
                            : Colors.grey),
                    label: 'maps'),
              ],
              selectedItemColor: Color(0xFF07AB81),
              unselectedItemColor: Colors.grey,
              iconSize: 30,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            )
          : null,
    );
  }
}
