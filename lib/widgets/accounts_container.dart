import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/screens/credit_report/monthly_report_screen.dart';

class LinkedAccountContainer extends StatelessWidget {
  const LinkedAccountContainer({
    super.key,
    required this.accounts,
    required this.name,
    required this.accountNumber,
    required this.height,
    required this.gradient,
    required this.imagePath,
    // required this.angle,
  });

  final String accounts;
  final double height;
  final List<Color> gradient;
  final String name;
  final String accountNumber;
  final String imagePath;
  // final double angle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradient),
        borderRadius: AppStyles.borderRadiusAllSides30,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                accounts,
                style: AppFonts.smallRegularTextBlack(context),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // First child: Column with name and account number
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        name,
                        style: AppFonts.smallRegularTextBlack(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Text(
                        accountNumber,
                        style: AppFonts.smallRegularTextBlack(context),
                      ),
                    ),
                  ],
                ),
                // Second child: Image
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 28),
                  child: Image.asset(
                    imagePath, // Load image from assets
                    width: 100, // Set width as needed
                    height: 50, // Set height as needed
                    fit: BoxFit.cover, // Adjust the image fit
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
