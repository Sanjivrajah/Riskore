import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riskore/core/models/user_model.dart';
import 'package:riskore/screens/authentication/auth.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:http/http.dart' as http;

class FullDataUserProvider with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  UserModel? _userData;
  bool _isLoading = false;

  UserModel? get userData => _userData;
  bool get isLoading => _isLoading;

  final String userId = 'LfC4h9Um06O2zSxNonJSRTFTNsi2';
  int generateCreditScore(String creditCategory, int seed) {
    Random random = Random(seed);
    int score;

    switch (creditCategory) {
      case 'Low':
        score = random.nextInt(41); 
        break;
      case 'Medium':
        score = random.nextInt(40) + 41; 
        break;
      case 'High':
        score = random.nextInt(20) + 81; 
        break;
      default:
        score = 0; 
    }

    return score;
  }

  Future<void> fetchUserData() async {
    try {
      _isLoading = true;
      notifyListeners();

      final DocumentSnapshot doc =
          await _db.collection('full_user_data').doc(userId).get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        _userData = UserModel(
          userId: data['userId'] ?? '',
          full_name: data['full_name'] ?? '',
          age: data['age'] ?? 0,
          gender: data['gender'] ?? '',
          employment_status: data['employment_status'] ?? '',
          occupation: data['occupation'] ?? '',
          monthly_income: (data['monthly_income'] ?? 0).toDouble(),
          education_level: data['education_level'] ?? '',
          residential_status: data['residential_status'] ?? '',
          marital_status: data['marital_status'] ?? '',
          employment_duration: data['employment_duration'] ?? 0,
          industry: data['industry'] ?? '',
          hobbies: List<String>.from(data['hobbies'] ?? []),
          num_of_accounts: data['num_of_accounts'] ?? 0,
          total_account_balance:
              (data['total_account_balance'] ?? 0).toDouble(),
          avg_daily_balance: (data['avg_daily_balance'] ?? 0).toDouble(),
          total_monthly_inflow: (data['total_monthly_inflow'] ?? 0).toDouble(),
          total_monthly_outflow:
              (data['total_monthly_outflow'] ?? 0).toDouble(),
          num_wallets: data['num_wallets'] ?? 0,
          total_wallet_balance: (data['total_wallet_balance'] ?? 0).toDouble(),
          avg_wallet_transaction:
              (data['avg_wallet_transaction'] ?? 0).toDouble(),
          num_utility_bills: data['num_utility_bills'] ?? 0,
          avg_utility_amount: (data['avg_utility_amount'] ?? 0).toDouble(),
          overdue_bills: data['overdue_bills'] ?? 0,
          rent_amount: (data['rent_amount'] ?? 0).toDouble(),
          rent_status: data['rent_status'] ?? '',
          monthly_plan_cost: (data['monthly_plan_cost'] ?? 0).toDouble(),
          credit_score: data['credit_score'] ?? 0,
        );

        // Convert to JSON and print
        Map<String, dynamic> userDataJson = _userData!.toJson();

        print('User Data in JSON format:');
        print(const JsonEncoder.withIndent('  ').convert(userDataJson));
      }
    } catch (error) {
      print('Error fetching user data: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> predictUserRiskHttp(UserModel userData) async {
    try {
      final url = Uri.parse('https://trpqmwwd-5000.asse.devtunnels.ms/predict');

      final Map<String, dynamic> requestData = {
        'full_name': userData.full_name,
        'age': userData.age,
        'gender': userData.gender,
        'employment_status': userData.employment_status,
        'occupation': userData.occupation,
        'monthly_income': userData.monthly_income,
        'education_level': userData.education_level,
        'residential_status': userData.residential_status,
        'marital_status': userData.marital_status,
        'employment_duration': userData.employment_duration,
        'industry': userData.industry,
        'hobbies': userData.hobbies.isNotEmpty ? userData.hobbies[0] : '',
        'num_accounts': userData.num_of_accounts,
        'total_account_balance': userData.total_account_balance,
        'avg_daily_balance': userData.avg_daily_balance,
        'total_monthly_inflow': userData.total_monthly_inflow,
        'total_monthly_outflow': userData.total_monthly_outflow,
        'num_wallets': userData.num_wallets,
        'total_wallet_balance': userData.total_wallet_balance,
        'avg_wallet_transaction': userData.avg_wallet_transaction,
        'num_utility_bills': userData.num_utility_bills,
        'avg_utility_amount': userData.avg_utility_amount,
        'overdue_bills': userData.overdue_bills,
        'rent_amount': userData.rent_amount,
        'rent_status': userData.rent_status,
        'monthly_plan_cost': userData.monthly_plan_cost,
        'credit_score': userData.credit_score
      };

      print('Sending request to: $url');
      print('Request data: ${json.encode(requestData)}');

      final options = Options(
        headers: {
          'Content-Type': 'application/json',
        },
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      );

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestData),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        // Extract risk_category from the response
        final riskCategory = responseData['risk_category'];
        // Generate a credit scroe based on the risk category
        int creditScore = generateCreditScore(riskCategory, 10);

        return {
          'risk_category': riskCategory,
          'confidence': responseData['confidence'],
          'status': responseData['status'],
          'credit_score': creditScore, // Include the generated credit score
        };
      } else {
        throw Exception('Failed to predict risk: ${response.statusCode}');
      }
    } catch (e) {
      return {
        'error': 'Failed to predict risk: $e',
        'prediction': 'Error',
        'probabilities': {
          'Low': 0.0,
          'Medium': 0.0,
          'High': 0.0,
        },
        'confidence': 0.0,
      };
    }
  }
}
