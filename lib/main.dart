import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:riskore/core/navigation/navigation.dart';
import 'package:riskore/core/presets/fonts.dart';
import 'package:riskore/screens/splash_screen.dart';
import 'package:riskore/screens/authentication/presentation/login_screen.dart';
import 'package:riskore/screens/authentication/presentation/signup_screen.dart';
import 'package:riskore/screens/dashboard/presentation/dashboard_screen.dart';
import 'package:riskore/firebase_options.dart';
// import 'package:riskore/features/authentication/presentation/auth_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riskore',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
      routes: {
        SignUpScreen.routeName: (context) => SignUpScreen(),
        LoginScreen.routeName: (context) =>
            LoginScreen(),
        DashboardScreen.routeName: (context) => const DashboardScreen(),
        SplashScreen.routeName: (context) => const SplashScreen()
      },
    );
  }
}

