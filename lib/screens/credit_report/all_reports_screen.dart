import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/screens/credit_report/monthly_report_screen.dart';
import 'package:riskore/widgets/appbar_arrow.dart';
import 'package:riskore/widgets/datepicker.dart';
import 'package:riskore/widgets/monthly_report_container.dart';
import 'package:riskore/widgets/screen_title.dart';
import 'package:riskore/widgets/section_heading.dart';
import 'package:sizer/sizer.dart';

class AllReportsScreen extends StatelessWidget {
  const AllReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarArrow(
        press: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColor.black,
      body: SafeArea(
        child: Padding(
          padding: AppStyles.edgeInsetsLR_20,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ScreenTitle(text: "Credit Reports"),
                SizedBox(height: 20.sp),
                const SectionHeading(text: "Filter Reports"),
                SizedBox(height: 10.sp),
                const Row(
                  children: [
                    DatePickerButton(text: 'Start Date'),
                    Spacer(),
                    DatePickerButton(text: 'End Date'),
                  ],
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: MediaQuery.sizeOf(context).width,
                  child: Text(
                    "Click to View Monthly Report",
                    style: AppFonts.normalLightTextGreen(context),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 15.sp),
                SizedBox(
                  height: 90.sp,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MonthlyReportScreen()),
                        ),
                        child: MonthlyReportContainer(
                          gradientColors: [
                            const Color(0xff898989).withOpacity(0.2),
                            const Color(0xff343434).withOpacity(0.15),
                            const Color(0xff343434).withOpacity(0),
                          ],
                          month: '2024 | May',
                          height: 90.sp,
                        ),
                      ),
                      MonthlyReportContainer(
                        gradientColors: [
                          const Color(0xff898989).withOpacity(0.25),
                          const Color(0xff343434).withOpacity(0.15),
                          const Color(0xff343434).withOpacity(0),
                        ],
                        month: '2024 | June',
                        height: 84.sp,
                      ),
                      MonthlyReportContainer(
                        gradientColors: [
                          const Color(0xff898989).withOpacity(0.3),
                          const Color(0xff343434).withOpacity(0.2),
                          const Color(0xff343434).withOpacity(0.3),
                        ],
                        month: '2024 | July',
                        height: 77.5.sp,
                      ),
                      MonthlyReportContainer(
                        gradientColors: [
                          const Color(0xff898989).withOpacity(0.35),
                          const Color(0xff343434).withOpacity(0.2),
                          const Color(0xff343434).withOpacity(0.3),
                        ],
                        month: '2024 | August',
                        height: 70.5.sp,
                      ),
                      MonthlyReportContainer(
                        gradientColors: [
                          const Color(0xff898989).withOpacity(0.45),
                          const Color(0xff343434).withOpacity(0.4),
                          const Color(0xff343434).withOpacity(0.4),
                        ],
                        month: '2024 | September',
                        height: 62.5.sp,
                      ),
                      MonthlyReportContainer(
                        gradientColors: [
                          const Color(0xff898989).withOpacity(0.6),
                          const Color.fromARGB(255, 121, 120, 120)
                              .withOpacity(0.4),
                          const Color.fromARGB(255, 82, 82, 82)
                              .withOpacity(0.4),
                        ],
                        month: '2024 | October',
                        height: 53.5.sp,
                      ),
                      MonthlyReportContainer(
                        gradientColors: [
                          const Color(0xff898989).withOpacity(0.7),
                          const Color.fromARGB(255, 106, 106, 106)
                              .withOpacity(0.7),
                          const Color(0xff343434).withOpacity(0.7),
                        ],
                        month: '2024 | November',
                        height: 42.5.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
