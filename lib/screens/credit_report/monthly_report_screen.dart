import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/widgets/appbar_arrow.dart';
import 'package:riskore/widgets/expense_row.dart';
import 'package:riskore/widgets/fill_button.dart';
import 'package:riskore/widgets/screen_title.dart';
import 'package:riskore/widgets/tab_bar_dark.dart';
import 'package:sizer/sizer.dart';
import 'package:pie_chart/pie_chart.dart';

class MonthlyReportScreen extends StatefulWidget {
  const MonthlyReportScreen({super.key});

  @override
  State<MonthlyReportScreen> createState() => _MonthlyReportScreenState();
}

class _MonthlyReportScreenState extends State<MonthlyReportScreen> {
  String selectedTab = "Bank";
  bool isSelected = false;

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
                        const ScreenTitle(text: "May 2024"),
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
                                              "RM2,000.00",
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
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: ExpenseRow(
                                            image:
                                                "lib/assets/images/mae_app.png",
                                            name: "MAE by Maybank2U",
                                            amount: "RM900.00",
                                            press: () {},
                                          ),
                                        ),
                                        SizedBox(height: 20.sp),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: ExpenseRow(
                                            image:
                                                "lib/assets/images/Octo_bank_app.png",
                                            name: "CIMB Octo App",
                                            amount: "RM760.00",
                                            press: () {},
                                          ),
                                        ),
                                        SizedBox(height: 20.sp),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: ExpenseRow(
                                            image:
                                                "lib/assets/images/hlbconnect_app.png",
                                            name: "HLB Connect",
                                            amount: "RM340.00",
                                            press: () {},
                                          ),
                                        ),
                                        SizedBox(height: 20.sp),
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
                                              "RM880.00",
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
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: ExpenseRow(
                                            image:
                                                "lib/assets/images/grabpay.png",
                                            name: "GrabPay",
                                            amount: "400.05",
                                            press: () {},
                                          ),
                                        ),
                                        SizedBox(height: 20.sp),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: ExpenseRow(
                                            image:
                                                "lib/assets/images/TNG_ewallet.png",
                                            name: "Touch 'N Go E-wallet",
                                            amount: "337.82",
                                            press: () {},
                                          ),
                                        ),
                                        SizedBox(height: 20.sp),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: ExpenseRow(
                                            image:
                                                "lib/assets/images/bigpay.png",
                                            name: "BigPay",
                                            amount: "151.13",
                                            press: () {},
                                          ),
                                        ),
                                        SizedBox(height: 20.sp),
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
                                              "RM6894.95",
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
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: SizedBox(
                                            height: 28.sp,
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
                                                      "02.11.2024",
                                                      style: AppFonts
                                                          .smallRegularText(
                                                        context,
                                                      ),
                                                    ),
                                                    Text(
                                                      "RM368.00",
                                                      style: AppFonts
                                                          .smallLightTextGreen(
                                                        context,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
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
                                        ),
                                        SizedBox(height: 20.sp),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: SizedBox(
                                            height: 28.sp,
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
                                                      "02.11.2024",
                                                      style: AppFonts
                                                          .smallRegularText(
                                                        context,
                                                      ),
                                                    ),
                                                    Text(
                                                      "RM368.00",
                                                      style: AppFonts
                                                          .smallLightTextGreen(
                                                        context,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
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
                                        ),
                                        SizedBox(height: 20.sp),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: SizedBox(
                                            height: 28.sp,
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
                                                      "02.11.2024",
                                                      style: AppFonts
                                                          .smallRegularText(
                                                        context,
                                                      ),
                                                    ),
                                                    Text(
                                                      "RM368.00",
                                                      style: AppFonts
                                                          .smallLightTextGreen(
                                                        context,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
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
                                        ),
                                        SizedBox(height: 20.sp),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 50, top: 30),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FillButton(
                      text: "Download in PDF",
                      press: () {},
                      width: MediaQuery.sizeOf(context).width,
                      height: 45,
                    ),
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
