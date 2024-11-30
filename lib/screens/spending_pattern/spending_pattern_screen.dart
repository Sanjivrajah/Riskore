import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/widgets/appbar_profile.dart';
import 'package:riskore/widgets/border_button.dart';
import 'package:riskore/widgets/nav_bar.dart';
import 'package:riskore/widgets/standard_container.dart';
import 'package:sizer/sizer.dart';
import 'package:riskore/services/openai_services.dart';

class SpendingPatternScreen extends StatefulWidget {
  const SpendingPatternScreen({super.key});

  @override
  State<SpendingPatternScreen> createState() => _SpendingPatternScreenState();
}

class _SpendingPatternScreenState extends State<SpendingPatternScreen> {
  String _aiResponse = "Click a button to see what happens...";
  bool _isLoading = false;

  Future<void> _getAIResponse(String prompt) async {
    setState(() {
      _isLoading = true;
    });

    final response = await OpenAIService.getResponse(prompt);

    setState(() {
      _aiResponse = response;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarProfile(press: () {}),
        backgroundColor: AppColor.black,
        //bottomNavigationBar: const NavBar(),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: AppStyles.edgeInsetsLR_20,
          child: Column(
            children: [
              Text(
                "See what happens when you...",
                style: AppFonts.largeExtraLightText(context),
              ),
              SizedBox(height: 20.sp),
              BorderButton(
                text: "Don't pay BNPL on time",
                press: () {
                  print("Button clicked");
                  _getAIResponse(
                      "What are the consequences of not paying Buy Now Pay Later (BNPL) loans on time?");
                },
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).width * 0.125,
                borderColor: AppColor.green,
              ),
              SizedBox(height: 20.sp),
              BorderButton(
                text: 'Spend too much on luxury items every month',
                press: () => _getAIResponse(
                    "What are the financial implications of overspending on luxury items monthly?"),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).width * 0.125,
                borderColor: AppColor.green,
              ),
              SizedBox(height: 20.sp),
              BorderButton(
                text: 'Save up 10% of your salary every month',
                press: () => _getAIResponse(
                    "What are the benefits of saving 10% of your monthly salary over time?"),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).width * 0.125,
                borderColor: AppColor.green,
              ),
              SizedBox(height: 25.sp),
              StandardContainer(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "AI Response:",
                      style: AppFonts.normalLightText(context),
                    ),
                    SizedBox(height: 10.sp),
                    if (_isLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.sp),
                        child: Text(
                          _aiResponse,
                          style: AppFonts.normalLightText(context),
                          textAlign: TextAlign.left,
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ))));
  }
}
