import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:sizer/sizer.dart';

class ShortcutMenuButton extends StatelessWidget {
  const ShortcutMenuButton({
    super.key,
    required this.text,
    required this.image,
    required this.press,
  });

  final String text;
  final String image;
  final void Function() press; // shorthand for void Function()

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: 35.sp,
              height: 35.sp,
              decoration: BoxDecoration(
                gradient: containerGradient(),
                borderRadius: AppStyles.borderRadiusAllSides16,
              ),
            ),
            SizedBox(
              width: 35.sp,
              height: 35.sp,
              child: ElevatedButton(
                onPressed: press,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Image.asset(
                  image,
                  width: 40.sp,
                  height: 40.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: AppFonts.smallLightText(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
