import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/questions.dart';
import 'package:riskore/screens/dashboard/presentation/dashboard_screen.dart';
import 'package:riskore/screens/onboarding/presentation/questions_screen.dart';
import 'package:riskore/widgets/appbar_arrow.dart';
import 'package:riskore/widgets/fill_button.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarArrow(
        press: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColor.black,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset("lib/assets/SemicircleGrad.png"),
            Padding(
              padding: AppStyles.edgeInsetsLR_20,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height - 38.sp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height / 4.5),
                    Text(
                      "Hey Ahmad.",
                      style: AppFonts.largestExtraLightTextGreen(context),
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: 35.sp,
                      child: Divider(
                        height: 1,
                        thickness: 0.5,
                        color: AppColor.white,
                      ),
                    ),
                    const SizedBox(height: 35),
                    Text(
                      "Before using the app,",
                      style: AppFonts.normalLightText(context),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "help us get to know you better!",
                      style: AppFonts.normalLightText(context),
                    ),
                    const SizedBox(height: 45),
                    FillButton(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const QuestionsScreen(
                              questions: questionsList,
                            ),
                          ),
                        );
                      },
                      text: "Start answering questions",
                      width: MediaQuery.sizeOf(context).width - 100,
                      height: 45,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
