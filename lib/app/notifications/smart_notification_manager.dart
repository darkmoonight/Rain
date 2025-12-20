import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/data/db.dart';
import 'package:rain/app/notifications/models/notification_context.dart';
import 'package:rain/app/notifications/models/weather_insight.dart';
import 'package:rain/app/notifications/notification_intelligence.dart';
import 'package:rain/app/notifications/user_behavior_analyzer.dart';
import 'package:rain/app/notifications/weather_insight_generator.dart';
import 'package:rain/app/notifications/multilingual_notification_builder.dart';
import 'package:rain/app/notifications/notification_scheduler.dart';
import 'package:rain/app/utils/notification.dart';
import 'package:rain/main.dart';

/// Smart notification manager that orchestrates intelligent weather notifications
class SmartNotificationManager {
  static final SmartNotificationManager _instance = SmartNotificationManager._internal();
  factory SmartNotificationManager() => _instance;
  SmartNotificationManager._internal();

  final NotificationIntelligence _intelligence = NotificationIntelligence();
  final UserBehaviorAnalyzer _behaviorAnalyzer = UserBehaviorAnalyzer();
  final WeatherInsightGenerator _insightGenerator = WeatherInsightGenerator();
  final MultilingualNotificationBuilder _notificationBuilder = MultilingualNotificationBuilder();
  final NotificationScheduler _scheduler = NotificationScheduler();
  final NotificationShow _basicNotification = NotificationShow();

  /// Schedule intelligent notifications based on weather data and user context
  Future<void> scheduleIntelligentNotifications({
    required MainWeatherCache weatherData,
    required LocationCache location,
    List<WeatherCard> userLocations = const [],
    bool quickTest = false, // Add quick test mode
  }) async {
    try {
      // Create notification context
      final context = await _createNotificationContext(
        weatherData: weatherData,
        location: location,
        userLocations: userLocations,
      );

      // Check if we should send notifications (skip check for quick test)
      if (!quickTest && !_shouldSendNotifications(context)) {
        if (kDebugMode) {
          print('SmartNotificationManager: Skipping notifications - not optimal time');
        }
        return;
      }

      // Generate weather insights
      final insights = await _insightGenerator.generateInsights(
        weatherData: weatherData,
        location: location,
        context: context,
      );

      // Filter and prioritize insights
      final prioritizedInsights = _intelligence.prioritizeInsights(
        insights: insights,
        context: context,
      );

      // Schedule notifications for high-priority insights
      await _scheduleInsightNotifications(
        insights: prioritizedInsights,
        context: context,
        quickTest: quickTest,
      );

      // Update user behavior data
      await _behaviorAnalyzer.recordNotificationScheduled(
        insights: prioritizedInsights,
        context: context,
      );

      if (kDebugMode) {
        print('SmartNotificationManager: Scheduled ${prioritizedInsights.length} intelligent notifications');
        if (quickTest) {
          print('🚀 Quick Test Mode: Notifications will appear within 1 minute!');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('SmartNotificationManager Error: $e');
      }
      // Fallback to basic notifications
      await _fallbackToBasicNotifications(weatherData, location);
    }
  }

  /// Create notification context from current data
  Future<NotificationContext> _createNotificationContext({
    required MainWeatherCache weatherData,
    required LocationCache location,
    List<WeatherCard> userLocations = const [],
  }) async {
    final userBehavior = await _behaviorAnalyzer.getUserBehaviorData();
    
    return NotificationContext(
      location: location,
      currentWeather: weatherData,
      currentTime: DateTime.now(),
      userBehavior: userBehavior,
      userLocations: userLocations,
      selectedLanguage: Get.locale?.languageCode ?? 'en',
    );
  }

  /// Check if it's appropriate to send notifications
  bool _shouldSendNotifications(NotificationContext context) {
    // Check if notifications are enabled
    if (!settings.notifications) return false;

    // Check if it's a good time for notifications
    if (!context.isGoodTimeForNotification) return false;

    // Check frequency limits
    if (!context.userBehavior.canSendNotification(context.preferredFrequency)) {
      return false;
    }

    return true;
  }

  /// Schedule notifications for prioritized insights
  Future<void> _scheduleInsightNotifications({
    required List<WeatherInsight> insights,
    required NotificationContext context,
    bool quickTest = false,
  }) async {
    for (final insight in insights) {
      if (!insight.isValid) continue;

      // Build localized notification content
      final notificationContent = await _notificationBuilder.buildNotification(
        insight: insight,
        languageCode: context.selectedLanguage,
        location: context.location,
      );

      // Calculate optimal notification time
      final scheduledTime = _scheduler.calculateOptimalTime(
        insight: insight,
        context: context,
        quickTest: quickTest,
      );

      // Schedule the notification
      await _basicNotification.showNotification(
        insight.notificationId,
        notificationContent.title,
        notificationContent.body,
        scheduledTime,
        notificationContent.iconPath,
      );

      if (kDebugMode) {
        print('Scheduled notification: ${notificationContent.title} at $scheduledTime');
        if (quickTest) {
          final timeUntil = scheduledTime.difference(DateTime.now());
          print('⏰ Quick Test: Notification will appear in ${timeUntil.inSeconds} seconds');
        }
      }
    }
  }

  /// Fallback to basic notifications if smart system fails
  Future<void> _fallbackToBasicNotifications(
    MainWeatherCache weatherData,
    LocationCache location,
  ) async {
    if (kDebugMode) {
      print('SmartNotificationManager: Falling back to basic notifications');
    }
    
    // Use the existing notification logic from WeatherController
    final controller = Get.find<WeatherController>();
    controller.notification(weatherData);
  }

  /// Cancel all scheduled smart notifications
  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
    if (kDebugMode) {
      print('SmartNotificationManager: Cancelled all notifications');
    }
  }

  /// Update notification preferences
  Future<void> updateNotificationPreferences({
    NotificationFrequency? frequency,
    List<NotificationType>? enabledTypes,
    List<int>? quietHours,
  }) async {
    await _behaviorAnalyzer.updateUserPreferences(
      frequency: frequency,
      enabledTypes: enabledTypes,
      quietHours: quietHours,
    );
  }

  /// Get notification statistics
  Future<Map<String, dynamic>> getNotificationStats() async {
    return await _behaviorAnalyzer.getNotificationStatistics();
  }

  /// Quick test method - schedules notifications within 1 minute
  Future<void> scheduleQuickTestNotifications({
    required MainWeatherCache weatherData,
    required LocationCache location,
    List<WeatherCard> userLocations = const [],
  }) async {
    if (kDebugMode) {
      print('🚀 Starting Quick Test - Notifications will appear within 1 minute!');
    }
    
    await scheduleIntelligentNotifications(
      weatherData: weatherData,
      location: location,
      userLocations: userLocations,
      quickTest: true,
    );
  }
}

/// Notification content with localized text and icon
class NotificationContent {
  final String title;
  final String body;
  final String iconPath;
  final List<String> actions;

  const NotificationContent({
    required this.title,
    required this.body,
    required this.iconPath,
    this.actions = const [],
  });
}