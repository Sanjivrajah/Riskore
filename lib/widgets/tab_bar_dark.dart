import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';

class TabBarDark extends StatefulWidget {
  final Function(String) onTabSelected;

  const TabBarDark({super.key, required this.onTabSelected});

  @override
  State<TabBarDark> createState() => _TabBarDarkState();
}

class _TabBarDarkState extends State<TabBarDark> {
  String selectedTab = "Bank"; // Default selected tab

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.black.withOpacity(0.6),
        borderRadius: AppStyles.borderRadiusFullyRounded,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTabItem(tab: 'Bank'),
          buildTabItem(tab: 'E-wallet'),
          buildTabItem(tab: 'Repayment'),
        ],
      ),
    );
  }

  Widget buildTabItem({required String tab}) {
    bool isSelected = tab == selectedTab;
    return InkWell(
      onTap: () {
        setState(() {
          selectedTab = tab; // Update selected tab locally
        });
        widget.onTabSelected(tab); // Notify parent widget
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.green : Colors.transparent,
          borderRadius: AppStyles.borderRadiusFullyRounded,
        ),
        child: Text(
          tab,
          style: isSelected
              ? AppFonts.smallRegularTextBlack(context)
              : AppFonts.smallLightText(context),
        ),
      ),
    );
  }
}
