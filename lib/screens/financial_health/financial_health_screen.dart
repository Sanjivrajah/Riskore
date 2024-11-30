import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/screens/credit_report/all_reports_screen.dart';
import 'package:riskore/screens/spending_pattern/spending_pattern_screen.dart';
import 'package:riskore/widgets/appbar_profile.dart';
import 'package:riskore/widgets/border_button.dart';
import 'package:riskore/widgets/screen_title.dart';
import 'package:riskore/widgets/section_heading.dart';
import 'package:riskore/widgets/semicircle_progress.dart';
import 'package:riskore/widgets/shortcut_menu_button.dart';
import 'package:riskore/widgets/standard_container.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class FinancialHealthScreen extends StatefulWidget {
  const FinancialHealthScreen({super.key});

  @override
  State<FinancialHealthScreen> createState() => _FinancialHealthScreenState();
}

class _FinancialHealthScreenState extends State<FinancialHealthScreen> {
  late List<_ChartData> data;
  late List<_ChartData> data2;
  late TooltipBehavior _tooltip;

  final double debt = 2500;
  final double income = 3500;

  @override
  void initState() {
    super.initState();
    data = [
      _ChartData('Jul', 73),
      _ChartData('Aug', 65),
      _ChartData('Sep', 52),
      _ChartData('Oct', 60),
      _ChartData('Nov', 65),
    ];
    data2 = [
      _ChartData('Debt', debt),
      _ChartData('Income', income),
    ];
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarProfile(press: () {}),
      backgroundColor: AppColor.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppStyles.edgeInsetsLR_20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ScreenTitle(text: "Your Financial Health"),
                SizedBox(height: 15.sp),
                StandardContainer(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    children: [
                      Text(
                        "Previous 5 Months Credit Scores",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColor.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15.sp),
                      SfCartesianChart(
                        plotAreaBorderWidth: 0.3,
                        plotAreaBackgroundColor:
                            AppColor.maybankColor.withOpacity(0.2),
                        primaryXAxis: CategoryAxis(
                          labelStyle: AppFonts.smallLightText(context),
                        ),
                        primaryYAxis: NumericAxis(
                          labelStyle: AppFonts.smallLightText(context),
                          minimum: 0,
                          maximum: 100,
                          interval: 10,
                        ),
                        tooltipBehavior: _tooltip,
                        series: <CartesianSeries<_ChartData, String>>[
                          ColumnSeries<_ChartData, String>(
                            dataSource: data,
                            xValueMapper: (_ChartData data, _) => data.x,
                            yValueMapper: (_ChartData data, _) => data.y,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.sp),
                    ],
                  ),
                ),
                SizedBox(height: 18.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSparklineContainer(
                      context,
                      "Income (k)",
                      AppColor.green,
                      valueList: [3.5, 3.5, 3.5, 3.5, 3.5],
                    ),
                    _buildSparklineContainer(
                      context,
                      "Expenses (k)",
                      AppColor.red,
                      valueList: [1.2, 0.9, 1.3, 2.1, 1.3],
                    ),
                  ],
                ),
                SizedBox(height: 18.sp),
                StandardContainer(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    children: [
                      Text(
                        "Debt-to-Income Ratio",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColor.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 32.sp,
                            child: Text(
                              "${((debt / income) * 100).toStringAsFixed(2)}%",
                              style: AppFonts.normalLightText(context),
                            ),
                          ),
                          SfCircularChart(
                              palette: [AppColor.red, AppColor.green],
                              margin: EdgeInsets.zero,
                              legend: Legend(
                                  isVisible: true,
                                  position: LegendPosition.bottom,
                                  textStyle: AppFonts.smallLightText(context)),
                              tooltipBehavior: _tooltip,
                              series: <CircularSeries<_ChartData, String>>[
                                DoughnutSeries<_ChartData, String>(
                                    dataSource: data2,
                                    xValueMapper: (_ChartData data2, _) =>
                                        data2.x,
                                    yValueMapper: (_ChartData data2, _) =>
                                        data2.y,
                                    name: 'Gold')
                              ]),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.sp),
                const SectionHeading(text: "What can you do to improve?"),
                SizedBox(height: 10.sp),
                BorderButton(
                  text: 'Learn your spending pattern',
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SpendingPatternScreen(),
                      ),
                    );
                  },
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).width * 0.125,
                  borderColor: AppColor.green,
                ),
                SizedBox(height: 17.sp),
                BorderButton(
                  text: 'Current Debt Obligations',
                  press: () {},
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).width * 0.125,
                  borderColor: AppColor.red,
                ),
                SizedBox(height: 25.sp),
                const SectionHeading(text: "Savings Optimization for you"),
                SizedBox(height: 10.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildShortcutMenuButton(
                      "Emergency Fund Building",
                      'lib/assets/icons/your_loan.png',
                      () {},
                    ),
                    _buildShortcutMenuButton(
                      "Manage Your Assets",
                      'lib/assets/icons/manage_your_assets.png',
                      () {},
                    ),
                    _buildShortcutMenuButton(
                      "Investment Basics",
                      'lib/assets/icons/investment_basics.png',
                      () {},
                    ),
                  ],
                ),
                SizedBox(height: 25.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSparklineContainer(
      BuildContext context, String title, Color color,
      {required List<double> valueList}) {
    return StandardContainer(
      width: (MediaQuery.sizeOf(context).width / 2) - 25,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 16.sp,
              fontWeight: FontWeight.w300,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.sp),
          SfSparkLineChart(
            width: 1,
            axisLineWidth: 1,
            axisLineColor: AppColor.white,
            color: color,
            trackball: const SparkChartTrackball(
                activationMode: SparkChartActivationMode.tap),
            marker: SparkChartMarker(
              color: AppColor.white,
              borderColor: AppColor.white,
              borderWidth: 1,
              size: 2,
              displayMode: SparkChartMarkerDisplayMode.all,
            ),
            labelDisplayMode: SparkChartLabelDisplayMode.all,
            labelStyle: AppFonts.extraSmallLightText(context),
            data: valueList,
          ),
          SizedBox(height: 15.sp),
        ],
      ),
    );
  }

  Widget _buildShortcutMenuButton(
      String text, String image, VoidCallback press) {
    return SizedBox(
      width: 40.sp,
      child: ShortcutMenuButton(
        text: text,
        image: image,
        press: press,
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
