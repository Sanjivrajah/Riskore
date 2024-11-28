import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/widgets/appbar_arrow.dart';
import 'package:riskore/widgets/border_button.dart';
import 'package:riskore/widgets/fill_button.dart';
import 'package:riskore/widgets/screen_title.dart';
import 'package:riskore/widgets/section_heading.dart';
import 'package:riskore/widgets/standard_container.dart';

class WidgetLibrary1 extends StatelessWidget {
  const WidgetLibrary1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarArrow(
        press: () {},
      ),
      backgroundColor: AppColor.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppStyles.edgeInsetsLR_20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ScreenTitle(text: "Widget Library 1"),
                const SectionHeading(text: "Containers"),
                StandardContainer(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    children: [
                      Text(
                        "Standard Container",
                        style: AppFonts.smallLightText(context),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        "lib/assets/icons/apply_for_loan.png",
                        width: 100,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StandardContainer(
                      width: (MediaQuery.sizeOf(context).width / 2) - 30,
                      child: Column(
                        children: [
                          Text(
                            "Standard Container",
                            style: AppFonts.smallLightText(context),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    StandardContainer(
                        width: (MediaQuery.sizeOf(context).width / 2) - 30,
                        child: Column(
                          children: [
                            Text(
                              "Standard Container",
                              style: AppFonts.smallLightText(context),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                SectionHeading(text: "Font Sizes"),
                Text(
                  "Standard Container 1",
                  style: AppFonts.largestLightTextGreen(
                      context), // equivalent to Figma 36 - Medium
                ),
                Text(
                  "Standard Container 1",
                  style: AppFonts.largestExtraLightTextGreen(
                      context), // equivalent to Figma 36 - Light
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Standard Container 2",
                  style: AppFonts.largeRegularText(
                      context), // equivalent to Figma 20 - Regular
                ),
                Text(
                  "Standard Container",
                  style: AppFonts.largeExtraLightText(
                      context), // equivalent to Figma 20 - Extra Light
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Standard Container",
                  style: AppFonts.normalLightText(
                      context), // equivalent to Figma 16 - Light
                ),
                Text(
                  "Standard Container",
                  style: AppFonts.normalLightTextGreen(
                      context), // equivalent to Figma 16 - Light
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Standard Container",
                  style: AppFonts.smallLightText(
                      context), // equivalent to Figma 10 - Light
                ),
                Text(
                  "Standard Container",
                  style: AppFonts.smallLightTextGreen(
                      context), // equivalent to Figma 10 - Light
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Standard Container",
                  style: AppFonts.extraSmallSemiBoldText(
                      context), // equivalent to Figma 8 - Light
                ),
                Text(
                  "Standard Container",
                  style: AppFonts.extraSmallLightText(
                      context), // equivalent to Figma 8 - Semi Bold
                ),
                const SizedBox(
                  height: 50,
                ),
                SectionHeading(text: "Buttons"),
                FillButton(
                  text: 'Fill Button',
                  press: () {},
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).width * 0.125,
                ),
                const SizedBox(
                  height: 20,
                ),
                BorderButton(
                  text: 'Border Button Green',
                  press: () {},
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).width * 0.125,
                  borderColor: AppColor.green,
                ),
                const SizedBox(
                  height: 20,
                ),
                BorderButton(
                  text: 'Border Button Red',
                  press: () {},
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).width * 0.125,
                  borderColor: AppColor.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
