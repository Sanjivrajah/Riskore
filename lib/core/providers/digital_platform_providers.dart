import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/digital_platform_activity_model.dart'; // Import your DigitalPlatformActivity model

class DigitalPlatformActivityProvider with ChangeNotifier {
  List<String> activityIdList = [];
  List<DigitalPlatformActivity> loadedActivities = [];

  // Function to create a new digital platform activity entry
  Future<void> createDigitalPlatformActivity(DigitalPlatformActivity activity) async {
    await FirebaseFirestore.instance.collection('digital_platform_activities').doc().set({
      "userId": activity.userId,
      "onlineShopping": {
        "preferredPlatforms": activity.onlineShopping.preferredPlatforms,
        "monthlyTransactions": activity.onlineShopping.monthlyTransactions,
        "averageBasketSize": activity.onlineShopping.averageBasketSize,
        "categoryPreferences": activity.onlineShopping.categoryPreferences,
      },
      "subscriptionServices": activity.subscriptionServices.map((service) => {
        "serviceName": service.serviceName,
        "monthlyCost": service.monthlyCost,
        "billingDate": service.billingDate.toIso8601String(),
        "paymentStatus": service.paymentStatus,
      }).toList(),
    });
  }

  // Function to fetch all digital platform activity IDs
  Future<void> fetchActivityIds() async {
    try {
      await FirebaseFirestore.instance
          .collection('digital_platform_activities')
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((activity) {
          activityIdList.add(activity.reference.id);
        });
      });
      print('Success! fetched Digital Platform Activity Id List: ${activityIdList}');
    } catch (e) {
      print(e.toString());
    }
  }

  // Function to fetch all digital platform activities
  Future<void> fetchAllActivities() async {
    for (int i = 0; i < activityIdList.length; i++) {
      await fetchActivityDataFromId(activityIdList[i]);
    }
    print('All Digital Platform Activities fetched');
  }

  // Function to fetch digital platform activity data by ID
  Future<void> fetchActivityDataFromId(String activityId) async {
    await FirebaseFirestore.instance
        .collection('digital_platform_activities')
        .doc(activityId)
        .get()
        .then((snapshot) {
      final data = snapshot.data()!;
      DigitalPlatformActivity loadedActivity = DigitalPlatformActivity(
        userId: data['userId'],
        onlineShopping: OnlineShopping(
          preferredPlatforms: List<String>.from(data['onlineShopping']['preferredPlatforms']),
          monthlyTransactions: data['onlineShopping']['monthlyTransactions'],
          averageBasketSize: data['onlineShopping']['averageBasketSize'],
          categoryPreferences: List<String>.from(data['onlineShopping']['categoryPreferences']),
        ),
        subscriptionServices: (data['subscriptionServices'] as List).map((service) => SubscriptionService(
          serviceName: service['serviceName'],
          monthlyCost: service['monthlyCost'],
          billingDate: DateTime.parse(service['billingDate']),
          paymentStatus: service['paymentStatus'],
        )).toList(),
      );
      loadedActivities.add(loadedActivity);
      print('Fetched Digital Platform Activity for user ID: ${data['userId']}');
    });
  }
}
