import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';

class TabBarDark extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTabSelected; // Callback for handling selection

  const TabBarDark(
      {super.key, required this.selectedIndex, required this.onTabSelected});

  @override
  State<TabBarDark> createState() => _TabBarDarkState();
}

class _TabBarDarkState extends State<TabBarDark> {
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
          buildTabItem(
            text: 'Personal Loan',
            index: 0,
          ),
          buildTabItem(
            text: 'House Loan',
            index: 1,
          ),
          buildTabItem(
            text: 'Car Loan',
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget buildTabItem({required String text, required int index}) {
    final isSelected = widget.selectedIndex == index; // Check if selected
    return InkWell(
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
