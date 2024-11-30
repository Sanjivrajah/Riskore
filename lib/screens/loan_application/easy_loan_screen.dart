import 'package:flutter/material.dart';
import 'package:riskore/core/models/bank_offers_model.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/screens/loan_application/your_loan_screen.dart';
import 'package:riskore/widgets/appbar_profile.dart';
import 'package:riskore/widgets/loan_offer_row.dart';
import 'package:riskore/widgets/screen_title.dart';
import 'package:riskore/widgets/section_heading.dart';
import 'package:riskore/widgets/shortcut_menu_button.dart';
import 'package:riskore/widgets/standard_container.dart';
import 'package:sizer/sizer.dart';

class EasyLoanScreen extends StatelessWidget {
  const EasyLoanScreen({
    super.key,
    required this.bankOffersList,
    required this.index,
  });

  final List<BankOffers> bankOffersList;
  final int index;

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
                const ScreenTitle(text: "Easy Loan"),
                const SectionHeading(text: "Common Loans (Banks/Institutions)"),
                StandardContainer(
                  width: MediaQuery.sizeOf(context).width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 32.sp,
                              width: 32.sp,
                              child:
                                  Image.asset("lib/assets/images/maybank.png"),
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            Text(
                              "Maybank",
                              style: AppFonts.smallLightText(context),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 32.sp,
                              width: 32.sp,
                              child: Image.asset(
                                  "lib/assets/images/cimb_bank.png"),
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            Text(
                              "CIMB",
                              style: AppFonts.smallLightText(context),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 32.sp,
                              width: 32.sp,
                              child: Image.asset(
                                  "lib/assets/images/public_bank.png"),
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            Text(
                              "Public Bank",
                              style: AppFonts.smallLightText(context),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 32.sp,
                              width: 32.sp,
                              child: Image.asset(
                                  "lib/assets/images/ocbc_bank.png"),
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            Text(
                              "OCBC",
                              style: AppFonts.smallLightText(context),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.sp,
                ),
                const SectionHeading(text: "Quick Apply Loans"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShortcutMenuButton(
                      text: "Your Loan",
                      image: 'lib/assets/icons/your_loan.png',
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => YourLoanScreen(
                              bankOffersList: bankOffersList,
                              index: 0,
                            ),
                          ),
                        );
                      },
                    ),
                    ShortcutMenuButton(
                      text: "House Loan",
                      image: 'lib/assets/icons/house_loan.png',
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => YourLoanScreen(
                              bankOffersList: bankOffersList,
                              index: 0,
                            ),
                          ),
                        );
                      },
                    ),
                    ShortcutMenuButton(
                      text: "SME Loan",
                      image: 'lib/assets/icons/sme_loan.png',
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => YourLoanScreen(
                              bankOffersList: bankOffersList,
                              index: 0,
                            ),
                          ),
                        );
                      },
                    ),
                    ShortcutMenuButton(
                      text: "Car Loan",
                      image: 'lib/assets/icons/car_loan.png',
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => YourLoanScreen(
                              bankOffersList: bankOffersList,
                              index: 0,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.sp,
                ),
                const SectionHeading(text: "Based on Your AI Credit Score"),
                StandardContainer(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Text(
                          "All Offered Loans",
                          style: AppFonts.normalLightTextGreen(context),
                        ),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Column(
                        children: [
                          for (int i = 0; i < bankOffersList.length; i += 1)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      LoanOfferRow(
                                        image: bankOffersList[i].image,
                                        bankName: bankOffersList[i].name,
                                        interest: bankOffersList[i].interest,
                                        period: bankOffersList[i].period,
                                        press: () {},
                                        amount: bankOffersList[i].amount,
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
