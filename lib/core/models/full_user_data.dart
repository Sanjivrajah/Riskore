// This is a dummy data for user that can be as an input to the models
// Class of userdata
class UserData {
  final String userId;
  final String full_name;
  final int age;
  final String gender;
  final String employment_status;
  final String occupation;
  final double monthly_income;
  final String education_level;
  final String residential_status;
  final String marital_status;
  final int employment_duration;
  final String industry;
  List<String> hobbies;
  final int num_of_accounts;
  final double total_account_balance;
  final double avg_daily_balance;
  final double total_monthly_inflow;
  final double total_monthly_outflow;
  final int num_wallets;
  final double total_wallet_balance;
  final double avg_wallet_transaction;
  final int num_utility_bills;
  final double avg_utility_amount;
  final int overdue_bills;
  final double rent_amount;
  final String rent_status;
  final double monthly_plan_cost;
  final int credit_score;

  UserData({
    required this.userId,
    required this.full_name,
    required this.age,
    required this.gender,
    required this.employment_status,
    required this.occupation,
    required this.monthly_income,
    required this.education_level,
    required this.residential_status,
    required this.marital_status,
    required this.employment_duration,
    required this.industry,
    required this.hobbies,
    required this.num_of_accounts,
    required this.total_account_balance,
    required this.avg_daily_balance,
    required this.total_monthly_inflow,
    required this.total_monthly_outflow,
    required this.num_wallets,
    required this.total_wallet_balance,
    required this.avg_wallet_transaction,
    required this.num_utility_bills,
    required this.avg_utility_amount,
    required this.overdue_bills,
    required this.rent_amount,
    required this.rent_status,
    required this.monthly_plan_cost,
    required this.credit_score,
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
