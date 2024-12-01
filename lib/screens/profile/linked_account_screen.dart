import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/widgets/appbar_arrow.dart';
import 'package:riskore/widgets/appbar_profile.dart';
import 'package:riskore/widgets/fill_button.dart';
import 'package:riskore/widgets/screen_title.dart';
import 'package:sizer/sizer.dart';
import 'package:riskore/widgets/accounts_container.dart';

class LinkedAccountScreen extends StatelessWidget {
  static const routeName = '/signup-screen';
  const LinkedAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarArrow(press: Navigator.of(context).pop),
      backgroundColor: AppColor.black,
      body: SafeArea(
        child: Padding(
          padding: AppStyles.edgeInsetsLR_20,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ScreenTitle(text: "My Account"),
                SizedBox(height: 30.sp),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    LinkedAccountContainer(
                      accounts: 'Shopee Pay',
                      name: 'Ahmad',
                      accountNumber: '012-5889654',
                      height: 80.sp, // Set the desired height
                      gradient: [
                        AppColor.shopeePayColor,
                        AppColor.shopeePayColor
                      ],
                      imagePath: 'lib/assets/images/grabpay.png',
                    ),
                    LinkedAccountContainer(
                      accounts: 'GrabPay',
                      name: 'Ahmad',
                      accountNumber: '012-5889654',
                      height: 72.sp, // Set the desired height
                      gradient: [AppColor.grabPayColor, AppColor.grabPayColor],
                      imagePath: 'lib/assets/images/grabpay.png',
                    ),
                    LinkedAccountContainer(
                      accounts: 'Touch \'n Go',
                      name: 'Ahmad',
                      accountNumber: '012-5889654',
                      height: 64.sp,
                      gradient: [
                        const Color(0xFF9EDAF8),
                        const Color(0xFFF4D1F2),
                      ],
                      imagePath: 'lib/assets/images/TNG_logo.png',
                    ),
                  ], // Set the desired color
                ),
                SizedBox(
                  height: 30.sp,
                ),
                FillButton(
                  text: "Connect to a new account",
                  press: () {},
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
