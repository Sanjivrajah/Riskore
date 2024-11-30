import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/screens/loan_application/loan_application_screen.dart';
import 'package:sizer/sizer.dart';

class LoanOfferRow extends StatelessWidget {
  const LoanOfferRow({
    super.key,
    required this.image,
    required this.bankName,
    required this.interest,
    required this.amount,
    required this.press,
    required this.period,
    required this.visible,
  });
  final String image;
  final String bankName;
  final String interest;
  final String period;
  final String amount;
  final void Function() press;
  final bool visible;

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
              interest + " | " + period,
              style: AppFonts.smallLightText(context),
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Text(
              "RM " + amount.toString(),
              style: AppFonts.smallLightText(context),
            ),
            SizedBox(height: 10.sp),
            SizedBox(
              width: 40.sp,
              height: 30,
              child: Visibility(
                visible: visible,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoanApplicationScreen(
                          image: image,
                          bankName: bankName,
                          interest: interest,
                          period: period,
                          amount: amount,
                          maxValue: amount,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
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
                    "View Loan",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                      height: 0,
                    ),
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
