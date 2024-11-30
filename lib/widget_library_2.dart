import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/widgets/appbar_arrow.dart';
import 'package:riskore/widgets/appbar_profile.dart';
import 'package:riskore/widgets/datepicker.dart';
import 'package:riskore/widgets/linear_progress.dart';
import 'package:riskore/widgets/nav_bar.dart';
import 'package:riskore/widgets/navigation_drawer.dart';
import 'package:riskore/widgets/screen_title.dart';
import 'package:riskore/widgets/section_heading.dart';
import 'package:riskore/widgets/shortcut_menu_button.dart';
import 'package:riskore/widgets/slider.dart';
import 'package:riskore/widgets/standard_container.dart';
import 'package:riskore/widgets/tab_bar_dark.dart';
import 'package:riskore/widgets/tab_bar_light.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WidgetLibrary2 extends StatefulWidget {
  const WidgetLibrary2({super.key});

  @override
  State<WidgetLibrary2> createState() => _WidgetLibrary2State();
}

class _WidgetLibrary2State extends State<WidgetLibrary2> {
  int _selectedTabIndex1 = 0;
  int _selectedTabIndex2 = 0;
  double _sliderValue = 0.5;
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ScreenTitle(text: "Widget Library 2"),
                const SectionHeading(text: "Shortcut Menu Buttons"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShortcutMenuButton(
                      text: "Your Loan",
                      image: 'lib/assets/icons/your_loan.png',
                      press: () {},
                    ),
                    ShortcutMenuButton(
                      text: "Your Loan",
                      image: 'lib/assets/icons/your_loan.png',
                      press: () {},
                    ),
                    ShortcutMenuButton(
                      text: "Your Loan",
                      image: 'lib/assets/icons/your_loan.png',
                      press: () {},
                    ),
                    ShortcutMenuButton(
                      text: "Your Loan",
                      image: 'lib/assets/icons/your_loan.png',
                      press: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const SectionHeading(text: "Date Picker"),
                const Row(
                  children: [
                    DatePickerButton(text: 'Start Date'),
                    Spacer(),
                    DatePickerButton(text: 'End Date'),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const SectionHeading(text: "Tab Bar"),
                // TabBarLight(
                //   selectedIndex: _selectedTabIndex1,
                //   onTabSelected: (int index) {
                //     setState(() {
                //       _selectedTabIndex1 = index;
                //     });
                //   },
                // ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 50,
                ),
                const SectionHeading(text: "Navigation Drawer"),
                NavDrawer(),
                const SizedBox(
                  height: 50,
                ),
                const SectionHeading(text: "Progress Indicator"),
                LinearProgressBar(progress: 0.62),
                const SizedBox(
                  height: 50,
                ),
                const SectionHeading(text: "Selector (Slider)"),
                CustomSlider(
                  value: _sliderValue,
                  onChanged: (newValue) {
                    setState(() {
                      _sliderValue = newValue;
                    });
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
