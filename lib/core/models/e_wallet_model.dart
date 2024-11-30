class EWallet {
  final String walletId;
  final String provider;
  final double currentBalance;
  final List<WalletTransaction> transactionHistory;
  final UsageMetrics usageMetrics;

  EWallet({
    required this.walletId,
    required this.provider,
    required this.currentBalance,
    required this.transactionHistory,
    required this.usageMetrics,
  });
}

class WalletTransaction {
  final DateTime date;
  final double amount;
  final String type;
  final String merchant;

  WalletTransaction({
    required this.date,
    required this.amount,
    required this.type,
    required this.merchant,
  });
}

class UsageMetrics {
  final int frequencyOfUse;
  final double averageTransaction;
  final int monthlyTransactions;
  final Map<String, int> transactionTypes;

  UsageMetrics({
    required this.frequencyOfUse,
    required this.averageTransaction,
    required this.monthlyTransactions,
    required this.transactionTypes,
  });
}
