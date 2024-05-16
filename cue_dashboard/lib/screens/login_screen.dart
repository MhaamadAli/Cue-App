import 'package:cue_dashboard/provider/user_provider.dart';
import 'package:cue_dashboard/widgets/main_button.dart';
import 'package:cue_dashboard/widgets/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 800, maxHeight: 650),
            child: Container(
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF06D6A0).withOpacity(0.2),
                    spreadRadius: 15,
                    blurRadius: 15,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/logo.png', width: 250),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome back',
                              style: GoogleFonts.montserrat(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 20),
                            Image.asset('assets/hand.png', width: 30),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Email',
                            style: TextStyle(
                                fontSize: 22, color: Color(0xFF595656))),
                        MyTextField(
                          controller: emailController,
                          hintText: 'example@gmail.com',
                          obscureText: false,
                        ),
                        const SizedBox(height: 20),
                        const Text('Password',
                            style: TextStyle(
                                fontSize: 22, color: Color(0xFF595656))),
                        MyTextField(
                          controller: passwordController,
                          hintText: 'password',
                          obscureText: true,
                        ),
                        const SizedBox(height: 100),
                        MainButton(
                            buttonColor: const Color(0xFF06D6A0),
                            buttonText: 'Log In',
                            onPressed: () => handleLogin(context)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleLogin(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    Provider.of<UserProvider>(context, listen: false)
        .login(email, password)
        .then((_) {
      Navigator.pushReplacementNamed(context, "/dashboard");
    }).catchError((error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login failed: $error')));
    });
  }
}
