class BankAccount {
  final String accountId;
  final String bankName;
  final String accountType;
  final double accountBalance;
  final double averageDailyBalance;
  final double monthlyInflow;
  final double monthlyOutflow;
  final List<Transaction> transactionHistory;
  final List<IncomeDeposit> incomeDeposits;
  final List<RecurringPayment> recurringPayments;

  BankAccount({
    required this.accountId,
    required this.bankName,
    required this.accountType,
    required this.accountBalance,
    required this.averageDailyBalance,
    required this.monthlyInflow,
    required this.monthlyOutflow,
    required this.transactionHistory,
    required this.incomeDeposits,
    required this.recurringPayments,
  });
}

class Transaction {
  final DateTime date;
  final double amount;
  final String type;
  final String description;
  final String category;

  Transaction({
    required this.date,
    required this.amount,
    required this.type,
    required this.description,
    required this.category,
  });
}

class IncomeDeposit {
  final DateTime date;
  final double amount;
  final String source;
  final String frequency;

  IncomeDeposit({
    required this.date,
    required this.amount,
    required this.source,
    required this.frequency,
  });
}

class RecurringPayment {
  final String type;
  final double amount;
  final String recipient;
  final String frequency;
  final DateTime lastPayment;

  RecurringPayment({
    required this.type,
    required this.amount,
    required this.recipient,
    required this.frequency,
    required this.lastPayment,
  });
}
