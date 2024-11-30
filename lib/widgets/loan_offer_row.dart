import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:sizer/sizer.dart';

class LoanOfferRow extends StatelessWidget {
  const LoanOfferRow({
    super.key,
    required this.image,
    required this.bankName,
    required this.interest,
    required this.amount,
    required this.press,
  });
  final String image;
  final String bankName;
  final String interest;
  final String amount;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 32.sp,
          width: 32.sp,
          child: Image.asset(image),
        ),
        SizedBox(width: 15.sp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bankName,
              style: AppFonts.smallLightText(context),
            ),
            SizedBox(height: 10.sp),
            Text(
              interest,
              style: AppFonts.smallLightText(context),
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Text(
              amount,
              style: AppFonts.smallLightText(context),
            ),
            SizedBox(height: 10.sp),
            SizedBox(
              width: 40.sp,
              height: 25,
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
                  "Accept Loan",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black,
                    height: 0,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
