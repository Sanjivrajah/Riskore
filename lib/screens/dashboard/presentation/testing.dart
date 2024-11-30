import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riskore/core/providers/full_user_data_provider.dart';

class UserDataFetcher extends StatefulWidget {
  @override
  State<UserDataFetcher> createState() => _UserDataFetcherState();
}

class _UserDataFetcherState extends State<UserDataFetcher> {
  Map<String, dynamic>? riskScore;
  bool isLoading = false;
  String? error;

  @override
  void initState() {
    super.initState();
    _fetchAndPrintData();
  }

  Future<void> _fetchAndPrintData() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      final provider = context.read<FullDataUserProvider>();
      await provider.fetchUserData();

      if (provider.userData != null) {
        print('User Data:');
        print('${provider.userData!}');

        final result = await provider.predictUserRiskHttp(provider.userData!);

        setState(() {
          riskScore = result;
          isLoading = false;
        });

        print('Risk Score Results:');
        print('Risk Category: ${result['risk_category']}');
        print('Confidence: ${result['confidence']}');
        print('Status: ${result['status']}');
      } else {
        setState(() {
          error = 'No user data found';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = 'Error: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return Center(child: Text(error!));
    }

    if (riskScore != null) {
      return Card(
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Risk Category: ${riskScore!['risk_category']}',
                
              ),
              const SizedBox(height: 8),
              Text(
                'Confidence: ${(riskScore!['confidence'] * 100).toStringAsFixed(1)}%',
                
              ),
              const SizedBox(height: 8),
              Text(
                'Status: ${riskScore!['status']}',
                
              ),
              const SizedBox(height: 8),
              Text(
                'Status: ${riskScore!['credit_score']}',
              ),
            ],
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
