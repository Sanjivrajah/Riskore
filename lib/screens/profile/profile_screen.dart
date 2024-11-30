import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/widgets/appbar_profile.dart';
import 'package:riskore/widgets/navigation_drawer.dart';
import 'package:riskore/widgets/screen_title.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarProfile(press: () => {}),
        backgroundColor: AppColor.black,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: AppStyles.edgeInsetsLR_20,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ScreenTitle(text: "My Account"),
                  SizedBox(height: 20.sp),
                  Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppColor.green,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "AM",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Text(
                    'Ahmad',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  NavDrawer(),
                  SizedBox(
                    height: 30.sp,
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
