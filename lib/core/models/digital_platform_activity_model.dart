class DigitalPlatformActivity {
  final String userId;
  final OnlineShopping onlineShopping;
  final List<SubscriptionService> subscriptionServices;

  DigitalPlatformActivity({
    required this.userId,
    required this.onlineShopping,
    required this.subscriptionServices,
  });
}

class OnlineShopping {
  final List<String> preferredPlatforms;
  final int monthlyTransactions;
  final double averageBasketSize;
  final List<String> categoryPreferences;

  OnlineShopping({
    required this.preferredPlatforms,
    required this.monthlyTransactions,
    required this.averageBasketSize,
    required this.categoryPreferences,
  });
}

class SubscriptionService {
  final String serviceName;
  final double monthlyCost;
  final DateTime billingDate;
  final String paymentStatus;

  SubscriptionService({
    required this.serviceName,
    required this.monthlyCost,
    required this.billingDate,
    required this.paymentStatus,
  });
}
