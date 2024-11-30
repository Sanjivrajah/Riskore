import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:sizer/sizer.dart';

class TabBarDashboard extends StatefulWidget {
  final Function(String) onTabSelected;

  const TabBarDashboard({super.key, required this.onTabSelected});

  @override
  State<TabBarDashboard> createState() => _TabBarDashboardState();
}

class _TabBarDashboardState extends State<TabBarDashboard> {
  String selectedTab = "Pay Later"; // Default selected tab

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white.withOpacity(0.2),
        borderRadius: AppStyles.borderRadiusFullyRounded,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTabItem(tab: 'Pay Later'),
          buildTabItem(tab: 'Subscription'),
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
        padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 8),
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
