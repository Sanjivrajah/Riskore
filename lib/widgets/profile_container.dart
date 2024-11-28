import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:sizer/sizer.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.sp,
      width: 42.sp,
      decoration: const BoxDecoration(
        color: Color.fromARGB(42, 255, 255, 255),
        borderRadius: AppStyles.borderRadiusFullyRounded,
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: 22.sp,
                height: 22.sp,
                decoration: BoxDecoration(
                  color: AppColor.green,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text("AM",
                      style: AppFonts.smallRegularTextBlack(context)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 35.sp,
                height: 22.sp,
                child: Text(
                  "Ahmad",
                  style: AppFonts.smallRegularText(context),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
