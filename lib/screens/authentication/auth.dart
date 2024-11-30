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
        'fullName': name,
        'age': '',
        'gender': [''],
        'employment_status': '',
        'occupations': '',
        'monthly_income': 0.0,
        'education_level': '',
        'residential_status': '',
        'marital_status': '',
        'employment_duration': 0,
        'industry': '',
        'hobbies': [''],
        'numOfAccounts': 0,
        'totalAccountBalance': 0.0,
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

    });
    return null;
  }

  Future<void> signOut(BuildContext context) async {
    print('logout');
    await _firebaseAuth.signOut();
    // Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeName);
  }

}
