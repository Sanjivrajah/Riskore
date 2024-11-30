import 'package:flutter/material.dart';
import 'package:riskore/core/data/bank_offers_data.dart';
import 'package:riskore/core/models/bank_offers_model.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/widgets/appbar_arrow.dart';
import 'package:riskore/widgets/expense_row.dart';
import 'package:riskore/widgets/linear_progress.dart';
import 'package:riskore/widgets/loan_offer_row.dart';
import 'package:riskore/widgets/screen_title.dart';
import 'package:riskore/widgets/section_heading.dart';
import 'package:riskore/widgets/standard_container.dart';
import 'package:riskore/widgets/tab_bar_dark.dart';
import 'package:riskore/widgets/tab_bar_light.dart';
import 'package:sizer/sizer.dart';

class YourLoanScreen extends StatefulWidget {
  const YourLoanScreen(
      {super.key, required this.bankOffersList, required this.index});
  final List<BankOffers> bankOffersList;
  final int index;

  @override
  State<YourLoanScreen> createState() => _YourLoanScreenState();
}

class _YourLoanScreenState extends State<YourLoanScreen> {
  String selectedTab = "SME Loan";
  bool isSelected = false;
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ScreenTitle(text: "Your Loan"),
                StandardContainer(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ongoing Loan",
                        style: AppFonts.normalLightTextGreen(context),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Text(
                        "RM52,000.00",
                        style: AppFonts.largeExtraLightText(context),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Text(
                        "Preferred Tenure: 5 years",
                        style: AppFonts.smallLightText(context),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      const LinearProgressBar(progress: 0.62),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                const SectionHeading(text: "Loan Offers For You"),
                TabBarLight(
                  onTabSelected: (tab) {
                    setState(() {
                      selectedTab = tab; // Update selected tab
                    });
                  },
                ),
                Column(
                  children: [
                    if (selectedTab == "SME Loan") ...[
                      SizedBox(
                        height: 15.sp,
                      ),
                      StandardContainer(
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: Text(
                                "SME Loan",
                                style: AppFonts.normalLightTextGreen(context),
                              ),
                            ),
                            SizedBox(
                              height: 15.sp,
                            ),
                            Column(
                              children: [
                                for (var offer in bankOffersList.where(
                                    (offer) => offer.category == "SME Loan"))
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            LoanOfferRow(
                                              image: offer.image,
                                              bankName: offer.name,
                                              interest: offer.interest,
                                              period: offer.period,
                                              press: () {},
                                              amount: offer.amount,
                                              visible: true,
                                            ),
                                            SizedBox(
                                              height: 15.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 15.sp,
                            ),
                          ],
                        ),
                      ),
                    ] else if (selectedTab == "House Loan") ...[
                      SizedBox(
                        height: 15.sp,
                      ),
                      StandardContainer(
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: Text(
                                "House Loan",
                                style: AppFonts.normalLightTextGreen(context),
                              ),
                            ),
                            SizedBox(
                              height: 15.sp,
                            ),
                            Column(
                              children: [
                                for (var offer in bankOffersList.where(
                                    (offer) => offer.category == "House Loan"))
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            LoanOfferRow(
                                              image: offer.image,
                                              bankName: offer.name,
                                              interest: offer.interest,
                                              period: offer.period,
                                              press: () {},
                                              amount: offer.amount,
                                              visible: true,
                                            ),
                                            SizedBox(
                                              height: 15.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 15.sp,
                            ),
                          ],
                        ),
                      ),
                    ] else if (selectedTab == "Car Loan") ...[
                      SizedBox(
                        height: 15.sp,
                      ),
                      StandardContainer(
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: Text(
                                "Car Loan",
                                style: AppFonts.normalLightTextGreen(context),
                              ),
                            ),
                            SizedBox(
                              height: 15.sp,
                            ),
                            Column(
                              children: [
                                for (var offer in bankOffersList.where(
                                    (offer) => offer.category == "Car Loan"))
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            LoanOfferRow(
                                              image: offer.image,
                                              bankName: offer.name,
                                              interest: offer.interest,
                                              period: offer.period,
                                              press: () {},
                                              amount: offer.amount,
                                              visible: true,
                                            ),
                                            SizedBox(
                                              height: 15.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 15.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
