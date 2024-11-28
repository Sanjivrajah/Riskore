import 'dart:async'; // Import the async library for Timer
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riskore/core/navigation/navigation.dart';
import 'package:riskore/screens/splash_screen.dart';
import 'package:riskore/screens/authentication/presentation/login_screen.dart';

class AuthWidgetTree extends StatefulWidget {
  const AuthWidgetTree({super.key});

  @override
  State<AuthWidgetTree> createState() => _AuthWidgetTreeState();
}

class _AuthWidgetTreeState extends State<AuthWidgetTree> {
  bool _showWelcomeScreen = true; // Flag to control the welcome screen display

  @override
  void initState() {
    super.initState();
    // Start a timer to switch screens after 5 seconds
    Timer(const Duration(seconds: 5), () {
      setState(() {
        _showWelcomeScreen = false; // Change the flag to show the next screen
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return const LoadingScreen();
        // }
        if (_showWelcomeScreen) {
          return const SplashScreen(); // Show welcome screen for 5 seconds
        } else if (snapshot.hasData) {
          print('navigation');
          return const Navigation(); // Navigate to the main app if logged in
        } else {
          print('login/signup');
          return LoginScreen(); // Show login/signup screen if not logged in
        }
      },
    );
  }
}
