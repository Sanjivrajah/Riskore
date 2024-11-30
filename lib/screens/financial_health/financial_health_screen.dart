import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/screens/credit_report/all_reports_screen.dart';
import 'package:riskore/widgets/appbar_profile.dart';
import 'package:riskore/widgets/border_button.dart';
import 'package:riskore/widgets/nav_bar.dart';
import 'package:riskore/widgets/screen_title.dart';
import 'package:riskore/widgets/section_heading.dart';
import 'package:riskore/widgets/semicircle_progress.dart';
import 'package:riskore/widgets/shortcut_menu_button.dart';
import 'package:riskore/widgets/standard_container.dart';
import 'package:sizer/sizer.dart';

class FinancialHealthScreen extends StatelessWidget {
  const FinancialHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarProfile(press: () {}),
      backgroundColor: AppColor.black,
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppStyles.edgeInsetsLR_20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ScreenTitle(text: "Your Financial Health"),
                SizedBox(height: 15.sp),
                StandardContainer(
                  width: (MediaQuery.sizeOf(context).width),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 15.sp),
                          Text(
                            "82%",
                            style: AppFonts.largeExtraLightText(context),
                          ),
                          Text(
                            "Healthy",
                            style: AppFonts.smallLightTextGreen(context),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 15.sp),
                          CircularArchProgressBar(value: 82.0),
                          SizedBox(height: 15.sp),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StandardContainer(
                      width: (MediaQuery.sizeOf(context).width / 2) - 25,
                      child: Column(
                        children: [
                          Text(
                            "Avg. Monthly Expenses",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                              color: AppColor.red,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "RM 2000.80",
                            style: AppFonts.largeExtraLightText(context),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    StandardContainer(
                        width: (MediaQuery.sizeOf(context).width / 2) - 25,
                        child: Column(
                          children: [
                            Text(
                              "Avg. Monthly Income",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                                color: AppColor.green,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "RM 2560.90",
                              style: AppFonts.largeExtraLightText(context),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ],
                ),
                SizedBox(height: 25.sp),
                const SectionHeading(text: "What can you do to improve?"),
                SizedBox(height: 10.sp),
                BorderButton(
                  text: 'Learn your spending pattern',
                  press: () {},
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).width * 0.125,
                  borderColor: AppColor.green,
                ),
                SizedBox(height: 17.sp),
                BorderButton(
                  text: 'Current Debt Obligations',
                  press: () {},
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).width * 0.125,
                  borderColor: AppColor.red,
                ),
                SizedBox(height: 25.sp),
                const SectionHeading(text: "Savings Optimization for you"),
                SizedBox(height: 10.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 40.sp,
                      child: ShortcutMenuButton(
                        text: "Emergency Fund Building",
                        image: 'lib/assets/icons/your_loan.png',
                        press: () {},
                      ),
                    ),
                    SizedBox(
                      width: 40.sp,
                      child: ShortcutMenuButton(
                        text: "Manage Your Assets",
                        image: 'lib/assets/icons/manage_your_assets.png',
                        press: () {},
                      ),
                    ),
                    SizedBox(
                      width: 40.sp,
                      child: ShortcutMenuButton(
                        text: "Investment Basics",
                        image: 'lib/assets/icons/investment_basics.png',
                        press: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
