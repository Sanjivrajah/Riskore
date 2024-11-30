import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riskore/core/auth_widget_tree.dart';
import 'package:riskore/core/providers/full_user_data_provider.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/screens/authentication/auth.dart';
import 'package:riskore/screens/credit_report/all_reports_screen.dart';
import 'package:riskore/screens/dashboard/presentation/testing.dart';
import 'package:riskore/screens/onboarding/presentation/onboarding_screen.dart';
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
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => FullDataUserProvider()),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'Inter',
              primaryColor: AppColor.green,
              colorScheme: ColorScheme.light(
                primary: AppColor.green,
                onPrimary: AppColor.white,
                secondary: AppColor.black,
                onSecondary: const Color.fromARGB(255, 164, 150, 150),
              ),
              useMaterial3: true,
            ),
            home: AuthWidgetTree(),
            routes: {
              SignUpScreen.routeName: (context) => SignUpScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              DashboardScreen.routeName: (context) => const DashboardScreen(),
              SplashScreen.routeName: (context) => const SplashScreen(),
              OnboardingScreen.routeName: (context) => const OnboardingScreen(),
              // ignore: equal_keys_in_map
              LinkedAccountScreen.routeName:(context) => const LinkedAccountScreen(),
            },
          ),
        );
      },
    );
  }
}
