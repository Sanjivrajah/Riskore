import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riskore/core/models/full_user_data.dart';

User? get user => FirebaseAuth.instance.currentUser!;

class UserDataProvider with ChangeNotifier {
  UserData? userData = UserData(
    userId: '',
    fullName: '',
    age: 0,
    gender: '',
    employmentStatus: '',
    occupation: '',
    monthlyIncome: 0.0,
    educationLevel: '',
    residentialStatus: '',
    maritalStatus: '',
    employmentDuration: 0,
    industry: '',
    hobbies: [],
    numOfAccounts: 0,
    totalAccountBalance: 0.0,
    avgDailyBalance: 0.0,
    totalMonthlyInflow: 0.0,
    totalMonthlyOutflow: 0.0,
    numWallets: 0,
    totalWalletBalance: 0.0,
    avgWalletTransaction: 0.0,
    numUtilityBills: 0,
    avgUtilityAmount: 0.0,
    overdueBills: 0,
    rentAmount: 0.0,
    rentStatus: '',
    monthlyPlanCost: 0.0,
    creditScore: 0,
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
              userData!.userId = snapshot.id;
              userData!.fullName = snapshot.data()!['fullName'] ?? '';
              userData!.age = snapshot.data()!['age'] ?? '';
              userData!.gender = snapshot.data()!['gender'] ?? '';
              userData!.employmentStatus =
                  snapshot.data()!['employmentStatus'] ?? '';
              userData!.occupation = snapshot.data()!['occupation'] ?? '';
              userData!.monthlyIncome =
                  snapshot.data()!['monthlyIncome'] ?? 0.0;
              userData!.educationLevel =
                  snapshot.data()!['educationLevel'] ?? '';
              userData!.residentialStatus =
                  snapshot.data()!['residentialStatus'] ?? '';
              userData!.maritalStatus = snapshot.data()!['maritalStatus'] ?? '';
              userData!.employmentDuration =
                  snapshot.data()!['employmentDuration'] ?? '';
              userData!.industry = snapshot.data()!['industry'] ?? '';
              userData!.hobbies =
                  List<String>.from(snapshot.data()!['hobbies'] ?? []);
              userData!.numOfAccounts = snapshot.data()!['numOfAccounts'] ?? 0;
              userData!.totalAccountBalance =
                  snapshot.data()!['totalAccountBalance'] ?? 0.0;
              userData!.avgDailyBalance =
                  snapshot.data()!['avgDailyBalance'] ?? 0.0;
              userData!.totalMonthlyInflow =
                  snapshot.data()!['totalMonthlyInflow'] ?? 0.0;
              userData!.totalMonthlyOutflow =
                  snapshot.data()!['totalMonthlyOutflow'] ?? 0.0;
              userData!.numWallets = snapshot.data()!['numWallets'] ?? 0;
              userData!.totalWalletBalance =
                  snapshot.data()!['totalWalletBalance'] ?? 0.0;
              userData!.avgWalletTransaction =
                  snapshot.data()!['avgWalletTransaction'] ?? 0.0;
              userData!.numUtilityBills =
                  snapshot.data()!['numUtilityBills'] ?? 0;
              userData!.avgUtilityAmount =
                  snapshot.data()!['avgUtilityAmount'] ?? 0.0;
              userData!.overdueBills = snapshot.data()!['overdueBills'] ?? 0;
              userData!.rentAmount = snapshot.data()!['rentAmount'] ?? 0.0;
              userData!.rentStatus = snapshot.data()!['rentStatus'] ?? '';
              userData!.monthlyPlanCost =
                  snapshot.data()!['monthlyPlanCost'] ?? 0.0;
              userData!.creditScore = snapshot.data()!['creditScore'] ?? 0;

              print('User data fetched successfully');
              notifyListeners();
            }
          },
        );
      } catch (e) {
        print('Error fetching user data: $e');
      }
    } else {
      print('No user is currently signed in');
    }
  }

//
}
