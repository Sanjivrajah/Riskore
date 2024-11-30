import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/widgets/appbar_profile.dart';
import 'package:riskore/widgets/border_button.dart';
import 'package:riskore/widgets/nav_bar.dart';
import 'package:riskore/widgets/standard_container.dart';
import 'package:sizer/sizer.dart';

class SpendingPatternScreen extends StatelessWidget {
  const SpendingPatternScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarProfile(press: () {}),
        backgroundColor: AppColor.black,
        //bottomNavigationBar: const NavBar(),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: AppStyles.edgeInsetsLR_20,
          child: Column(
            children: [
              Text(
                "See what happens when you...",
                style: AppFonts.largeExtraLightText(
                    context), // equivalent to Figma 20 - Extra Light
              ),
              SizedBox(height: 20.sp),
              BorderButton(
                text: "Don't pay BNPL on time",
                press: () {},
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).width * 0.125,
                borderColor: AppColor.green,
              ),
              SizedBox(height: 20.sp),
              BorderButton(
                text: 'Spend too much on luxury items every month',
                press: () {},
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).width * 0.125,
                borderColor: AppColor.green,
              ),
              SizedBox(height: 20.sp),
              BorderButton(
                text: 'Save up 10% of your salary every month',
                press: () {},
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).width * 0.125,
                borderColor: AppColor.green,
              ),
              SizedBox(height: 25.sp),
              StandardContainer(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  children: [
                    Text(
                      "Some text here...",
                      style: AppFonts.normalLightText(
                          context), // equivalent to Figma 20 - Extra Light
                    ),
                  ],
                ),
              )
            ],
          ),
        ))));
  }
}
