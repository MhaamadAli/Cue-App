import 'package:flutter/material.dart';
import 'package:mobile/widgets/main_button.dart';
import 'package:mobile/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:mobile/provider/user_provider.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.popAndPushNamed(context, "/welcome");
        },
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Signup',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 100),
              const Text(
                'Username',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF595656),
                ),
              ),
              MyTextField(
                controller: usernameController,
                hintText: 'username',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF595656),
                ),
              ),
              MyTextField(
                controller: emailController,
                hintText: 'example@gmail.com',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF595656),
                ),
              ),
              MyTextField(
                controller: passwordController,
                hintText: 'password',
                obscureText: true,
              ),
              const SizedBox(height: 54),
              MainButton(
                  buttonColor: const Color(0xFF06D6A0),
                  buttonText: 'Signup',
                  onPressed: () => handleSignup(context)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Already have an account?',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF87CEEB),
                        )),
                    TextButton(
                      child: const Text('Login',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFDC143C),
                          )),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "/login");
                      },
                    )
                  ]),
              const SizedBox(height: 34),
              TextButton.icon(
                icon: Image.asset(
                  'assets/googleLogo.png',
                  height: 41,
                  width: 41,
                ),
                label: const Text(
                  'Or connect using Google',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF87CEEB),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        )),
      ),
    );
  }

  void handleSignup(BuildContext context) {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    Provider.of<UserProvider>(context, listen: false)
        .signup(username, email, password)
        .then((_) {
      Navigator.pushReplacementNamed(context, "/home");
    }).catchError((error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Signup failed: $error')));
    });
  }
}
