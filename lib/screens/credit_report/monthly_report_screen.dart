import 'package:flutter/material.dart';
import 'package:riskore/core/models/expenses_model.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/screens/report_screen.dart';
import 'package:riskore/widgets/appbar_arrow.dart';
import 'package:riskore/widgets/expense_row.dart';
import 'package:riskore/widgets/fill_button.dart';
import 'package:riskore/widgets/screen_title.dart';
import 'package:riskore/widgets/tab_bar_dark.dart';
import 'package:sizer/sizer.dart';
import 'package:pie_chart/pie_chart.dart';

class MonthlyReportScreen extends StatefulWidget {
  final List<Expenses> expensesList;
  final int index;
  final String monthYear;

  const MonthlyReportScreen({
    super.key,
    required this.expensesList,
    required this.index,
    required this.monthYear,
  });

  @override
  State<MonthlyReportScreen> createState() => _MonthlyReportScreenState();
}

class _MonthlyReportScreenState extends State<MonthlyReportScreen> {
  String selectedTab = "Bank";

  Map<String, double> dataMapBank = {
    "MAE by Maybank2U": 45,
    "CIMB Octo App": 36.5,
    "HLB Connect": 17,
  };

  final colorListBank = <Color>[
    AppColor.maybankColor,
    AppColor.cimbBankColor,
    AppColor.hlBankColor,
  ];

  Map<String, double> dataMapEwallet = {
    "Touch ‘N Go": 36.5,
    "GrabPay": 45,
    "BigPay": 17,
  };

  final colorListEwallet = <Color>[
    AppColor.tnGoColor,
    AppColor.grabPayColor,
    AppColor.bigPayColor,
  ];

  @override
  Widget build(BuildContext context) {
    double bankTotalAmount = widget.expensesList
        .where((offer) => offer.category == "Bank")
        .fold(0.0, (sum, offer) => sum + double.parse(offer.amount));

    double ewalletTotalAmount = widget.expensesList
        .where((offer) => offer.category == "E-wallet")
        .fold(0.0, (sum, offer) => sum + double.parse(offer.amount));
    // Calculate totals for each category
    double loanAmount = double.parse(widget.expensesList
            .where((offer) => offer.category == "Repayment")
            .first
            .loanAmount! // Get the loanAmount from the first "Repayment" category
        );

    double repaymentAmount = widget.expensesList
        .where((offer) => offer.category == "Repayment")
        .fold(
            0.0,
            (sum, offer) =>
                sum + double.parse(offer.amount)); // Sum all repayment amounts

    double remainingAmount =
        loanAmount - repaymentAmount; // Calculate remaining amount

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
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ScreenTitle(text: widget.monthYear),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          constraints: BoxConstraints(minHeight: 95.sp),
                          decoration: BoxDecoration(
                            gradient: containerGradient(),
                            borderRadius: AppStyles.borderRadiusAllSides30,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Padding(
                                padding: AppStyles.edgeInsets10_20,
                                child: TabBarDark(
                                  onTabSelected: (tab) {
                                    setState(() {
                                      selectedTab = tab; // Update selected tab
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 20.sp),
                              Column(
                                children: [
                                  if (selectedTab == "Bank") ...[
                                    PieChart(
                                      legendOptions: const LegendOptions(
                                          showLegends: false),
                                      dataMap: dataMapBank,
                                      animationDuration:
                                          const Duration(milliseconds: 800),
                                      chartLegendSpacing: 32,
                                      chartValuesOptions:
                                          const ChartValuesOptions(
                                              showChartValues: false),
                                      chartRadius:
                                          MediaQuery.of(context).size.width /
                                              1.8,
                                      colorList: colorListBank,
                                      initialAngleInDegree: 0,
                                      chartType: ChartType.ring,
                                      ringStrokeWidth: 8,
                                      centerWidget: SizedBox(
                                        height: 35.sp,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Total Amount",
                                              style: AppFonts.smallLightText(
                                                  context),
                                            ),
                                            Text(
                                              "RM${bankTotalAmount.toStringAsFixed(2)}", // Use calculated sum
                                              style: AppFonts.largeRegularText(
                                                  context),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 18.sp),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        "Expenses Summary",
                                        style:
                                            AppFonts.normalLightText(context),
                                      ),
                                    ),
                                    SizedBox(height: 18.sp),
                                    Column(
                                      children: [
                                        for (var offer in widget.expensesList
                                            .where((offer) =>
                                                offer.category == "Bank"))
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 20.sp,
                                              bottom: 20.sp,
                                            ),
                                            child: ExpenseRow(
                                              image: offer.image!,
                                              name: offer.name!,
                                              amount: offer.amount,
                                              press: () {},
                                            ),
                                          ),
                                        SizedBox(height: 10.sp),
                                      ],
                                    ),
                                  ] else if (selectedTab == "E-wallet") ...[
                                    PieChart(
                                      legendOptions: const LegendOptions(
                                          showLegends: false),
                                      dataMap: dataMapEwallet,
                                      animationDuration:
                                          const Duration(milliseconds: 800),
                                      chartLegendSpacing: 32,
                                      chartValuesOptions:
                                          const ChartValuesOptions(
                                              showChartValues: false),
                                      chartRadius:
                                          MediaQuery.of(context).size.width /
                                              1.8,
                                      colorList: colorListEwallet,
                                      initialAngleInDegree: 0,
                                      chartType: ChartType.ring,
                                      ringStrokeWidth: 8,
                                      centerWidget: SizedBox(
                                        height: 35.sp,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Total Amount",
                                              style: AppFonts.smallLightText(
                                                  context),
                                            ),
                                            Text(
                                              "RM${ewalletTotalAmount.toStringAsFixed(2)}", // Use calculated sum
                                              style: AppFonts.largeRegularText(
                                                  context),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 18.sp),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        "Expenses Summary",
                                        style:
                                            AppFonts.normalLightText(context),
                                      ),
                                    ),
                                    SizedBox(height: 18.sp),
                                    Column(
                                      children: [
                                        for (var offer in widget.expensesList
                                            .where((offer) =>
                                                offer.category == "E-wallet"))
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 20.sp,
                                              bottom: 20.sp,
                                            ),
                                            child: ExpenseRow(
                                              image: offer.image!,
                                              name: offer.name!,
                                              amount: offer.amount,
                                              press: () {},
                                            ),
                                          ),
                                        SizedBox(height: 10.sp),
                                      ],
                                    ),
                                  ] else if (selectedTab == "Repayment") ...[
                                    SizedBox(
                                      height: 5.sp,
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.56,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.56,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 7,
                                            backgroundColor:
                                                const Color.fromARGB(
                                                        255, 255, 255, 255)
                                                    .withOpacity(0.125),
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              AppColor.green,
                                            ),
                                            value: 3 / 18,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Amount Left",
                                              style: AppFonts.smallLightText(
                                                  context),
                                            ),
                                            Text(
                                              "RM" +
                                                  "${remainingAmount.toStringAsFixed(2)}", // Show the amount with 2 decimal places

                                              style: AppFonts.largeRegularText(
                                                  context),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 23.sp),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        "Expenses Summary",
                                        style:
                                            AppFonts.normalLightText(context),
                                      ),
                                    ),
                                    SizedBox(height: 18.sp),
                                    Column(
                                      children: [
                                        for (var offer in widget.expensesList
                                            .where((offer) =>
                                                offer.category == "Repayment"))
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 20.sp,
                                              bottom: 20.sp,
                                            ),
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      offer.date!,
                                                      style: AppFonts
                                                          .smallRegularText(
                                                              context),
                                                    ),
                                                    Text(
                                                      "RM " + offer.amount,
                                                      style: AppFonts
                                                          .smallLightTextGreen(
                                                              context),
                                                    ),
                                                    SizedBox(height: 10.sp),
                                                  ],
                                                ),
                                                Spacer(),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    size: 15,
                                                    Icons
                                                        .arrow_forward_ios_outlined,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        SizedBox(height: 20.sp),
                                      ],
                                    ),
                                  ]
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: AppStyles.edgeInsetsLR_20,
                  child: FillButton(
                    width: MediaQuery.sizeOf(context).width,
                    height: 45,
                    text: "Generate Report",
                    press: () {
                      // Navigate to report screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReportScreen(
                            bankTotalAmount: bankTotalAmountInt,
                            ewalletTotalAmount: ewalletTotalAmountInt,
                            loanAmount: loanAmount.toInt(),
                            repaymentAmount: repaymentAmount.toInt(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
