class UserModel {
  // ... existing fields ...
  final int num_of_accounts;
  final double avg_daily_balance;
  final double avg_utility_amount;
  final double avg_wallet_transaction;
  final int age;
  final int credit_score;
  final String gender;
  final String employment_status;
  final String education_level;

  final String marital_status;
  final int employment_duration;
  final String industry;
  final double total_account_balance;
  final List<String> hobbies;
  final String userId;
  final double monthly_plan_cost;
  final double monthly_income;
  final String full_name;
  final int num_utility_bills;
  final int num_wallets;
  final String occupation;
  // Additional fields
  final int overdue_bills;
  final double rent_amount;
  final String rent_status;
  final String residential_status;
  final double total_monthly_inflow;
  final double total_monthly_outflow;
  final double total_wallet_balance;

  UserModel({
    required this.num_of_accounts, // Updated field name
    required this.avg_daily_balance, // Updated field name
    required this.avg_utility_amount, // Updated field name
    required this.avg_wallet_transaction, // Updated field name
    required this.age, // Updated field name
    required this.credit_score,
    required this.education_level, // Updated field name
    required this.gender,
    required this.employment_status, // Updated field name
    required this.employment_duration,
    required this.hobbies,
    required this.industry,
    required this.userId, // Updated field name
    required this.monthly_plan_cost, // Updated field name
    required this.monthly_income, // Updated field name
    required this.full_name,
    required this.marital_status, // Updated field name
    required this.num_utility_bills, // Updated field name
    required this.num_wallets, // Updated field name
    required this.occupation,
    required this.overdue_bills, // Updated field name
    required this.rent_amount, // Updated field name
    required this.rent_status,
    required this.residential_status, // Updated field name
    required this.total_account_balance,
    required this.total_monthly_inflow, // Updated field name
    required this.total_monthly_outflow, // Updated field name
    required this.total_wallet_balance, // Updated field name
  });
  // Method to convert UserData to JSON with snake_case keys
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'full_name': full_name,
      'age': age,
      'gender': gender,
      'employment_status': employment_status,
      'occupation': occupation,
      'monthly_income': monthly_income,
      'education_level': education_level,
      'residential_status': residential_status,
      'marital_status': marital_status,
      'employment_duration': employment_duration,
      'industry': industry,
      'hobbies': hobbies,
      'num_of_accounts': num_of_accounts,
      'total_account_balance': total_account_balance,
      'avg_daily_balance': avg_daily_balance,
      'total_monthly_inflow': total_monthly_inflow,
      'total_monthly_outflow': total_monthly_outflow,
      'num_wallets': num_wallets,
      'total_wallet_balance': total_wallet_balance,
      'avg_wallet_transaction': avg_wallet_transaction,
      'num_utility_bills': num_utility_bills,
      'avg_utility_amount': avg_utility_amount,
      'overdue_bills': overdue_bills,
      'rent_amount': rent_amount,
      'rent_status': rent_status,
      'monthly_plan_cost': monthly_plan_cost,
      'credit_score': credit_score,
    };
  }
}
