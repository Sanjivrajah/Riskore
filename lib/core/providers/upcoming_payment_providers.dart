import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/upcoming_payment_model.dart'; // Import your UpcomingPayment model

class UpcomingPaymentProvider with ChangeNotifier {
  List<String> upcomingPaymentIdList = [];
  List<UpcomingPayment> loadedUpcomingPayments = [];

  // Function to create a new upcoming payment entry
  Future<void> createUpcomingPayment(UpcomingPayment upcomingPayment) async {
    await FirebaseFirestore.instance.collection('upcoming_payments').doc().set({
      "image": upcomingPayment.image,
      "name": upcomingPayment.name,
      "amount": upcomingPayment.amount,
      "date": upcomingPayment.date,
      "category": upcomingPayment.category,
    });
  }

  // Function to fetch all upcoming payment IDs
  Future<void> fetchUpcomingPaymentIds() async {
    try {
      await FirebaseFirestore.instance
          .collection('upcoming_payments')
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((payment) {
          upcomingPaymentIdList.add(payment.reference.id);
        });
      });
      print('Success! fetched Upcoming Payment Id List: ${upcomingPaymentIdList}');
    } catch (e) {
      print(e.toString());
    }
  }

  // Function to fetch all upcoming payment data
  Future<void> fetchAllUpcomingPayments() async {
    for (int i = 0; i < upcomingPaymentIdList.length; i++) {
      await fetchUpcomingPaymentDataFromId(upcomingPaymentIdList[i]);
    }
    print('All Upcoming Payments fetched');
  }

  // Function to fetch upcoming payment data by ID
  Future<void> fetchUpcomingPaymentDataFromId(String paymentId) async {
    await FirebaseFirestore.instance
        .collection('upcoming_payments')
        .doc(paymentId)
        .get()
        .then((snapshot) {
      final data = snapshot.data()!;
      UpcomingPayment loadedUpcomingPayment = UpcomingPayment(
        image: data['image'],
        name: data['name'],
        amount: data['amount'],
        date: data['date'],
        category: data['category'],
      );
      loadedUpcomingPayments.add(loadedUpcomingPayment);
      print('Fetched Upcoming Payment data for name: ${data['name']}');
    });
  }
} 