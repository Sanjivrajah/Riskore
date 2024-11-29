import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/screens/credit_report/all_reports_screen.dart';
import 'package:riskore/screens/profile/linked_account_screen.dart';
import 'package:riskore/screens/profile/profile_screen.dart';
import 'package:riskore/widget_library_1.dart';
import 'package:riskore/widget_library_2.dart';
import 'package:riskore/widgets/profile_container.dart';
import 'package:sizer/sizer.dart';
import 'package:riskore/core/navigation/navigation.dart';
import 'package:riskore/presets/fonts.dart';
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
    return Sizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Inter',
            primaryColor: AppColor.green,
            colorScheme: ColorScheme.light(
              primary: AppColor.green,
              onPrimary: AppColor.white,
              secondary: AppColor.black,
              onSecondary: Colors.white,
            ),
            useMaterial3: true,
          ),
          home: ProfileScreen(),
          routes: {
            SignUpScreen.routeName: (context) => SignUpScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            DashboardScreen.routeName: (context) => const DashboardScreen(),
            SplashScreen.routeName: (context) => const SplashScreen(),
            LinkedAccountScreen.routeName:(context) => const LinkedAccountScreen(),
          },
        );
      },
    );
  }
}
