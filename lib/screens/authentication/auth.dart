import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riskore/screens/splash_screen.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void>? createUserWithEmailAndPassword(
    String email,
    String password,
    String name, 
  ) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      FirebaseFirestore.instance.collection('user').doc(value.user!.uid).set({
        "email": value.user!.email,
        "id": value.user!.uid,
        'name': name,
        'birthDate': '',
        'accountsConnected': [''], 
        'employment_status': '', 
        'occupations': '',
        'monthly_income': 0.0, 
        'hobbies': [''],
        'avgDailyBalance': 0.0,
        'totalMonthlyInflow': 0.0,
        'totalMonthlyOutflow': 0.0,
        'numWallets': 0,
        'totalWalletBalance': 0.0,
        'avgWalletTransaction': 0.0,
        'numUtilityBills': 0,
        'avgUtilityAmount': 0.0,
        'overdueBills': 0,
        'rentAmount': 0.0,
        'rentStatus': '',
        'monthlyPlanCost': 0.0,
        'creditScore': 0,
      });
      // Setting up dummy fullUserData
      FirebaseFirestore.instance.collection('full_user_data').doc(value.user!.uid).set({
        "email": value.user!.email,
        "userId": value.user!.uid,
        'full_name': name,
        'age': 24,
        'gender': 'Male',
        'employment_status': 'Employed',
        'occupations': 'Project Manager',
        'monthly_income': 3590.0,
        'education_level': 'Bachelor',
        'residential_status': 'Rent',
        'marital_status': 'Single',
        'employment_duration': 2,
        'industry': 'Technology',
        'hobbies': ['Gaming', 'Music'],
        'num_of_accounts': 2,
        'total_account_balance': 7000,
        'avg_daily_balance': 39.0,
        'total_monthly_inflow': 4000.0,
        'total_monthly_outflow': 3400.0,
        'num_wallets': 2,
        'total_wallet_balance': 998.0,
        'avg_wallet_transaction': 50.0,
        'num_utility_bills': 3,
        'avg_utility_amount': 202.0,
        'overdue_bills': 3,
        'rent_amount': 1500.0,
        'rent_status': 'Pending',
        'monthly_plan_cost': 125.0,
        'credit_score': 625,
      });

    });
    return null;
  }

  Future<void> signOut(BuildContext context) async {
    print('logout');
    await _firebaseAuth.signOut();
    // Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeName);
  }

}
