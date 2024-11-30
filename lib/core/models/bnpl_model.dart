class BNPL {
  final String providerId;
  final String providerName;
  final String accountStatus;
  final double creditLimit;
  final double availableCredit;
  final List<PaymentHistory> paymentHistory;
  final List<ActiveInstallment> activeInstallments;
  final BNPLMetrics metrics;

  BNPL({
    required this.providerId,
    required this.providerName,
    required this.accountStatus,
    required this.creditLimit,
    required this.availableCredit,
    required this.paymentHistory,
    required this.activeInstallments,
    required this.metrics,
  });
}

class PaymentHistory {
  final DateTime purchaseDate;
  final String merchant;
  final double originalAmount;
  final double installmentAmount;
  final int remainingInstallments;
  final DateTime dueDate;
  final String paymentStatus;

  PaymentHistory({
    required this.purchaseDate,
    required this.merchant,
    required this.originalAmount,
    required this.installmentAmount,
    required this.remainingInstallments,
    required this.dueDate,
    required this.paymentStatus,
  });
}

class ActiveInstallment {
  final String purchaseDetails;
  final double totalAmount;
  final double monthlyInstallment;
  final double remainingBalance;
  final DateTime nextPaymentDate;
  final String installmentTerm;

  ActiveInstallment({
    required this.purchaseDetails,
    required this.totalAmount,
    required this.monthlyInstallment,
    required this.remainingBalance,
    required this.nextPaymentDate,
    required this.installmentTerm,
  });
}

class BNPLMetrics {
  final double totalCreditUtilized;
  final double paymentConsistencyScore;
  final int latePaymentCount;
  final double averageTransactionValue;
  final double repaymentRatio;

  BNPLMetrics({
    required this.totalCreditUtilized,
    required this.paymentConsistencyScore,
    required this.latePaymentCount,
    required this.averageTransactionValue,
    required this.repaymentRatio,
  });
}
