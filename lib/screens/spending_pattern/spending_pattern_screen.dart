import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/widgets/appbar_profile.dart';
import 'package:riskore/widgets/nav_bar.dart';

class SpendingPatternScreen extends StatelessWidget {
  const SpendingPatternScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarProfile(press: () {}),
        backgroundColor: AppColor.black,
        bottomNavigationBar: const NavBar(),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: AppStyles.edgeInsetsLR_20,
        ))));
  }
}
