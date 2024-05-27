import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; //for gesture detection
import 'package:task_management/Data/view/Components/custom_components/gradientButton.dart';
import 'package:task_management/Data/view/Components/custom_components/login_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top:80),
          child: Column(
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Image.asset('assets/images/company_logo.png'),
              const SizedBox(height: 15, width: 200),
              const LoginField(hintText: 'Write your email here', labelText: 'Email',),
              const SizedBox(height: 15, width: 200),
              const LoginField(hintText: 'Write your password here', labelText: 'Password',),
              const SizedBox(height: 20),
              const GradientButton(gotoRoute: "/userdashboard", buttonText: 'Sign in',),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50), //apply padding horizontal or vertical only
                child: Text(
                  'Don\'t have an account?\nContact admin for inquiries',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}

