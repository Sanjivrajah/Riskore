class UserModel {
  final List<String> accountsConnected;
  final double avgDailyBalance;
  final double avgUtilityAmount;
  final double avgWalletTransaction;
  final String birthDate;
  final int creditScore;
  final String email;
  final String employmentStatus;
  final List<String> hobbies;
  final String id;
  final double monthlyPlanCost;
  final double monthlyIncome;
  final String name;
  final int numUtilityBills;
  final int numWallets;
  final String occupations;
  // Additional fields
  final int overdueBills;
  final double rentAmount;
  final String rentStatus;
  final double totalMonthlyInflow;
  final double totalMonthlyOutflow;
  final double totalWalletBalance;

  UserModel({
    required this.accountsConnected,
    required this.avgDailyBalance,
    required this.avgUtilityAmount,
    required this.avgWalletTransaction,
    required this.birthDate,
    required this.creditScore,
    required this.email,
    required this.employmentStatus,
    required this.hobbies,
    required this.id,
    required this.monthlyPlanCost,
    required this.monthlyIncome,
    required this.name,
    required this.numUtilityBills,
    required this.numWallets,
    required this.occupations,
    required this.overdueBills,
    required this.rentAmount,
    required this.rentStatus,
    required this.totalMonthlyInflow,
    required this.totalMonthlyOutflow,
    required this.totalWalletBalance,
  });
}
