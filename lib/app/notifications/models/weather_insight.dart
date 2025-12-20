/// Intelligent weather insights for notifications
class WeatherInsight {
  final InsightType type;
  final String titleKey; // Translation key for title
  final String messageKey; // Translation key for message
  final Map<String, dynamic> parameters; // Parameters for translation
  final InsightPriority priority;
  final DateTime validUntil;
  final List<String> actionKeys; // Translation keys for actions
  final String? iconPath;

  const WeatherInsight({
    required this.type,
    required this.titleKey,
    required this.messageKey,
    this.parameters = const {},
    required this.priority,
    required this.validUntil,
    this.actionKeys = const [],
    this.iconPath,
  });

  /// Check if this insight is still valid
  bool get isValid => DateTime.now().isBefore(validUntil);

  /// Get notification ID for this insight
  int get notificationId => type.index * 1000 + titleKey.hashCode % 1000;
}

enum InsightType {
  // Weather alerts
  severeWeatherWarning,
  temperatureAlert,
  precipitationAlert,
  windAlert,
  uvAlert,
  
  // Activity recommendations
  outdoorActivityRecommendation,
  indoorActivitySuggestion,
  commuteAdvice,
  clothingRecommendation,
  
  // Health and safety
  healthWarning,
  airQualityAlert,
  allergyAlert,
  sunProtectionReminder,
  
  // Trends and comparisons
  temperatureTrend,
  weatherComparison,
  seasonalInsight,
  historicalComparison,
  
  // Location-based
  travelWeatherUpdate,
  locationWeatherChange,
  nearbyWeatherAlert,
}

enum InsightPriority {
  low,      // Nice to know
  medium,   // Useful information
  high,     // Important for planning
  critical, // Safety-related, immediate action needed
}

/// Template for creating localized notifications
class NotificationTemplate {
  final String titleKey;
  final String messageKey;
  final List<String> requiredParameters;
  final InsightPriority defaultPriority;
  final String? defaultIcon;

  const NotificationTemplate({
    required this.titleKey,
    required this.messageKey,
    this.requiredParameters = const [],
    this.defaultPriority = InsightPriority.medium,
    this.defaultIcon,
  });

  /// Create insight from template with parameters
  WeatherInsight createInsight({
    required InsightType type,
    required Map<String, dynamic> parameters,
    InsightPriority? priority,
    DateTime? validUntil,
    List<String> actionKeys = const [],
    String? iconPath,
  }) {
    return WeatherInsight(
      type: type,
      titleKey: titleKey,
      messageKey: messageKey,
      parameters: parameters,
      priority: priority ?? defaultPriority,
      validUntil: validUntil ?? DateTime.now().add(const Duration(hours: 6)),
      actionKeys: actionKeys,
      iconPath: iconPath ?? defaultIcon,
    );
  }
}

/// Pre-defined notification templates for common scenarios
class NotificationTemplates {
  // Severe weather templates
  static const severeWeatherWarning = NotificationTemplate(
    titleKey: 'notification_severe_weather_title',
    messageKey: 'notification_severe_weather_message',
    requiredParameters: ['weatherType', 'timeUntil'],
    defaultPriority: InsightPriority.critical,
    defaultIcon: 'warning',
  );

  static const rainAlert = NotificationTemplate(
    titleKey: 'notification_rain_alert_title',
    messageKey: 'notification_rain_alert_message',
    requiredParameters: ['intensity', 'startTime'],
    defaultPriority: InsightPriority.high,
    defaultIcon: 'rain',
  );

  // Activity recommendations
  static const outdoorActivity = NotificationTemplate(
    titleKey: 'notification_outdoor_activity_title',
    messageKey: 'notification_outdoor_activity_message',
    requiredParameters: ['activity', 'temperature', 'conditions'],
    defaultPriority: InsightPriority.medium,
    defaultIcon: 'sunny',
  );

  static const commuteAdvice = NotificationTemplate(
    titleKey: 'notification_commute_advice_title',
    messageKey: 'notification_commute_advice_message',
    requiredParameters: ['advice', 'weatherCondition'],
    defaultPriority: InsightPriority.high,
    defaultIcon: 'commute',
  );

  // Health and safety
  static const uvWarning = NotificationTemplate(
    titleKey: 'notification_uv_warning_title',
    messageKey: 'notification_uv_warning_message',
    requiredParameters: ['uvIndex', 'recommendation'],
    defaultPriority: InsightPriority.medium,
    defaultIcon: 'uv',
  );

  static const temperatureExtreme = NotificationTemplate(
    titleKey: 'notification_temperature_extreme_title',
    messageKey: 'notification_temperature_extreme_message',
    requiredParameters: ['temperature', 'extremeType', 'advice'],
    defaultPriority: InsightPriority.high,
    defaultIcon: 'temperature',
  );

  // Trends and insights
  static const weatherTrend = NotificationTemplate(
    titleKey: 'notification_weather_trend_title',
    messageKey: 'notification_weather_trend_message',
    requiredParameters: ['trendType', 'change', 'timeframe'],
    defaultPriority: InsightPriority.low,
    defaultIcon: 'trend',
  );

  static const seasonalComparison = NotificationTemplate(
    titleKey: 'notification_seasonal_comparison_title',
    messageKey: 'notification_seasonal_comparison_message',
    requiredParameters: ['comparison', 'difference', 'season'],
    defaultPriority: InsightPriority.low,
    defaultIcon: 'calendar',
  );
}