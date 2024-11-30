import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/screens/profile/linked_account_screen.dart';
import 'package:sizer/sizer.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: AppStyles.edgeInsetsAll_10,
          decoration: BoxDecoration(
            gradient: containerGradient(),
            borderRadius: AppStyles.borderRadiusAllSides16,
          ),
          child: Column(
            children: [
              SizedBox(height: 10.sp),
              const NavDrawerRow(
                text: 'My Details',
                image: "lib/assets/icons/my_details.png",
              ),
              SizedBox(height: 18.sp),
              const NavDrawerRow(
                text: 'Change Password',
                image: "lib/assets/icons/change_password.png",
              ),
              SizedBox(height: 18.sp),
              const NavDrawerRow(
                text: 'Address Book',
                image: "lib/assets/icons/address_book.png",
              ),
              SizedBox(height: 18.sp),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(LinkedAccountScreen.routeName),
                child: const NavDrawerRow(
                  text: 'Linked Accounts',
                  image: "lib/assets/icons/linked_acc.png",
                ),
              ),
              SizedBox(height: 18.sp),
              const NavDrawerRow(
                text: 'Notifications',
                image: "lib/assets/icons/notifications.png",
              ),
              SizedBox(height: 10.sp),
            ],
          ),
        ),
        SizedBox(height: 18.sp),
        Container(
          padding: AppStyles.edgeInsetsAll_10,
          decoration: BoxDecoration(
            gradient: containerGradient(),
            borderRadius: AppStyles.borderRadiusAllSides16,
          ),
          child: Column(
            children: [
              SizedBox(height: 10.sp),
              const NavDrawerRow(
                text: 'Uploaded Documents',
                image: "lib/assets/icons/question_mark.png",
              ),
              SizedBox(height: 18.sp),
              const NavDrawerRow(
                text: 'Credit Reports',
                image: "lib/assets/icons/question_mark.png",
              ),
              SizedBox(height: 18.sp),
              const NavDrawerRow(
                text: 'Past Loan Applications',
                image: "lib/assets/icons/question_mark.png",
              ),
              SizedBox(height: 10.sp),
            ],
          ),
        ),
      ],
    );
  }
}

class NavDrawerRow extends StatelessWidget {
  const NavDrawerRow({
    super.key,
    required this.text,
    required this.image,
  });

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20.sp,
          height: 20.sp,
          child: Image.asset(image),
        ),
        SizedBox(width: 15.sp),
        Text(
          text,
          style: AppFonts.smallLightText(context),
        ),
        const Spacer(),
        SizedBox(
          width: 15.sp,
          height: 15.sp,
          child: Image.asset("lib/assets/icons/arrowright.png"),
        ),
      ],
    );
  }
}
