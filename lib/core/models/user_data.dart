// Class of userdata
class UserData {
  String userId; 
  DateTime birthdate; 
  
  List<String> accountsConnected; 
  String employment_status;
  String occupations;
  double monthly_income;
  List<String> hobbies; 

  UserData({
    required this.userId,
    required this.birthdate,
    
    required this.accountsConnected,
    required this.employment_status, 
    required this.occupations,
    required this.monthly_income, 
    required this.hobbies
  });

}

