import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riskore/core/models/bnpl_model.dart';

class BNPLProvider with ChangeNotifier {
  List<String> bnplIdList = [];
  List<BNPL> loadedBnplList = [];

  Future<void> createBNPL(BNPL bnpl) async {
    await FirebaseFirestore.instance.collection('bnpl').doc().set({
      "providerId": bnpl.providerId,
      "providerName": bnpl.providerName,
      "accountStatus": bnpl.accountStatus,
      "creditLimit": bnpl.creditLimit,
      "availableCredit": bnpl.availableCredit,
      "paymentHistory": bnpl.paymentHistory
          .map((ph) => {
                "purchaseDate": ph.purchaseDate.toIso8601String(),
                "merchant": ph.merchant,
                "originalAmount": ph.originalAmount,
                "installmentAmount": ph.installmentAmount,
                "remainingInstallments": ph.remainingInstallments,
                "dueDate": ph.dueDate.toIso8601String(),
                "paymentStatus": ph.paymentStatus,
              })
          .toList(),
      "activeInstallments": bnpl.activeInstallments
          .map((ai) => {
                "purchaseDetails": ai.purchaseDetails,
                "totalAmount": ai.totalAmount,
                "monthlyInstallment": ai.monthlyInstallment,
                "remainingBalance": ai.remainingBalance,
                "nextPaymentDate": ai.nextPaymentDate.toIso8601String(),
                "installmentTerm": ai.installmentTerm,
              })
          .toList(),
      "metrics": {
        "totalCreditUtilized": bnpl.metrics.totalCreditUtilized,
        "paymentConsistencyScore": bnpl.metrics.paymentConsistencyScore,
        "latePaymentCount": bnpl.metrics.latePaymentCount,
        "averageTransactionValue": bnpl.metrics.averageTransactionValue,
        "repaymentRatio": bnpl.metrics.repaymentRatio,
      },
    });
  }

  Future<void> fetchBNPLId() async {
    try {
      await FirebaseFirestore.instance
          .collection('bnpl')
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((bnpl) {
          bnplIdList.add(bnpl.reference.id);
        });
      });
      print('Success! fetched BNPL Id List: ${bnplIdList}');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchAllBNPLData() async {
    for (int i = 0; i < bnplIdList.length; i++) {
      await fetchBNPLDataFromId(bnplIdList[i]);
    }
    print('All BNPL data fetched');
  }

  Future<void> fetchBNPLDataFromId(String bnplId) async {
    await FirebaseFirestore.instance
        .collection('bnpl')
        .doc(bnplId)
        .get()
        .then((snapshot) {
      final data = snapshot.data()!;
      BNPL loadedBnpl = BNPL(
        providerId: data['providerId'],
        providerName: data['providerName'],
        accountStatus: data['accountStatus'],
        creditLimit: data['creditLimit'],
        availableCredit: data['availableCredit'],
        paymentHistory: (data['paymentHistory'] as List)
            .map((ph) => PaymentHistory(
                  purchaseDate: DateTime.parse(ph['purchaseDate']),
                  merchant: ph['merchant'],
                  originalAmount: ph['originalAmount'],
                  installmentAmount: ph['installmentAmount'],
                  remainingInstallments: ph['remainingInstallments'],
                  dueDate: DateTime.parse(ph['dueDate']),
                  paymentStatus: ph['paymentStatus'],
                ))
            .toList(),
        activeInstallments: (data['activeInstallments'] as List)
            .map((ai) => ActiveInstallment(
                  purchaseDetails: ai['purchaseDetails'],
                  totalAmount: ai['totalAmount'],
                  monthlyInstallment: ai['monthlyInstallment'],
                  remainingBalance: ai['remainingBalance'],
                  nextPaymentDate: DateTime.parse(ai['nextPaymentDate']),
                  installmentTerm: ai['installmentTerm'],
                ))
            .toList(),
        metrics: BNPLMetrics(
          totalCreditUtilized: data['metrics']['totalCreditUtilized'],
          paymentConsistencyScore: data['metrics']['paymentConsistencyScore'],
          latePaymentCount: data['metrics']['latePaymentCount'],
          averageTransactionValue: data['metrics']['averageTransactionValue'],
          repaymentRatio: data['metrics']['repaymentRatio'],
        ),
      );
      loadedBnplList.add(loadedBnpl);
      print('Fetched BNPL data for provider: ${data['providerName']}');
    });
  }
}
