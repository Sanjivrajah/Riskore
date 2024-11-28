import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';

class FillButton extends StatelessWidget {
  const FillButton({
    super.key,
    required this.text,
    required this.press,
    required this.width,
    required this.height,
  });

  final String text;
  final void Function() press; // shorthand for void Function()
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: press,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            AppColor.white,
          ),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: AppStyles.borderRadiusFullyRounded,
            ),
          ),
        ),
        child: Text(
          text,
          style: AppFonts.normalLightTextBlack(context),
        ),
      ),
    );
  }
}
