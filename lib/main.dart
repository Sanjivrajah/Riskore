import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riskore/core/auth_widget_tree.dart';
import 'package:riskore/core/data/upcoming_payment_data.dart';
import 'package:riskore/core/providers/full_user_data_provider.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/screens/authentication/auth.dart';
import 'package:riskore/screens/credit_report/all_reports_screen.dart';
import 'package:riskore/screens/dashboard/presentation/testing.dart';
import 'package:riskore/screens/onboarding/presentation/onboarding_screen.dart';
import 'package:riskore/screens/profile/linked_account_screen.dart';
import 'package:riskore/screens/profile/profile_screen.dart';
import 'package:riskore/screens/spending_pattern/spending_pattern_screen.dart';
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
              DashboardScreen.routeName: (context) => DashboardScreen(
                    upcomingPaymentList: upcomingPaymentList,
                    index: 0,
                  ),
              SplashScreen.routeName: (context) => const SplashScreen(),
              OnboardingScreen.routeName: (context) => const OnboardingScreen(),
              // ignore: equal_keys_in_map
              LinkedAccountScreen.routeName: (context) =>
                  const LinkedAccountScreen(),
            },
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
