import 'package:flutter/material.dart';
import 'package:riskore/core/data/upcoming_payment_data.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/screens/dashboard/presentation/dashboard_screen.dart';
import 'package:riskore/widgets/appbar_arrow.dart';
import 'package:riskore/widgets/fill_button.dart';
import 'package:sizer/sizer.dart';

class QuestionsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> questions;

  const QuestionsScreen({Key? key, required this.questions}) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  // to track whether it's the first question
  bool isFirstQuestion = true;
  int progress = 1;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> currentQuestion =
        widget.questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBarArrow(
        press: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 25.sp),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.55,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.55,
                          height: MediaQuery.of(context).size.width * 0.55,
                          child: CircularProgressIndicator(
                            strokeWidth: 7,
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.125),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColor.green,
                            ),
                            value: progress / 8,
                          ),
                        ),
                        Text(
                          currentQuestion['ProgressText'],
                          style: AppFonts.largeRegularText(context),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(20.sp),
                    child: Column(
                      children: [
                        Text(
                          "Question " + currentQuestion['QuestionNo'],
                          style: AppFonts.normalLightTextGreen(context),
                        ),
                        SizedBox(height: 15.sp),
                        SizedBox(
                          height: 40.sp,
                          child: Text(
                            currentQuestion['Question'],
                            style: AppFonts.normalLightText(context),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Column(
                          children: [
                            if (currentQuestion['button1'] != null)
                              FillButton(
                                text: Text(currentQuestion['button1']).data!,
                                press: () {
                                  _handleButtonPress(
                                      currentQuestion['button1']);
                                },
                                width: MediaQuery.sizeOf(context).width,
                                height: 45,
                              ),
                            const SizedBox(height: 30),
                            if (currentQuestion['button2'] != null)
                              FillButton(
                                text: Text(currentQuestion['button2']).data!,
                                press: () {
                                  _handleButtonPress(
                                      currentQuestion['button2']);
                                },
                                width: MediaQuery.sizeOf(context).width,
                                height: 45,
                              ),
                            const SizedBox(height: 30),
                            if (currentQuestion['button3'] != null)
                              FillButton(
                                text: Text(currentQuestion['button3']).data!,
                                press: () {
                                  _handleButtonPress(
                                      currentQuestion['button3']);
                                },
                                width: MediaQuery.sizeOf(context).width,
                                height: 45,
                              ),
                            const SizedBox(height: 30),
                            if (currentQuestion['button4'] != null)
                              FillButton(
                                text: Text(currentQuestion['button4']).data!,
                                press: () {
                                  _handleButtonPress(
                                      currentQuestion['button4']);
                                },
                                width: MediaQuery.sizeOf(context).width,
                                height: 45,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleButtonPress(String buttonText) {
    setState(() {
      isFirstQuestion = false;
      if (currentQuestionIndex < widget.questions.length - 1) {
        currentQuestionIndex++;
        progress++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => DashboardScreen(
                    upcomingPaymentList: upcomingPaymentList,
                    index: 0,
                  )),
        );
      }
    });
  }
}
