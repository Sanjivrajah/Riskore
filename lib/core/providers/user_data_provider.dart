import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riskore/core/models/user_model.dart';

User? get user => FirebaseAuth.instance.currentUser!;

class UserProvider with ChangeNotifier {
  UserModel? userProviderData = UserModel(
    accountsConnected: [],
    avgDailyBalance: 0.0,
    avgUtilityAmount: 0.0,
    avgWalletTransaction: 0.0,
    birthDate: '',
    creditScore: 0,
    email: '',
    employmentStatus: '',
    hobbies: [],
    id: '',
    monthlyPlanCost: 0.0,
    monthlyIncome: 0.0,
    name: '',
    numUtilityBills: 0,
    numWallets: 0,
    occupations: '',
    overdueBills: 0,
    rentAmount: 0.0,
    rentStatus: '',
    totalMonthlyInflow: 0.0,
    totalMonthlyOutflow: 0.0,
    totalWalletBalance: 0.0,
  );

  Future<void> fetchUserData() async {
    if (user != null) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get()
            .then(
          (snapshot) {
            if (snapshot.exists) {
              userProviderData = UserModel(
                accountsConnected: List<String>.from(
                    snapshot.data()!['accountsConnected'] ?? []),
                avgDailyBalance:
                    (snapshot.data()!['avgDailyBalance'] ?? 0).toDouble(),
                avgUtilityAmount:
                    (snapshot.data()!['avgUtilityAmount'] ?? 0).toDouble(),
                avgWalletTransaction:
                    (snapshot.data()!['avgWalletTransaction'] ?? 0).toDouble(),
                birthDate: snapshot.data()!['birthDate'] ?? '',
                creditScore: snapshot.data()!['creditScore'] ?? 0,
                email: snapshot.data()!['email'] ?? '',
                employmentStatus: snapshot.data()!['employment_status'] ?? '',
                hobbies: List<String>.from(snapshot.data()!['hobbies'] ?? []),
                id: snapshot.id,
                monthlyPlanCost:
                    (snapshot.data()!['monthlyPlanCost'] ?? 0).toDouble(),
                monthlyIncome:
                    (snapshot.data()!['monthly_income'] ?? 0).toDouble(),
                name: snapshot.data()!['name'] ?? '',
                numUtilityBills: snapshot.data()!['numUtilityBills'] ?? 0,
                numWallets: snapshot.data()!['numWallets'] ?? 0,
                occupations: snapshot.data()!['occupations'] ?? '',
                overdueBills: snapshot.data()!['overdueBills'] ?? 0,
                rentAmount: (snapshot.data()!['rentAmount'] ?? 0).toDouble(),
                rentStatus: snapshot.data()!['rentStatus'] ?? '',
                totalMonthlyInflow:
                    (snapshot.data()!['totalMonthlyInflow'] ?? 0).toDouble(),
                totalMonthlyOutflow:
                    (snapshot.data()!['totalMonthlyOutflow'] ?? 0).toDouble(),
                totalWalletBalance:
                    (snapshot.data()!['totalWalletBalance'] ?? 0).toDouble(),
              );
              print('User data fetched successfully');
              notifyListeners();
            }
          },
        );
      } catch (e) {
        print('Error fetching user data: $e');
      }
    } else {
      print('User is null');
    }
  }
}
