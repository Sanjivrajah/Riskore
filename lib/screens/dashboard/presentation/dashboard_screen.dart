import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riskore/core/models/upcoming_payment_model.dart';
import 'package:riskore/core/providers/user_data_provider.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/screens/credit_report/all_reports_screen.dart';
import 'package:riskore/screens/financial_health/financial_health_screen.dart';
import 'package:riskore/widgets/appbar_profile.dart';
import 'package:riskore/widgets/border_button.dart';
import 'package:riskore/widgets/semicircle_progress.dart';
import 'package:riskore/widgets/standard_container.dart';
import 'package:riskore/widgets/tab_bar_dashboard.dart';
import 'package:riskore/widgets/upcoming_payment_row.dart';
import 'package:sizer/sizer.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard-screen';
  final List<UpcomingPayment> upcomingPaymentList;
  final int index;

  const DashboardScreen({
    super.key,
    required this.upcomingPaymentList,
    required this.index,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Map<String, dynamic>? riskScore;
  bool _isLoading = true;
  String? error;

  String selectedTab = "Pay Later";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchAndPrintData();
  }

  Future<void> _fetchAndPrintData() async {
    setState(() {
      _isLoading = true;
      error = null;
    });

    try {
      final provider = context.read<UserDataProvider>();
      await provider.fetchUserData();

      if (provider.userData != null) {
        print('User Data:');
        print('${provider.userData!}');

        final result = await provider.predictUserRiskHttp(provider.userData!);

        // Use Future.delayed to ensure this runs after the build phase
        Future.delayed(Duration.zero, () {
          setState(() {
            riskScore = result;
            _isLoading = false;
          });
        });

        print('Risk Score Results:');
        print('Risk Category: ${result['risk_category']}');
        print('Confidence: ${result['confidence']}');
        print('Status: ${result['status']}');
      } else {
        setState(() {
          error = 'No user data found';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = 'Error: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<UserDataProvider>();
    return Scaffold(
      appBar: AppBarProfile(press: () {}),
      backgroundColor: AppColor.black,
      body:  _isLoading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
        child: SingleChildScrollView(
          child: 
          Padding(
            padding: AppStyles.edgeInsetsLR_20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Text
                Text(
                  "Welcome Back,",
                  style: AppFonts.largeExtraLightText(context),
                ),
                Text(
                  "${provider.userData?.full_name}",
                  style: AppFonts.largestLightTextGreen(context),
                ),
                const SizedBox(height: 40),

                      // Credit Risk Score Section
                      Text(
                        "Your Credit Risk Score",
                        style: AppFonts.normalLightText(context),
                      ),
                      const SizedBox(height: 5),
                      StandardContainer(
                        width: MediaQuery.sizeOf(context).width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularArchProgressBar(
                                      value: (riskScore?['credit_score']
                                              ?.toDouble() ??
                                          56.0)),
                                  Column(
                                    children: [
                                      const SizedBox(height: 15),
                                      Text(
                                        "${riskScore!['credit_score'] ?? 56}%",
                                        style: AppFonts.largeExtraLightText(
                                            context),
                                      ),
                                      Text(
                                        "Credit Score",
                                        style: AppFonts.smallLightText(context),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width / 2.7,
                                    height: 35,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const FinancialHealthScreen(),
                                          ),
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          AppColor.white,
                                        ),
                                        shape: const WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius: AppStyles
                                                .borderRadiusFullyRounded,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "Improve Score",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width / 2.6,
                                    height: 35,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        foregroundColor: AppColor.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: AppStyles
                                              .borderRadiusFullyRounded,
                                          side: BorderSide(
                                            color: AppColor.red,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            "lib/assets/icons/red_triangle.png",
                                            width: 10,
                                          ),
                                          Text(
                                            "10% last month",
                                            style: AppFonts.smallLightText(
                                                context),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20.sp),

                      BorderButton(
                        text: "Click to View Credit Report",
                        press: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AllReportsScreen(),
                            ),
                          );
                        },
                        width: MediaQuery.sizeOf(context).width,
                        height: 45,
                        borderColor: AppColor.white,
                      ),
                      SizedBox(height: 30.sp),

                      Text(
                        "Upcoming Payments",
                        style: AppFonts.normalLightText(context),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 28.sp,
                        child: TabBarDashboard(
                          onTabSelected: (tab) {
                            setState(() {
                              selectedTab = tab;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 15),
                      Column(
                        children: [
                          if (selectedTab == "Pay Later") ...[
                            StandardContainer(
                              width: MediaQuery.sizeOf(context).width,
                              child: Column(
                                children: [
                                  for (var offer in widget.upcomingPaymentList
                                      .where((offer) =>
                                          offer.category == "Pay Later"))
                                    UpcomingPaymentRow(
                                      image: offer.image,
                                      name: offer.name,
                                      amount: offer.amount,
                                      date: offer.date,
                                    ),
                                ],
                              ),
                            ),
                          ] else if (selectedTab == "Subscription") ...[
                            StandardContainer(
                              width: MediaQuery.sizeOf(context).width,
                              child: Column(
                                children: [
                                  for (var offer in widget.upcomingPaymentList
                                      .where((offer) =>
                                          offer.category == "Subscription"))
                                    UpcomingPaymentRow(
                                      image: offer.image,
                                      name: offer.name,
                                      amount: offer.amount,
                                      date: offer.date,
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
