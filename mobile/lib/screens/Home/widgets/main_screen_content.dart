import 'package:flutter/material.dart';
import 'package:mobile/models/meeting_model.dart';
import 'package:mobile/screens/Home/widgets/meeting_list_widget.dart';
import 'package:mobile/screens/Home/widgets/tasks_list_widget.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  final List<Meeting> _meetings = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    controller: _pageController,
                    itemCount: _meetings.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: index < _meetings.length - 1 ? 5 : 0),
                        child: MeetingListCard(inputMeeting: _meetings[index]),
                      );
                    },
                    onPageChanged: (int page) {
                      _currentPageNotifier.value = page;
                    },
                  ),
                ),
              ),
              
              _buildPageIndicator(),
              const SizedBox(height: 10),
              const TasksListWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return AnimatedBuilder(
      animation: _currentPageNotifier,
      builder: (_, __) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List<Widget>.generate(_meetings.length, (int index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _currentPageNotifier.value == index
                  ? 80.0
                  : 15.0,
              height: 7.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                color: _currentPageNotifier.value == index
                    ? Color(0xFFFFD166)
                    : Colors.grey.shade300,
                borderRadius: _currentPageNotifier.value == index
                    ? BorderRadius.circular(4.0)
                    : BorderRadius.circular(
                        4.0),
              ),
            );
          }),
        );
      },
    );
  }
}
