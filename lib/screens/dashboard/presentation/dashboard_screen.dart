import 'package:flutter/material.dart';
import 'package:riskore/core/navigation/navigation.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/screens/credit_report/all_reports_screen.dart';
import 'package:riskore/screens/financial_health/financial_health_screen.dart';
import 'package:riskore/screens/loan_application/easy_loan_screen.dart';
import 'package:riskore/widgets/appbar_profile.dart';
import 'package:riskore/widgets/semicircle_progress.dart';
import 'package:riskore/widgets/shortcut_menu_button.dart';
import 'package:riskore/widgets/standard_container.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard-screen';

  const DashboardScreen({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App Logo and Profile
                Text(
                  "Welcome Back,",
                  style: AppFonts.largeExtraLightText(
                      context), // equivalent to Figma 20 - Extra Light
                ),

                Text(
                  "Ahmad",
                  style: AppFonts.largestLightTextGreen(
                      context), // equivalent to Figma 36 - Light
                ),
                const SizedBox(height: 40),

                Text(
                  "Your Credit Score",
                  style: AppFonts.normalLightText(
                      context), // equivalent to Figma 16 - Light
                ),
                const SizedBox(height: 5),

                StandardContainer(
                  // StandardContainer {
                  width: (MediaQuery.sizeOf(context).width),
                  child: Column(
                    // Main Column {
                    children: [
                      Stack(
                        // Upper Stack with Circle and Text {
                        alignment: Alignment.center,
                        children: [
                          Column(
                            // Center Text Column {
                            children: [
                              SizedBox(height: 15),
                              Text(
                                "82%",
                                style: AppFonts.largeExtraLightText(context),
                              ),
                              //Change Indicator
                              const Row(
                                // Change Row {
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                  Text(
                                    "10% in last month",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 75, 62),
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ), // } end Change Container
                            ],
                          ), // } end Center Text Column
                          Column(
                            // Progress Bar Column {
                            children: [
                              SizedBox(height: 15),
                              CircularArchProgressBar(value: 82.0),
                              SizedBox(height: 15),
                            ],
                          ), // } end Progress Bar Column
                        ],
                      ), // } end Upper Stack

                      // Improve Button
                      ElevatedButton(
                        // Improve Button {
                        onPressed: () {
                          // Add improvement action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child: const Text(
                          "Improve Credit Risk",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ), // } end Improve Button
                    ],
                  ), // } end Main Column
                ), // } end StandardContainer

                const SizedBox(height: 50),

                //Financial Matters
                Text(
                  "Your Financial Matters",
                  style: AppFonts.normalLightText(
                      context), // equivalent to Figma 16 - Light
                ),
                const SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StandardContainer(
                        width: (MediaQuery.sizeOf(context).width / 2 - 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Financial Matters",
                              style: AppFonts.smallLightText(
                                  context), // equivalent to Figma 16 - Light
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "lib/assets/icons/apply_for_loan.png",
                                  width: 40,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Subscription",
                                      style: AppFonts.extraSmallSemiBoldText(
                                          context),
                                    ),
                                    Text(
                                      "Amount",
                                      style:
                                          AppFonts.extraSmallLightText(context),
                                    )
                                  ],
                                ),
                                Text(
                                  "Date",
                                  style:
                                      AppFonts.extraSmallSemiBoldText(context),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "lib/assets/icons/apply_for_loan.png",
                                  width: 40,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Subscription",
                                      style: AppFonts.extraSmallSemiBoldText(
                                          context),
                                    ),
                                    Text(
                                      "Amount",
                                      style:
                                          AppFonts.extraSmallLightText(context),
                                    )
                                  ],
                                ),
                                Text(
                                  "Date",
                                  style:
                                      AppFonts.extraSmallSemiBoldText(context),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "lib/assets/icons/apply_for_loan.png",
                                  width: 40,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Subscription",
                                      style: AppFonts.extraSmallSemiBoldText(
                                          context),
                                    ),
                                    Text(
                                      "Amount",
                                      style:
                                          AppFonts.extraSmallLightText(context),
                                    )
                                  ],
                                ),
                                Text(
                                  "Date",
                                  style:
                                      AppFonts.extraSmallSemiBoldText(context),
                                ),
                              ],
                            ),
                            const SizedBox(height: 60)
                          ],
                        )),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).popUntil((route) =>
                                route.isFirst); // Go back to the first route
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) =>
                                    Navigation(), // Navigate to Navigation
                              ),
                            );
                          },
                          child: StandardContainer(
                              //Financial Wellness
                              width:
                                  (MediaQuery.sizeOf(context).width / 2 - 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Financial Wellness Score",
                                    style:
                                        AppFonts.smallLightTextGreen(context),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "89%",
                                    style: AppFonts.normalLightText(context),
                                  ),

                                  Row(
                                    // Button Content Row {
                                    children: [
                                      Text(
                                        "See more",
                                        style: AppFonts.extraSmallLightText(
                                            context),
                                      ),
                                      const SizedBox(width: 4),
                                      const Icon(
                                        Icons.chevron_right,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ],
                                  ), // } end Button Content Row
                                ],
                              )),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const EasyLoanScreen(),
                              ),
                            );
                          },
                          child: StandardContainer(
                            //Apply for Loan
                            width: (MediaQuery.sizeOf(context).width / 2 - 40),
                            child: Column(
                              children: [
                                Text(
                                  "Apply for Loan",
                                  style: AppFonts.smallLightText(context),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                  "lib/assets/icons/apply_for_loan.png",
                                  width: 75,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AllReportsScreen(),
                              ),
                            );
                          },
                          child: StandardContainer(
                              //Generate Credit Report
                              width:
                                  (MediaQuery.sizeOf(context).width / 2 - 40),
                              child: Column(
                                children: [
                                  Text(
                                    "Credit Report",
                                    style:
                                        AppFonts.normalLightTextGreen(context),
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
