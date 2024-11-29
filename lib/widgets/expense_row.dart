import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:sizer/sizer.dart';

class ExpenseRow extends StatelessWidget {
  const ExpenseRow({
    super.key,
    required this.image,
    required this.name,
    required this.amount,
    required this.press,
  });

  final String image;
  final String name;
  final String amount;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 28.sp,
          height: 28.sp,
          child: Image.asset(
            image,
          ),
        ),
        SizedBox(width: 15),
        SizedBox(
          height: 28.sp,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                name,
                style: AppFonts.smallRegularText(
                  context,
                ),
              ),
              Text(
                amount,
                style: AppFonts.smallLightText(
                  context,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: press,
          icon: Icon(
            size: 15,
            Icons.arrow_forward_ios_outlined,
            color: AppColor.white,
          ),
        )
      ],
    );
  }
}
