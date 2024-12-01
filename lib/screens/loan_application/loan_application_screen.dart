import 'package:flutter/material.dart';
import 'package:riskore/core/models/bank_offers_model.dart';
import 'package:riskore/core/navigation/navigation.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/widgets/appbar_arrow.dart';
import 'package:riskore/widgets/checkbox.dart';
import 'package:riskore/widgets/dropdown.dart';
import 'package:riskore/widgets/fill_button.dart';
import 'package:riskore/widgets/loan_offer_row.dart';
import 'package:riskore/widgets/number_circle.dart';
import 'package:riskore/widgets/screen_title.dart';
import 'package:riskore/widgets/standard_container.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class LoanApplicationScreen extends StatefulWidget {
  const LoanApplicationScreen({
    super.key,
    required this.image,
    required this.bankName,
    required this.interest,
    required this.period,
    required this.amount,
    required this.maxValue,
  });
  final String image;
  final String bankName;
  final String interest;
  final String period;
  final String amount;
  final String maxValue;

  @override
  State<LoanApplicationScreen> createState() => _LoanApplicationScreenState();
}

class _LoanApplicationScreenState extends State<LoanApplicationScreen> {
  double amount = 1.00;

  final double _minValue = 1000; // Desired minimum value
  late double _maxValue; // Initialize max value as double
  double _sliderValue = 0.0; // Initial normalized value (0.0 to 1.0)

  final List<String> dropdownItemsCategory = [
    'Personal Loan',
    'House Loan',
    'Car Loan',
    'SME Loan',
  ];

  final List<String> dropdownItemsPeriod = [
    '1-5 years',
    '6-10 years',
    '11-15 years',
    '16-20 years',
    '21-25 years',
    '26-30 years',
  ];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    _maxValue = _cleanAmount(widget.maxValue);
    _sliderValue = _getNormalizedValue(_minValue);
  }

  // Function to clean the amount string (removes non-numeric characters)
  double _cleanAmount(String amount) {
    String cleanedAmount = amount.replaceAll(RegExp(r'[^\d.]'),
        ''); // Remove all non-numeric characters except the decimal point
    return double.tryParse(cleanedAmount) ??
        0.0; // If parsing fails, return 0.0
  }

  // Function to convert normalized value to the actual value
  double _getActualValue(double normalizedValue) {
    return _minValue + (normalizedValue * (_maxValue - _minValue));
  }

  // Function to convert the actual value to a normalized value
  double _getNormalizedValue(double actualValue) {
    return (actualValue - _minValue) / (_maxValue - _minValue);
  }

  // Function to format the number
  String _formatNumber(double value) {
    final formatter = NumberFormat("#,###"); // Comma-separated formatting
    return formatter.format(value);
  }

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
        child: SingleChildScrollView(
          child: Padding(
            padding: AppStyles.edgeInsetsLR_20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ScreenTitle(text: "Loan Application"),
                SizedBox(height: 15.sp),
                StandardContainer(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    children: [
                      LoanOfferRow(
                        image: widget.image,
                        bankName: widget.bankName,
                        interest: widget.interest,
                        period: widget.period,
                        press: () {},
                        amount: widget.amount,
                        visible: false,
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.sp),
                Column(
                  children: [
                    SizedBox(
                      height: 50.sp,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                NumberCircle(
                                  number: '1',
                                  color: AppColor.white,
                                  textStyle:
                                      AppFonts.normalLightTextBlack(context),
                                ),
                                Container(
                                  height: 41.sp,
                                  width: 0.5,
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 18.sp),
                          Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Loan Amount",
                                  style: AppFonts.normalLightText(context),
                                ),
                                SizedBox(
                                  height: 15.sp,
                                ),
                                StandardContainer(
                                  width: 70.sp,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'RM ${_formatNumber(_getActualValue(_sliderValue))}',
                                        style:
                                            AppFonts.smallRegularText(context),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: Slider(
                                          divisions: 98,
                                          min:
                                              0.0, // Slider's normalized minimum value
                                          max:
                                              1.0, // Slider's normalized maximum value
                                          value: _sliderValue,
                                          onChanged: (newValue) {
                                            setState(() {
                                              _sliderValue = newValue;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.sp,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                NumberCircle(
                                  number: '2',
                                  color: AppColor.white.withOpacity(0.2),
                                  textStyle: AppFonts.normalLightText(context),
                                ),
                                Container(
                                  height: 41.sp,
                                  width: 0.5,
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 18.sp),
                          Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Loan Category",
                                  style: AppFonts.normalLightText(context),
                                ),
                                SizedBox(
                                  height: 15.sp,
                                ),
                                DropDownList(
                                  dropdownItems: dropdownItemsCategory,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.sp,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                NumberCircle(
                                  number: '3',
                                  color: AppColor.white.withOpacity(0.2),
                                  textStyle: AppFonts.normalLightText(context),
                                ),
                                Container(
                                  height: 41.sp,
                                  width: 0.5,
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 18.sp),
                          Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Loan Repayment Period",
                                  style: AppFonts.normalLightText(context),
                                ),
                                SizedBox(
                                  height: 15.sp,
                                ),
                                DropDownList(
                                  dropdownItems: dropdownItemsPeriod,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60.sp,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                NumberCircle(
                                  number: '4',
                                  color: AppColor.white.withOpacity(0.2),
                                  textStyle: AppFonts.normalLightText(context),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 18.sp),
                          Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Legal Disclosures",
                                  style: AppFonts.normalLightText(context),
                                ),
                                SizedBox(
                                  height: 15.sp,
                                ),
                                Row(
                                  children: [
                                    const CustomCheckBox(),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.6,
                                      child: Text(
                                        softWrap: true,
                                        "I authorize Riskore to obtain, verify, and review my credit information for the purpose of evaluating my loan application.",
                                        style: AppFonts.extraSmallLightText(
                                            context),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.sp,
                                ),
                                Row(
                                  children: [
                                    const CustomCheckBox(),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.6,
                                      child: Text(
                                        softWrap: true,
                                        "I consent to the collection, storage, and processing of my personal data by Riskore, in compliance with data protection laws (e.g., GDPR, PDPA)..",
                                        style: AppFonts.extraSmallLightText(
                                            context),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    FillButton(
                      text: "Submit",
                      press: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Submitted!"),
                              content:
                                  Text("You have submitted your application."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Navigation(),
                                      ),
                                    );
                                  },
                                  child: Text("Close"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      width: MediaQuery.sizeOf(context).width,
                      height: 45,
                    ),
                    SizedBox(
                      height: 25.sp,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
