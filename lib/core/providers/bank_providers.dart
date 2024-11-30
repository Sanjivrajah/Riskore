import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riskore/core/models/bank_offers_model.dart';
import '../models/bank_acc_model.dart'; 
import '../models/bank_offers_model.dart'; // Import the BankOffers model

class BankAccountProvider with ChangeNotifier {
  List<String> bankAccountIdList = [];
  List<BankAccount> loadedBankAccountList = [];

  // Function to create a new bank account entry
  Future<void> createBankAccount(BankAccount bankAccount) async {
    await firestore.FirebaseFirestore.instance.collection('bank_accounts').doc().set({
      "accountId": bankAccount.accountId,
      "bankName": bankAccount.bankName,
      "accountType": bankAccount.accountType,
      "accountBalance": bankAccount.accountBalance,
      "averageDailyBalance": bankAccount.averageDailyBalance,
      "monthlyInflow": bankAccount.monthlyInflow,
      "monthlyOutflow": bankAccount.monthlyOutflow,
      "transactionHistory": bankAccount.transactionHistory
          .map((transaction) => {
                "date": transaction.date.toIso8601String(),
                "amount": transaction.amount,
                "type": transaction.type,
                "description": transaction.description,
                "category": transaction.category,
              })
          .toList(),
      "incomeDeposits": bankAccount.incomeDeposits
          .map((income) => {
                "date": income.date.toIso8601String(),
                "amount": income.amount,
                "source": income.source,
                "frequency": income.frequency,
              })
          .toList(),
      "recurringPayments": bankAccount.recurringPayments
          .map((payment) => {
                "type": payment.type,
                "amount": payment.amount,
                "recipient": payment.recipient,
                "frequency": payment.frequency,
                "lastPayment": payment.lastPayment.toIso8601String(),
              })
          .toList(),
    });
  }

  // Function to create a new bank offer entry
  Future<void> createBankOffer(BankOffers bankOffer) async {
    await FirebaseFirestore.instance.collection('bank_offers').doc().set({
      "image": bankOffer.image,
      "name": bankOffer.name,
      "interest": bankOffer.interest,
      "period": bankOffer.period,
      "amount": bankOffer.amount,
      "category": bankOffer.category,
    });
  }

  // Function to fetch all bank account IDs
  Future<void> fetchBankAccountId() async {
    try {
      await FirebaseFirestore.instance
          .collection('bank_accounts')
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((account) {
          bankAccountIdList.add(account.reference.id);
        });
      });
      print('Success! fetched Bank Account Id List: ${bankAccountIdList}');
    } catch (e) {
      print(e.toString());
    }
  }

  // Function to fetch all bank account data
  Future<void> fetchAllBankAccountData() async {
    for (int i = 0; i < bankAccountIdList.length; i++) {
      await fetchBankAccountDataFromId(bankAccountIdList[i]);
    }
    print('All Bank Account data fetched');
  }

  // Function to fetch bank account data by ID
  Future<void> fetchBankAccountDataFromId(String accountId) async {
    await FirebaseFirestore.instance
        .collection('bank_accounts')
        .doc(accountId)
        .get()
        .then((snapshot) {
      final data = snapshot.data()!;
      BankAccount loadedBankAccount = BankAccount(
        accountId: data['accountId'],
        bankName: data['bankName'],
        accountType: data['accountType'],
        accountBalance: data['accountBalance'],
        averageDailyBalance: data['averageDailyBalance'],
        monthlyInflow: data['monthlyInflow'],
        monthlyOutflow: data['monthlyOutflow'],
        transactionHistory: (data['transactionHistory'] as List)
            .map((transaction) => BankTransaction(
                  date: DateTime.parse(transaction['date']),
                  amount: transaction['amount'],
                  type: transaction['type'],
                  description: transaction['description'],
                  category: transaction['category'],
                ))
            .toList(),
        incomeDeposits: (data['incomeDeposits'] as List)
            .map((income) => IncomeDeposit(
                  date: DateTime.parse(income['date']),
                  amount: income['amount'],
                  source: income['source'],
                  frequency: income['frequency'],
                ))
            .toList(),
        recurringPayments: (data['recurringPayments'] as List)
            .map((payment) => RecurringPayment(
                  type: payment['type'],
                  amount: payment['amount'],
                  recipient: payment['recipient'],
                  frequency: payment['frequency'],
                  lastPayment: DateTime.parse(payment['lastPayment']),
                ))
            .toList(),
      );
      loadedBankAccountList.add(loadedBankAccount);
      print('Fetched Bank Account data for account ID: ${data['accountId']}');
    });
  }
}
