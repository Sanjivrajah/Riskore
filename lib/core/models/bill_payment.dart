class BillPayment {
  final String userId;
  final List<UtilityBill> utilityBills;
  final RentPayment rentPayments;
  final MobileBill mobileBills;
  final IncomeTax incomeTax;

  BillPayment({
    required this.userId,
    required this.utilityBills,
    required this.rentPayments,
    required this.mobileBills,
    required this.incomeTax,
  });
}

class UtilityBill {
  final String provider;
  final String accountNumber;
  final double monthlyAmount;
  final DateTime dueDate;
  final List<PaymentRecord> paymentHistory;

  UtilityBill({
    required this.provider,
    required this.accountNumber,
    required this.monthlyAmount,
    required this.dueDate,
    required this.paymentHistory,
  });
}

class PaymentRecord {
  final DateTime date;
  final double amount;
  final String status;

  PaymentRecord({
    required this.date,
    required this.amount,
    required this.status,
  });
}

class RentPayment {
  final double monthlyAmount;
  final DateTime dueDate;
  final List<PaymentRecord> paymentHistory;

  RentPayment({
    required this.monthlyAmount,
    required this.dueDate,
    required this.paymentHistory,
  });
}

class MobileBill {
  final String provider;
  final String planDetails;
  final List<PaymentRecord> paymentHistory;

  MobileBill({
    required this.provider,
    required this.planDetails,
    required this.paymentHistory,
  });
}

class IncomeTax {
  final int year;
  final double amount;
  final String status;

  IncomeTax({
    required this.year,
    required this.amount,
    required this.status,
  });
}
