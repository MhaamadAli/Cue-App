import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/provider/meeting_provider.dart';
import 'package:mobile/provider/task_provider.dart';
import 'package:mobile/services/meeting_service.dart';
import 'package:mobile/services/tasks_service.dart';
import 'package:provider/provider.dart';
import 'package:mobile/screens/Assistant/assistant_screen.dart';
import 'package:mobile/screens/Home/home.dart';
import 'package:mobile/screens/Tasks/tasks_screen.dart';
import 'package:mobile/screens/auth/login_screen.dart';
import 'package:mobile/screens/auth/signup_screen.dart';
import 'package:mobile/screens/map/map_screen.dart';
import 'package:mobile/screens/onboarding/welcome_screen.dart';
import 'package:mobile/screens/onboarding/onboarding_screen.dart';
import 'package:mobile/screens/profile/profile_screen.dart';
import 'package:mobile/screens/schedule/schedule_screen.dart';
import 'package:mobile/screens/splash_screen.dart';
import 'package:mobile/provider/user_provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(
          create: (context) => TasksProvider(TaskService()),
        ),
        ChangeNotifierProvider(
          create: (context) => MeetingsProvider(MeetingService()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CUE personal buddy',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          textTheme: TextTheme(
            headlineLarge: GoogleFonts.lexendDeca(
                fontSize: 24, fontWeight: FontWeight.bold),
            bodyMedium:
                GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w300),
          ),
          useMaterial3: true,
        ),
        routes: {
          "/": (context) => SplashScreen(),
          "/onboarding": (context) => OnboardingScreen(),
          "/welcome": (context) => WelcomeScreen(),
          "/login": (context) => LoginScreen(),
          "/signup": (context) => SignupScreen(),
          "/home": (context) => HomeScreen(),
          "/schedule": (context) => ScheduleScreen(),
          "/tasks": (context) => TasksScreen(),
          "/map": (context) => MapScreen(),
          "/assistant": (context) => AssistantScreen(
                onBack: () =>
                    Navigator.of(context).pushReplacementNamed('/home'),
              ),
          "/profile": (context) => ProfileScreen()
        },
      ),
    );
  }
}
