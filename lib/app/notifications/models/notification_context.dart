import 'package:rain/app/data/db.dart';

/// Context information for intelligent notification decisions
class NotificationContext {
  final LocationCache location;
  final MainWeatherCache currentWeather;
  final DateTime currentTime;
  final UserBehaviorData userBehavior;
  final List<WeatherCard> userLocations;
  final String selectedLanguage;

  const NotificationContext({
    required this.location,
    required this.currentWeather,
    required this.currentTime,
    required this.userBehavior,
    required this.userLocations,
    required this.selectedLanguage,
  });

  /// Check if it's a good time to send notifications
  bool get isGoodTimeForNotification {
    final hour = currentTime.hour;
    
    // Avoid late night/early morning unless severe weather
    if (hour >= 22 || hour <= 6) return false;
    
    // Consider user's typical active hours
    if (userBehavior.activeHours.isNotEmpty) {
      return userBehavior.activeHours.contains(hour);
    }
    
    return true;
  }

  /// Get user's preferred notification frequency
  NotificationFrequency get preferredFrequency {
    return userBehavior.preferredFrequency;
  }
}

/// User behavior patterns for personalization
class UserBehaviorData {
  final List<int> activeHours; // Hours when user is typically active
  final Map<String, int> locationCheckFrequency; // How often user checks each location
  final List<WeatherCondition> interestedConditions; // Weather conditions user cares about
  final NotificationFrequency preferredFrequency;
  final DateTime lastNotificationTime;
  final int notificationInteractionCount; // How often user interacts with notifications
  final List<int> quietHours; // Hours when user doesn't want notifications

  const UserBehaviorData({
    this.activeHours = const [7, 8, 9, 12, 13, 17, 18, 19, 20], // Default active hours
    this.locationCheckFrequency = const {},
    this.interestedConditions = const [],
    this.preferredFrequency = NotificationFrequency.moderate,
    required this.lastNotificationTime,
    this.notificationInteractionCount = 0,
    this.quietHours = const [22, 23, 0, 1, 2, 3, 4, 5, 6], // Default quiet hours
  });

  /// Check if enough time has passed since last notification
  bool canSendNotification(NotificationFrequency frequency) {
    final now = DateTime.now();
    final timeSinceLastNotification = now.difference(lastNotificationTime);
    
    switch (frequency) {
      case NotificationFrequency.minimal:
        return timeSinceLastNotification.inHours >= 6;
      case NotificationFrequency.moderate:
        return timeSinceLastNotification.inHours >= 3;
      case NotificationFrequency.frequent:
        return timeSinceLastNotification.inHours >= 1;
      case NotificationFrequency.realtime:
        return timeSinceLastNotification.inMinutes >= 30;
    }
  }
}

enum NotificationFrequency {
  minimal,    // 1-2 per day
  moderate,   // 3-4 per day  
  frequent,   // 6-8 per day
  realtime,   // As needed for severe weather
}

enum WeatherCondition {
  sunny,
  cloudy,
  rainy,
  stormy,
  snowy,
  foggy,
  windy,
  hot,
  cold,
}

enum NotificationType {
  dailyForecast,
  severeWeather,
  activityRecommendation,
  commuteAlert,
  healthWarning,
  trendAlert,
  locationUpdate,
}