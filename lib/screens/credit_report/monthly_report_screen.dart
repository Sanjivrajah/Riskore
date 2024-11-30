import 'package:flutter/material.dart';
import 'package:riskore/core/models/expenses_model.dart';
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
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

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

  // Function to generate reports
    Future<String> generateCreditReport() async {
    try {
      final PdfDocument document = PdfDocument();

      // Page 1
      PdfPage page = document.pages.add();
      PdfGraphics graphics = page.graphics;

      // Header for first page
      graphics.drawString(
        'RISKORE Credit Assessment Report',
        PdfStandardFont(PdfFontFamily.helvetica, 20, style: PdfFontStyle.bold),
        bounds: const Rect.fromLTWH(50, 20, 500, 40),
      );

      graphics.drawString(
        'Generated: ${DateTime.now().toString().split('.')[0]}',
        PdfStandardFont(PdfFontFamily.helvetica, 10),
        bounds: const Rect.fromLTWH(50, 45, 500, 20),
      );

      // First page sections
      addSection(
          page,
          'Bank Account Information',
          [
            {'Account Balance': 'RM 5,000'},
            {'Transaction History': '45 transactions'},
            {'Income Deposits': 'Monthly: RM 3,500'},
            {'Recurring Payments': '3 active'},
            {'Account Age': '2 years 3 months'},
            {'Average Monthly Balance': 'RM 4,200'},
            {'Overdraft Frequency': 'None'},
            {'Standing Instructions': '2 active'}
          ],
          80);

      addSection(
          page,
          'Digital Platform Activity',
          [
            {'Online Shopping': 'Active User'},
            {'Monthly Transactions': '25'},
            {'Subscription Services': '4 active'},
            {'Average Spend': 'RM 500/month'},
            {'Platform Usage': 'Multiple platforms'},
            {'Payment Methods': 'Cards, E-wallet'},
            {'Shopping Categories': 'Electronics, Fashion'},
            {'Transaction Success Rate': '98%'}
          ],
          300);

      addPageNumber(graphics, 1);

      // Page 2
      page = document.pages.add();
      graphics = page.graphics;

      addSection(
          page,
          'E-Wallet Usage Analysis',
          [
            {'Primary E-wallet': 'Touch n Go'},
            {'Secondary E-wallets': 'GrabPay, Boost'},
            {'Average Monthly Load': 'RM 800'},
            {'Transaction Frequency': 'Daily'},
            {'Common Merchants': 'Retail, F&B'},
            {'Peer Transfers': '15 monthly'},
            {'Bill Payments': 'RM 300 monthly'},
            {'Rewards Points': '2,500 points'}
          ],
          50);

      addSection(
          page,
          'BNPL (Buy Now Pay Later)',
          [
            {'Active BNPL Accounts': '2'},
            {'Total Credit Limit': 'RM 3,000'},
            {'Current Usage': 'RM 1,200'},
            {'Payment History': 'Excellent'},
            {'Missed Payments': 'None'},
            {'Average Purchase': 'RM 400'},
            {'Repayment Schedule': 'On track'},
            {'Credit Utilization': '40%'}
          ],
          300);

      addPageNumber(graphics, 2);

      // Page 3
      page = document.pages.add();
      graphics = page.graphics;

      addSection(
          page,
          'Credit Score Factors',
          [
            {'Payment History': '95/100'},
            {'Credit Utilization': '85/100'},
            {'Credit Mix': '75/100'},
            {'Account Age': '80/100'},
            {'Recent Inquiries': '90/100'},
            {'Overall Score': '85/100'},
            {'Score Trend': 'Improving'},
            {'Risk Category': 'Low Risk'}
          ],
          50);

      addSection(
          page,
          'Recommendations',
          [
            {'Credit Utilization': 'Maintain below 30%'},
            {'Payment Schedule': 'Set up auto-payments'},
            {'Credit Mix': 'Consider diversifying'},
            {'Savings': 'Increase emergency fund'},
            {'Credit Monitoring': 'Enable alerts'},
            {'Account Security': 'Enable 2FA'},
            {'Credit Report': 'Review quarterly'},
            {'Financial Planning': 'Consider consultation'}
          ],
          300);

      addPageNumber(graphics, 3);

      final Directory directory = await getApplicationDocumentsDirectory();
      final String path = '${directory.path}/credit_report.pdf';
      final File file = File(path);
      await file.writeAsBytes(await document.save());
      document.dispose();
      return path;
    } catch (e) {
      debugPrint('Error generating credit report: $e');
      throw Exception('Failed to generate the report.');
    }
  }

  // Helper function to add page numbers
  void addPageNumber(PdfGraphics graphics, int pageNumber) {
    graphics.drawString(
      'Page $pageNumber of 3',
      PdfStandardFont(PdfFontFamily.helvetica, 8),
      bounds: const Rect.fromLTWH(250, 780, 500, 20),
    );
  }

  // Modified addSection to accept PdfPage parameter
  void addSection(PdfPage page, String title, List<Map<String, String>> data,
      double yPosition) {
    final PdfGrid grid = PdfGrid();
    grid.columns.add(count: 2);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = title;
    header.cells[0].columnSpan = 2;

    header.cells[0].style.font =
        PdfStandardFont(PdfFontFamily.helvetica, 12, style: PdfFontStyle.bold);
    header.cells[0].style.backgroundBrush =
        PdfSolidBrush(PdfColor(240, 240, 240));

    for (var item in data) {
      item.forEach((key, value) {
        PdfGridRow row = grid.rows.add();
        row.cells[0].value = key;
        row.cells[1].value = value;
        row.cells[0].style.font = PdfStandardFont(PdfFontFamily.helvetica, 10);
        row.cells[1].style.font = PdfStandardFont(PdfFontFamily.helvetica, 10);
      });
    }

    grid.style.cellPadding = PdfPaddings(left: 5, right: 5, top: 8, bottom: 8);
    grid.columns[0].width = 200;
    grid.columns[1].width = 250;

    for (int i = 0; i < grid.rows.count; i++) {
      for (int j = 0; j < grid.columns.count; j++) {
        grid.rows[i].cells[j].style.borders.all =
            PdfPen(PdfColor(180, 180, 180));
      }
    }

    grid.draw(page: page, bounds: Rect.fromLTWH(50, yPosition, 450, 0));
  }

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
                    press: () async {
                      try {
              final path = await generateCreditReport();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(title: const Text('Credit Report Preview')),
                    body: SfPdfViewer.file(File(path)),
                  ),
                ),
              );
            } catch (e) {
              debugPrint('Error previewing report: $e');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to generate report.'),
                ),
              );
            }
                      
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
