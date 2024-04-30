import 'package:flutter/material.dart';
import 'package:mobile/screens/Home/widgets/meeting_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    SizedBox(
                      width: 20
                    ),
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
