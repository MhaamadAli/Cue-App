import 'package:flutter/material.dart';
import 'package:mobile/widgets/onboardpage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  void _onSkipPressed() {
    Navigator.of(context).pushReplacementNamed("/welcome");
  }

  void _onNextPressed() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacementNamed("/welcome");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/welcome");
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          Positioned.fill(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: <Widget>[
                OnboardPage(
                  imagePath: 'assets/onboarding1.png',
                  text:
                      'Behind every successful human is someone reminding him of his duties.',
                  secondaryText:
                      'Cue is your daily personal assistant, it uses artificial intelligence to keep you on top of your day!',
                  buttonText: 'Next',
                  onButtonPressed: _onNextPressed,
                ),
                OnboardPage(
                  imagePath: 'assets/onboarding2.png',
                  text: "With Cue's smart notifications you won't miss a task.",
                  secondaryText:
                      'You just need to talk to it and it will handle everything',
                  buttonText: 'Next',
                  onButtonPressed: _onNextPressed,
                ),
                OnboardPage(
                  imagePath: 'assets/onboarding3.png',
                  text: 'You talk, Cue plans.',
                  secondaryText: '',
                  buttonText: 'Get Started',
                  onButtonPressed: _onNextPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
