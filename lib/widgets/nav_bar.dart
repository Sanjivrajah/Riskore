import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/screens/dashboard/presentation/dashboard_screen.dart';
import 'package:sizer/sizer.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: navBarGradient()),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColor.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14.sp,
        unselectedFontSize: 14.sp,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(),
                  ),
                );
              },
              child: SizedBox(
                width: 22.sp,
                height: 25.sp,
                child: Image.asset(
                  "lib/assets/icons/home_nav_selected.png",
                  height: 21.sp,
                ),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 23.sp,
              height: 25.sp,
              child: Image.asset(
                "lib/assets/icons/loan_nav.png",
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
                "lib/assets/icons/tips_nav.png",
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
                "lib/assets/icons/profile_nav.png",
                width: 22.sp,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
