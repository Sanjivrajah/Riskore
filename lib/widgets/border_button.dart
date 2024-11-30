import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';

class BorderButton extends StatelessWidget {
  const BorderButton({
    super.key,
    required this.text,
    required this.press,
    required this.width,
    required this.height,
    required this.borderColor,
  });

  final String text;
  final void Function() press; // shorthand for void Function()
  final double width;
  final double height;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: press,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: AppStyles.borderRadiusFullyRounded,
              side: BorderSide(
                color: borderColor,
              ),
            ),
          ),
          child: Row(
            children: [
              Text(
                text,
                style: AppFonts.smallLightText(context),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ));
  }
}
