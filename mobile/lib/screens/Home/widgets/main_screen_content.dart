import 'package:flutter/material.dart';
import 'package:mobile/provider/meeting_provider.dart';
import 'package:mobile/provider/user_provider.dart';
import 'package:mobile/screens/Home/widgets/dialog_manager.dart';
import 'package:mobile/screens/Home/widgets/meeting_list_widget.dart';
import 'package:mobile/screens/Home/widgets/tasks_list_widget.dart';
import 'package:provider/provider.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Provider.of<UserProvider>(context, listen: false).user != null) {
        Provider.of<MeetingsProvider>(context, listen: false).closestMeetings;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final meetings = Provider.of<MeetingsProvider>(context).closestMeetings;
    final user = Provider.of<UserProvider>(context).user;
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
                    Expanded(
                      child: UserInfoDisplay(),
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
                          showNotificationDialog(context);
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
                    itemCount: meetings.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: index < meetings.length - 1 ? 5 : 0),
                        child: MeetingListCard(inputMeeting: meetings[index]),
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
    final meetings = Provider.of<MeetingsProvider>(context).closestMeetings;
    return AnimatedBuilder(
      animation: _currentPageNotifier,
      builder: (_, __) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List<Widget>.generate(meetings.length, (int index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _currentPageNotifier.value == index ? 80.0 : 15.0,
              height: 7.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                color: _currentPageNotifier.value == index
                    ? Color(0xFFFFD166)
                    : Colors.grey.shade300,
                borderRadius: _currentPageNotifier.value == index
                    ? BorderRadius.circular(4.0)
                    : BorderRadius.circular(4.0),
              ),
            );
          }),
        );
      },
    );
  }
}

class UserInfoDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return user != null
        ? Text(
            "Hello, ${user.username}!",
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          )
        : const Text("No user logged in");
  }
}
