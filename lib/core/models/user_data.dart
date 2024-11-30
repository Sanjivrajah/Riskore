// Class of userdata
class UserData {
  String userId; 
  DateTime birthdate; 
  String place; 
  List<String> connectedEWallets; 

  UserData({
    required this.userId,
    required this.birthdate,
    required this.place,
    required this.connectedEWallets,
  });

  // Method to convert UserData to a Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'birthdate': birthdate.toIso8601String(),
      'place': place,
      'connectedEWallets': connectedEWallets,
    };
  }

  // Factory method to create UserData from a Map (for Firebase retrieval)
  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      userId: map['userId'],
      birthdate: DateTime.parse(map['birthdate']),
      place: map['place'],
      connectedEWallets: List<String>.from(map['connectedEWallets']),
    );
  }
}
