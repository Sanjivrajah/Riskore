import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/bill_payment.dart'; // Import your BillPayment model

class BillPaymentProvider with ChangeNotifier {
  List<String> billPaymentIdList = [];
  List<BillPayment> loadedBillPaymentList = [];

  // Function to create a new bill payment entry
  Future<void> createBillPayment(BillPayment billPayment) async {
    await FirebaseFirestore.instance.collection('bill_payments').doc().set({
      "userId": billPayment.userId,
      "utilityBills": billPayment.utilityBills
          .map((utilityBill) => {
                "provider": utilityBill.provider,
                "accountNumber": utilityBill.accountNumber,
                "monthlyAmount": utilityBill.monthlyAmount,
                "dueDate": utilityBill.dueDate.toIso8601String(),
                "paymentHistory": utilityBill.paymentHistory
                    .map((record) => {
                          "date": record.date.toIso8601String(),
                          "amount": record.amount,
                          "status": record.status,
                        })
                    .toList(),
              })
          .toList(),
      "rentPayments": {
        "monthlyAmount": billPayment.rentPayments.monthlyAmount,
        "dueDate": billPayment.rentPayments.dueDate.toIso8601String(),
        "paymentHistory": billPayment.rentPayments.paymentHistory
            .map((record) => {
                  "date": record.date.toIso8601String(),
                  "amount": record.amount,
                  "status": record.status,
                })
            .toList(),
      },
      "mobileBills": {
        "provider": billPayment.mobileBills.provider,
        "planDetails": billPayment.mobileBills.planDetails,
        "paymentHistory": billPayment.mobileBills.paymentHistory
            .map((record) => {
                  "date": record.date.toIso8601String(),
                  "amount": record.amount,
                  "status": record.status,
                })
            .toList(),
      },
      "incomeTax": {
        "year": billPayment.incomeTax.year,
        "amount": billPayment.incomeTax.amount,
        "status": billPayment.incomeTax.status,
      },
    });
  }

  // Function to fetch all bill payment IDs
  Future<void> fetchBillPaymentId() async {
    try {
      await FirebaseFirestore.instance
          .collection('bill_payments')
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((payment) {
          billPaymentIdList.add(payment.reference.id);
        });
      });
      print('Success! fetched Bill Payment Id List: ${billPaymentIdList}');
    } catch (e) {
      print(e.toString());
    }
  }

  // Function to fetch all bill payment data
  Future<void> fetchAllBillPaymentData() async {
    for (int i = 0; i < billPaymentIdList.length; i++) {
      await fetchBillPaymentDataFromId(billPaymentIdList[i]);
    }
    print('All Bill Payment data fetched');
  }

  // Function to fetch bill payment data by ID
  Future<void> fetchBillPaymentDataFromId(String paymentId) async {
    await FirebaseFirestore.instance
        .collection('bill_payments')
        .doc(paymentId)
        .get()
        .then((snapshot) {
      final data = snapshot.data()!;
      BillPayment loadedBillPayment = BillPayment(
        userId: data['userId'],
        utilityBills: (data['utilityBills'] as List)
            .map((utility) => UtilityBill(
                  provider: utility['provider'],
                  accountNumber: utility['accountNumber'],
                  monthlyAmount: utility['monthlyAmount'],
                  dueDate: DateTime.parse(utility['dueDate']),
                  paymentHistory: (utility['paymentHistory'] as List)
                      .map((record) => PaymentRecord(
                            date: DateTime.parse(record['date']),
                            amount: record['amount'],
                            status: record['status'],
                          ))
                      .toList(),
                ))
            .toList(),
        rentPayments: RentPayment(
          monthlyAmount: data['rentPayments']['monthlyAmount'],
          dueDate: DateTime.parse(data['rentPayments']['dueDate']),
          paymentHistory: (data['rentPayments']['paymentHistory'] as List)
              .map((record) => PaymentRecord(
                    date: DateTime.parse(record['date']),
                    amount: record['amount'],
                    status: record['status'],
                  ))
              .toList(),
        ),
        mobileBills: MobileBill(
          provider: data['mobileBills']['provider'],
          planDetails: data['mobileBills']['planDetails'],
          paymentHistory: (data['mobileBills']['paymentHistory'] as List)
              .map((record) => PaymentRecord(
                    date: DateTime.parse(record['date']),
                    amount: record['amount'],
                    status: record['status'],
                  ))
              .toList(),
        ),
        incomeTax: IncomeTax(
          year: data['incomeTax']['year'],
          amount: data['incomeTax']['amount'],
          status: data['incomeTax']['status'],
        ),
      );
      loadedBillPaymentList.add(loadedBillPayment);
      print('Fetched Bill Payment data for user ID: ${data['userId']}');
    });
  }
}
