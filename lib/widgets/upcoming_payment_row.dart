import 'package:flutter/material.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:sizer/sizer.dart';

class UpcomingPaymentRow extends StatelessWidget {
  const UpcomingPaymentRow({
    Key? key,
    required this.image,
    required this.name,
    required this.amount,
    required this.date,
  }) : super(key: key);

  final String image;
  final String name;
  final String amount;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.sp),
      child: Row(
        children: [
          Image.asset(image, width: 28.sp),
          SizedBox(width: 18.sp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppFonts.smallRegularText(context),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10.sp),
              Text(
                "RM " + amount,
                style: AppFonts.smallLightText(context),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          const Spacer(),
          Text(date, style: AppFonts.smallLightText(context)),
        ],
      ),
    );
  }
}
