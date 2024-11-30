import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riskore/core/models/user_model.dart';

User? get user => FirebaseAuth.instance.currentUser!;

class UserProvider with ChangeNotifier {
  UserModel? userProviderData = UserModel(
    num_of_accounts: 0,
    avg_daily_balance: 0.0,
    avg_utility_amount: 0.0,
    avg_wallet_transaction: 0.0,
    age: 0,
    credit_score: 0,
    gender: '',
    employment_status: '',
    education_level: '',
    marital_status: '',
    employment_duration: 0,
    industry: '',
    total_account_balance: 0.0,
    hobbies: [],
    userId: '',
    monthly_plan_cost: 0.0,
    monthly_income: 0.0,
    full_name: '',
    num_utility_bills: 0,
    num_wallets: 0,
    occupation: '',
    overdue_bills: 0,
    rent_amount: 0.0,
    rent_status: '',
    residential_status: '',
    total_monthly_inflow: 0.0,
    total_monthly_outflow: 0.0,
    total_wallet_balance: 0.0,
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
                num_of_accounts: snapshot.data()!['num_of_accounts'] ?? 0,
                avg_daily_balance:
                    (snapshot.data()!['avg_daily_balance'] ?? 0).toDouble(),
                avg_utility_amount:
                    (snapshot.data()!['avg_utility_amount'] ?? 0).toDouble(),
                avg_wallet_transaction:
                    (snapshot.data()!['avg_wallet_transaction'] ?? 0).toDouble(),
                age: snapshot.data()!['age'] ?? 0,
                credit_score: snapshot.data()!['credit_score'] ?? 0,
                gender: snapshot.data()!['gender'] ?? '',
                employment_status: snapshot.data()!['employment_status'] ?? '',
                education_level: snapshot.data()!['education_level'] ?? '',
                marital_status: snapshot.data()!['marital_status'] ?? '',
                employment_duration: snapshot.data()!['employment_duration'] ?? 0,
                industry: snapshot.data()!['industry'] ?? '',
                total_account_balance:
                    (snapshot.data()!['total_account_balance'] ?? 0).toDouble(),
                hobbies: List<String>.from(snapshot.data()!['hobbies'] ?? []),
                userId: snapshot.id,
                monthly_plan_cost:
                    (snapshot.data()!['monthly_plan_cost'] ?? 0).toDouble(),
                monthly_income:
                    (snapshot.data()!['monthly_income'] ?? 0).toDouble(),
                full_name: snapshot.data()!['full_name'] ?? '',
                num_utility_bills: snapshot.data()!['num_utility_bills'] ?? 0,
                num_wallets: snapshot.data()!['num_wallets'] ?? 0,
                occupation: snapshot.data()!['occupation'] ?? '',
                overdue_bills: snapshot.data()!['overdue_bills'] ?? 0,
                rent_amount: (snapshot.data()!['rent_amount'] ?? 0).toDouble(),
                rent_status: snapshot.data()!['rent_status'] ?? '',
                residential_status: snapshot.data()!['residential_status'] ?? '',
                total_monthly_inflow:
                    (snapshot.data()!['total_monthly_inflow'] ?? 0).toDouble(),
                total_monthly_outflow:
                    (snapshot.data()!['total_monthly_outflow'] ?? 0).toDouble(),
                total_wallet_balance:
                    (snapshot.data()!['total_wallet_balance'] ?? 0).toDouble(),
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