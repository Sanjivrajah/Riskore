// This is a dummy data for user that can be as an input to the models
// Class of userdata
class UserData {
  final String userId;
  final String fullName;
  final int age;
  final String gender;
  final String employmentStatus;
  final String occupation;
  final double monthlyIncome;
  final String educationLevel;
  final String residentialStatus;
  final String maritalStatus;
  final int employmentDuration;
  final String industry;
  List<String> hobbies;
  final int numOfAccounts;
  final double totalAccountBalance;
  final double avgDailyBalance;
  final double totalMonthlyInflow;
  final double totalMonthlyOutflow;
  final int numWallets;
  final double totalWalletBalance;
  final double avgWalletTransaction;
  final int numUtilityBills;
  final double avgUtilityAmount;
  final int overdueBills;
  final double rentAmount;
  final String rentStatus;
  final double monthlyPlanCost;
  final int creditScore;

  UserData({
    required this.userId,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.employmentStatus,
    required this.occupation,
    required this.monthlyIncome,
    required this.educationLevel,
    required this.residentialStatus,
    required this.maritalStatus,
    required this.employmentDuration,
    required this.industry,
    required this.hobbies,
    required this.numOfAccounts,
    required this.totalAccountBalance,
    required this.avgDailyBalance,
    required this.totalMonthlyInflow,
    required this.totalMonthlyOutflow,
    required this.numWallets,
    required this.totalWalletBalance,
    required this.avgWalletTransaction,
    required this.numUtilityBills,
    required this.avgUtilityAmount,
    required this.overdueBills,
    required this.rentAmount,
    required this.rentStatus,
    required this.monthlyPlanCost,
    required this.creditScore,
  });
}
