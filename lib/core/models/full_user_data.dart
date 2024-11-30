// This is a dummy data for user that can be as an input to the models
// Class of userdata
class UserData {
  String userId;
  String fullName;
  int age;
  String gender;
  String employmentStatus;
  String occupation;
  double monthlyIncome;
  String educationLevel;
  String residentialStatus;
  String maritalStatus;
  int employmentDuration;
  String industry;
  List<String> hobbies;
  int numOfAccounts;
  double totalAccountBalance;
  double avgDailyBalance;
  double totalMonthlyInflow;
  double totalMonthlyOutflow;
  int numWallets;
  double totalWalletBalance;
  double avgWalletTransaction;
  int numUtilityBills;
  double avgUtilityAmount;
  int overdueBills;
  double rentAmount;
  String rentStatus;
  double monthlyPlanCost;
  int creditScore;

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
