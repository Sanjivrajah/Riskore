import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riskore/core/providers/full_user_data_provider.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/widgets/appbar_arrow.dart';
import 'package:riskore/widgets/border_button.dart';
import 'package:riskore/widgets/standard_container.dart';
import 'package:sizer/sizer.dart';
import 'package:riskore/services/openai_services.dart';
import 'dart:convert';

class SpendingPatternScreen extends StatefulWidget {
  const SpendingPatternScreen({super.key});

  @override
  State<SpendingPatternScreen> createState() => _SpendingPatternScreenState();
}

class _SpendingPatternScreenState extends State<SpendingPatternScreen> {
  Map<String, String> _aiResponse = {
    'overview': 'Click a button to see what happens...',
    'analysis': '',
    'actionable_advice': '',
  };
  bool _isLoading = false;

  // Generate a personalized prompt for AI
  String _generatePrompt(String basePrompt) {
    var provider = Provider.of<UserDataProvider>(context, listen: false);
    var userData = provider.userData;

    String personalContext = '''
User Profile:
- Full Name: ${userData?.full_name}
- Age: ${userData?.age}
- Gender: ${userData?.gender}
- Employment Status: ${userData?.employment_status}
- Occupation: ${userData?.occupation} in the ${userData?.industry} industry
- Monthly Income: ${userData?.monthly_income}
- Credit Score: ${userData?.credit_score}

Financial Snapshot:
- Total Account Balance: ${userData?.total_account_balance}
- Monthly Inflow: ${userData?.total_monthly_inflow}
- Monthly Outflow: ${userData?.total_monthly_outflow}
- Monthly Plan Costs: ${userData?.monthly_plan_cost}
- Rent Amount: ${userData?.rent_amount} (${userData?.rent_status})
''';

    return '''
You are an AI financial advisor with expertise in personal finance and credit scoring. Your task is to provide detailed, personalized advice based on the following user's financial profile and query.

$personalContext

User Query:
$basePrompt

Instructions:
1. Analyze the query in the context of the user's financial situation.
2. Provide advice in JSON format as follows:
{
  "overview": "A summary of the issue and its importance.",
  "analysis": "A deeper explanation, considering the user's financial data.",
  "actionable_advice": "Clear, specific steps or recommendations."
}
''';
  }

  Future<void> _getAIResponse(String prompt) async {
    setState(() {
      _isLoading = true;
    });

    final response = await OpenAIService.getResponse(prompt);

    try {
      final parsedResponse = jsonDecode(response) as Map<String, dynamic>;
      setState(() {
        _aiResponse = {
          'overview': parsedResponse['overview'] ?? 'No overview provided.',
          'analysis': parsedResponse['analysis'] ?? 'No analysis provided.',
          'actionable_advice': parsedResponse['actionable_advice'] ??
              'No actionable advice provided.',
        };
      });
    } catch (e) {
      setState(() {
        _aiResponse = {
          'overview': 'Error parsing AI response.',
          'analysis': '',
          'actionable_advice': '',
        };
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarArrow(
        press: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColor.black,
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
                SizedBox(
                  height: 500,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BorderButton(
                          text: "Don't pay BNPL on time",
                          press: () {
                            _getAIResponse(_generatePrompt(
                              "What are the specific consequences for me if I miss my Buy Now Pay Later (BNPL) payments?",
                            ));
                          },
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).width * 0.125,
                          borderColor: AppColor.green,
                        ),
                        BorderButton(
                          text: 'Save up 10% of your salary every month',
                          press: () {
                            _getAIResponse(_generatePrompt(
                              "How would saving 10% of my monthly salary impact my financial health, stability, and credit score?",
                            ));
                          },
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).width * 0.125,
                          borderColor: AppColor.green,
                        ),
                        BorderButton(
                          text: 'Pay your BNPL on time',
                          press: () {
                            _getAIResponse(_generatePrompt(
                              "What are the benefits of paying Buy Now Pay Later (BNPL) on time in terms of credit score and financial health?",
                            ));
                          },
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).width * 0.125,
                          borderColor: AppColor.green,
                        ),
                        BorderButton(
                          text: 'Have too many subscription plans',
                          press: () {
                            _getAIResponse(_generatePrompt(
                              "What are the risks of subscribing to too many plans (e.g., Netflix, Spotify, Apple Music) in terms of financial health?",
                            ));
                          },
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).width * 0.125,
                          borderColor: AppColor.green,
                        ),
                        BorderButton(
                          text: 'Apply for a new credit card',
                          press: () {
                            _getAIResponse(_generatePrompt(
                              "What factors should I consider before applying for a new credit card? How will it impact my credit score and financial situation?",
                            ));
                          },
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).width * 0.125,
                          borderColor: AppColor.green,
                        ),
                        BorderButton(
                          text: 'Reduce monthly inflows',
                          press: () {
                            _getAIResponse(_generatePrompt(
                              "What are the potential consequences of a significant reduction in my monthly inflows? How should I adapt?",
                            ));
                          },
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).width * 0.125,
                          borderColor: AppColor.green,
                        ),
                        BorderButton(
                          text: 'Invest in high-risk options',
                          press: () {
                            _getAIResponse(_generatePrompt(
                              "What should I consider before investing in high-risk options? How might it impact my financial stability?",
                            ));
                          },
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).width * 0.125,
                          borderColor: AppColor.green,
                        ),
                        BorderButton(
                          text: 'Ignore credit card payments',
                          press: () {
                            _getAIResponse(_generatePrompt(
                              "What are the consequences of ignoring credit card payments for an extended period?",
                            ));
                          },
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).width * 0.125,
                          borderColor: AppColor.green,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25.sp),
                StandardContainer(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Overview:",
                        style: AppFonts.normalLightText(context),
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        _aiResponse['overview']!,
                        style: AppFonts.normalLightText(context),
                      ),
                      SizedBox(height: 15.sp),
                      Text(
                        "Analysis:",
                        style: AppFonts.normalLightText(context),
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        _aiResponse['analysis']!,
                        style: AppFonts.normalLightText(context),
                      ),
                      SizedBox(height: 15.sp),
                      Text(
                        "Actionable Advice:",
                        style: AppFonts.normalLightText(context),
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        _aiResponse['actionable_advice']!,
                        style: AppFonts.normalLightText(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
