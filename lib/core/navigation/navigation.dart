import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/screens/dashboard/presentation/dashboard_screen.dart';
import 'package:riskore/screens/financial_health/financial_health_screen.dart';
import 'package:riskore/screens/loan_application/easy_loan_screen.dart';
import 'package:riskore/screens/profile/profile_screen.dart';
import 'package:sizer/sizer.dart';

class Navigation extends StatefulWidget {
  static const routeName = '/navigation';
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
    static GlobalKey<_NavigationState> globalKey =
      new GlobalKey<_NavigationState>();
  BottomNavigationBar get navigationBar {
    return _NavigationState.globalKey.currentWidget as BottomNavigationBar;
  }

  int currentIndex = 0;

  List<Widget> screens = [
    DashboardScreen(),
    EasyLoanScreen(),
    FinancialHealthScreen(),
    ProfileScreen()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.black,
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(gradient: navBarGradient()),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: AppColor.green,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14.sp,
          unselectedFontSize: 14.sp,
          currentIndex: currentIndex,
          onTap: (int newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 22.sp,
                height: 25.sp,
                child: Image.asset(
                  currentIndex == 0
                      ? "lib/assets/icons/home_nav_selected.png" // Selected icon
                      : "lib/assets/icons/home_nav.png", // Unselected icon
                  height: 21.sp,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 23.sp,
                height: 25.sp,
                child: Image.asset(
                  currentIndex == 1
                      ? "lib/assets/icons/loan_nav_selected.png" // Selected icon
                      : "lib/assets/icons/loan_nav.png", // Unselected icon
                  width: 23.sp,
                  alignment: Alignment.center,
                ),
              ),
              label: 'Loan',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 22.sp,
                height: 25.sp,
                child: Image.asset(
                  currentIndex == 2
                      ? "lib/assets/icons/tips_nav_selected.png" // Selected icon
                      : "lib/assets/icons/tips_nav.png", 
                  width: 22.sp,
                  alignment: Alignment.center,
                ),
              ),
              label: 'Tips',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 22.sp,
                height: 25.sp,
                child: Image.asset(
                  currentIndex == 3
                      ? "lib/assets/icons/profile_nav_selected.png" // Selected icon
                      : "lib/assets/icons/profile_nav.png", 
                  width: 22.sp,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
