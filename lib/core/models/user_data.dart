// Class of userdata
class UserData {
  String userId; 
  DateTime birthdate; 
  String place; 
  List<String> connectedEWallets; 
  String employment_status;
  String occupations;
  double monthly_income;
  List<String> hobbies; 

  UserData({
    required this.userId,
    required this.birthdate,
    required this.place,
    required this.connectedEWallets,
    required this.employment_status, 
    required this.occupations,
    required this.monthly_income, 
    required this.hobbies
  });

  // Method to convert UserData to a Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'birthdate': birthdate.toIso8601String(),
      'place': place,
      'connectedEWallets': connectedEWallets,
      'employment_status':employment_status,
      'occupations': occupations,
      'monthly_income': monthly_income,
      'hobbies': hobbies
    };
  }

  // Factory method to create UserData from a Map (for Firebase retrieval)
  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      userId: map['userId'],
      birthdate: DateTime.parse(map['birthdate']),
      place: map['place'],
      connectedEWallets: List<String>.from(map['connectedEWallets']),
      employment_status: map['employment_status'],
      occupations: map['occupations'],
      monthly_income: map['monthly_income'],
      hobbies: List<String>.from(map['hobbies']),
    );
  }
}

