import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';

class TabBarLight extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTabSelected; // Callback for handling selection
  const TabBarLight(
      {super.key, required this.selectedIndex, required this.onTabSelected});

  @override
  State<TabBarLight> createState() => _TabBarLightState();
}

class _TabBarLightState extends State<TabBarLight> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white.withOpacity(0.125),
        borderRadius: AppStyles.borderRadiusFullyRounded,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTabItem(
            text: 'Bank Accounts',
            index: 0,
          ),
          buildTabItem(
            text: 'E-wallets',
            index: 1,
          ),
          buildTabItem(
            text: 'Repayment status',
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget buildTabItem({required String text, required int index}) {
    final isSelected = widget.selectedIndex == index; // Check if selected
    return InkWell(
      // Wrap with InkWell for click handling
      onTap: () {
        setState(() {
          widget.onTabSelected(index); // Update selected index
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.green : Colors.transparent,
          borderRadius: AppStyles.borderRadiusFullyRounded,
        ),
        child: Text(
          text,
          style: isSelected
              ? AppFonts.smallRegularTextBlack(context)
              : AppFonts.smallLightText(context),
        ),
      ),
    );
  }
}
