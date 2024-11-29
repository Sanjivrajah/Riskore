import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/screens/credit_report/monthly_report_screen.dart';

class MonthlyReportContainer extends StatelessWidget {
  const MonthlyReportContainer({
    super.key,
    required this.month,
    required this.height,
    required this.gradientColors,
  });

  final String month;
  final double height;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: AppStyles.borderRadiusTop30,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                month,
                style: AppFonts.normalLightText(context),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MonthlyReportScreen()),
              ),
              icon: Icon(
                size: 15,
                Icons.arrow_forward_ios_outlined,
                color: AppColor.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
