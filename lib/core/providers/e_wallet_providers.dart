import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/e_wallet_model.dart'; // Import your EWallet model

class EWalletProvider with ChangeNotifier {
  List<String> eWalletIdList = [];
  List<EWallet> loadedEWallets = [];

  // Function to create a new e-wallet entry
  Future<void> createEWallet(EWallet eWallet) async {
    await FirebaseFirestore.instance.collection('ewallets').doc().set({
      "walletId": eWallet.walletId,
      "provider": eWallet.provider,
      "currentBalance": eWallet.currentBalance,
      "transactionHistory": eWallet.transactionHistory
          .map((transaction) => {
                "date": transaction.date.toIso8601String(),
                "amount": transaction.amount,
                "type": transaction.type,
                "merchant": transaction.merchant,
              })
          .toList(),
      "usageMetrics": {
        "frequencyOfUse": eWallet.usageMetrics.frequencyOfUse,
        "averageTransaction": eWallet.usageMetrics.averageTransaction,
        "monthlyTransactions": eWallet.usageMetrics.monthlyTransactions,
        "transactionTypes": eWallet.usageMetrics.transactionTypes,
      },
    });
  }

  // Function to fetch all e-wallet IDs
  Future<void> fetchEWalletIds() async {
    try {
      await FirebaseFirestore.instance
          .collection('ewallets')
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((ewallet) {
          eWalletIdList.add(ewallet.reference.id);
        });
      });
      print('Success! fetched E-Wallet Id List: ${eWalletIdList}');
    } catch (e) {
      print(e.toString());
    }
  }

  // Function to fetch all e-wallet data
  Future<void> fetchAllEWalletData() async {
    for (int i = 0; i < eWalletIdList.length; i++) {
      await fetchEWalletDataFromId(eWalletIdList[i]);
    }
    print('All E-Wallet data fetched');
  }

  // Function to fetch e-wallet data by ID
  Future<void> fetchEWalletDataFromId(String walletId) async {
    await FirebaseFirestore.instance
        .collection('ewallets')
        .doc(walletId)
        .get()
        .then((snapshot) {
      final data = snapshot.data()!;
      EWallet loadedEWallet = EWallet(
        walletId: data['walletId'],
        provider: data['provider'],
        currentBalance: data['currentBalance'],
        transactionHistory: (data['transactionHistory'] as List)
            .map((transaction) => WalletTransaction(
                  date: DateTime.parse(transaction['date']),
                  amount: transaction['amount'],
                  type: transaction['type'],
                  merchant: transaction['merchant'],
                ))
            .toList(),
        usageMetrics: UsageMetrics(
          frequencyOfUse: data['usageMetrics']['frequencyOfUse'],
          averageTransaction: data['usageMetrics']['averageTransaction'],
          monthlyTransactions: data['usageMetrics']['monthlyTransactions'],
          transactionTypes:
              Map<String, int>.from(data['usageMetrics']['transactionTypes']),
        ),
      );
      loadedEWallets.add(loadedEWallet);
      print('Fetched E-Wallet data for wallet ID: ${data['walletId']}');
    });
  }
}
