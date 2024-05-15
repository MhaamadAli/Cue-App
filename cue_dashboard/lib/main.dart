import 'package:cue_dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:cue_dashboard/screens/login_screen.dart';
import 'package:cue_dashboard/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CUE Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => SplashScreen(),
        "/login": (context) => LoginScreen(),
        "/dashboard": (context) => DashboardPage(),
      },
    );
  }
}
