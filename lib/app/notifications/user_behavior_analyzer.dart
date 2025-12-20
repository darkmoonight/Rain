import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:isar_community/isar.dart';
import 'package:rain/app/data/db.dart';
import 'package:rain/app/notifications/models/notification_context.dart';
import 'package:rain/app/notifications/models/weather_insight.dart';
import 'package:rain/main.dart';

/// Analyzes user behavior to personalize notifications
class UserBehaviorAnalyzer {
  /// Get current user behavior data
  Future<UserBehaviorData> getUserBehaviorData() async {
    try {
      final behaviorRecord = isar.userBehaviorRecords.where().findFirstSync();
      
      if (behaviorRecord == null) {
        // Return default behavior data for new users
        return UserBehaviorData(
          lastNotificationTime: DateTime.now().subtract(const Duration(hours: 24)),
        );
      }

      // Deserialize JSON maps
      Map<String, int> locationCheckFrequency = {};
      try {
        locationCheckFrequency = Map<String, int>.from(
          jsonDecode(behaviorRecord.locationCheckFrequencyJson)
        );
      } catch (e) {
        locationCheckFrequency = {};
      }

      return UserBehaviorData(
        activeHours: behaviorRecord.activeHours,
        locationCheckFrequency: locationCheckFrequency,
        interestedConditions: behaviorRecord.interestedConditions
            .map((index) => WeatherCondition.values[index])
            .toList(),
        preferredFrequency: NotificationFrequency.values[behaviorRecord.preferredFrequencyIndex],
        lastNotificationTime: behaviorRecord.lastNotificationTime,
        notificationInteractionCount: behaviorRecord.notificationInteractionCount,
        quietHours: behaviorRecord.quietHours,
      );
    } catch (e) {
      if (kDebugMode) {
        print('UserBehaviorAnalyzer Error getting behavior data: $e');
      }
      return UserBehaviorData(
        lastNotificationTime: DateTime.now().subtract(const Duration(hours: 24)),
      );
    }
  }

  /// Record that notifications were scheduled
  Future<void> recordNotificationScheduled({
    required List<WeatherInsight> insights,
    required NotificationContext context,
  }) async {
    try {
      final behaviorRecord = await _getOrCreateBehaviorRecord();
      
      // Update last notification time
      behaviorRecord.lastNotificationTime = DateTime.now();
      
      // Track notification types sent
      for (final insight in insights) {
        final typeIndex = insight.type.index;
        behaviorRecord.notificationTypesSent[typeIndex] = 
            (behaviorRecord.notificationTypesSent[typeIndex] ?? 0) + 1;
      }

      // Update active hours based on when user receives notifications
      final currentHour = DateTime.now().hour;
      if (!behaviorRecord.activeHours.contains(currentHour)) {
        behaviorRecord.activeHours.add(currentHour);
        // Keep only recent active hours (last 30 entries)
        if (behaviorRecord.activeHours.length > 30) {
          behaviorRecord.activeHours.removeAt(0);
        }
      }

      await _saveBehaviorRecord(behaviorRecord);
      
      if (kDebugMode) {
        print('UserBehaviorAnalyzer: Recorded ${insights.length} notifications scheduled');
      }
    } catch (e) {
      if (kDebugMode) {
        print('UserBehaviorAnalyzer Error recording notification: $e');
      }
    }
  }

  /// Record user interaction with notification
  Future<void> recordNotificationInteraction({
    required WeatherInsight insight,
    required String interactionType,
    required DateTime timestamp,
  }) async {
    try {
      final behaviorRecord = await _getOrCreateBehaviorRecord();
      
      // Increment interaction count
      behaviorRecord.notificationInteractionCount++;
      
      // Track interaction by type
      final typeIndex = insight.type.index;
      behaviorRecord.notificationInteractions[typeIndex] = 
          (behaviorRecord.notificationInteractions[typeIndex] ?? 0) + 1;

      // Learn from positive interactions (opened, action taken)
      if (interactionType == 'opened' || interactionType == 'actionTaken') {
        _learnFromPositiveInteraction(behaviorRecord, insight, timestamp);
      }

      await _saveBehaviorRecord(behaviorRecord);
      
      if (kDebugMode) {
        print('UserBehaviorAnalyzer: Recorded $interactionType interaction for ${insight.type.name}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('UserBehaviorAnalyzer Error recording interaction: $e');
      }
    }
  }

  /// Record when user checks weather for a location
  Future<void> recordLocationCheck(String locationKey) async {
    try {
      final behaviorRecord = await _getOrCreateBehaviorRecord();
      
      // Update the ignored map and serialize to JSON
      behaviorRecord.locationCheckFrequency[locationKey] = 
          (behaviorRecord.locationCheckFrequency[locationKey] ?? 0) + 1;
      behaviorRecord.locationCheckFrequencyJson = jsonEncode(behaviorRecord.locationCheckFrequency);

      await _saveBehaviorRecord(behaviorRecord);
    } catch (e) {
      if (kDebugMode) {
        print('UserBehaviorAnalyzer Error recording location check: $e');
      }
    }
  }

  /// Update user notification preferences
  Future<void> updateUserPreferences({
    NotificationFrequency? frequency,
    List<NotificationType>? enabledTypes,
    List<int>? quietHours,
  }) async {
    try {
      final behaviorRecord = await _getOrCreateBehaviorRecord();
      
      if (frequency != null) {
        behaviorRecord.preferredFrequencyIndex = frequency.index;
      }
      
      if (enabledTypes != null) {
        behaviorRecord.enabledNotificationTypes = enabledTypes.map((t) => t.index).toList();
      }
      
      if (quietHours != null) {
        behaviorRecord.quietHours = quietHours;
      }

      await _saveBehaviorRecord(behaviorRecord);
      
      if (kDebugMode) {
        print('UserBehaviorAnalyzer: Updated user preferences');
      }
    } catch (e) {
      if (kDebugMode) {
        print('UserBehaviorAnalyzer Error updating preferences: $e');
      }
    }
  }

  /// Get notification statistics
  Future<Map<String, dynamic>> getNotificationStatistics() async {
    try {
      final behaviorRecord = await _getOrCreateBehaviorRecord();
      
      final totalSent = behaviorRecord.notificationTypesSent.values
          .fold<int>(0, (sum, count) => sum + count);
      final totalInteractions = behaviorRecord.notificationInteractions.values
          .fold<int>(0, (sum, count) => sum + count);
      
      return {
        'totalNotificationsSent': totalSent,
        'totalInteractions': totalInteractions,
        'interactionRate': totalSent > 0 ? totalInteractions / totalSent : 0.0,
        'activeHours': behaviorRecord.activeHours,
        'preferredFrequency': NotificationFrequency.values[behaviorRecord.preferredFrequencyIndex].name,
        'mostInteractedTypes': _getMostInteractedTypes(behaviorRecord),
      };
    } catch (e) {
      if (kDebugMode) {
        print('UserBehaviorAnalyzer Error getting statistics: $e');
      }
      return {};
    }
  }

  /// Learn from positive user interactions
  void _learnFromPositiveInteraction(
    UserBehaviorRecord behaviorRecord,
    WeatherInsight insight,
    DateTime timestamp,
  ) {
    // Learn preferred notification times
    final hour = timestamp.hour;
    if (!behaviorRecord.preferredNotificationHours.contains(hour)) {
      behaviorRecord.preferredNotificationHours.add(hour);
    }

    // Learn weather conditions of interest
    final conditionIndex = _getWeatherConditionFromInsight(insight);
    if (conditionIndex != -1 && !behaviorRecord.interestedConditions.contains(conditionIndex)) {
      behaviorRecord.interestedConditions.add(conditionIndex);
    }
  }

  /// Get weather condition index from insight type
  int _getWeatherConditionFromInsight(WeatherInsight insight) {
    switch (insight.type) {
      case InsightType.precipitationAlert:
        return WeatherCondition.rainy.index;
      case InsightType.temperatureAlert:
        // Would need to check parameters to determine hot vs cold
        return WeatherCondition.hot.index;
      case InsightType.windAlert:
        return WeatherCondition.windy.index;
      case InsightType.outdoorActivityRecommendation:
        return WeatherCondition.sunny.index;
      default:
        return -1;
    }
  }

  /// Get most interacted notification types
  List<String> _getMostInteractedTypes(UserBehaviorRecord behaviorRecord) {
    final interactions = behaviorRecord.notificationInteractions.entries.toList();
    interactions.sort((a, b) => b.value.compareTo(a.value));
    
    return interactions.take(3).map((entry) {
      if (entry.key < InsightType.values.length) {
        return InsightType.values[entry.key].name;
      }
      return 'unknown';
    }).toList();
  }

  /// Get or create user behavior record
  Future<UserBehaviorRecord> _getOrCreateBehaviorRecord() async {
    var behaviorRecord = isar.userBehaviorRecords.where().findFirstSync();
    
    if (behaviorRecord == null) {
      behaviorRecord = UserBehaviorRecord()
        ..activeHours = [7, 8, 9, 12, 13, 17, 18, 19, 20] // Default active hours
        ..locationCheckFrequency = {}
        ..locationCheckFrequencyJson = '{}'
        ..interestedConditions = []
        ..preferredFrequencyIndex = NotificationFrequency.moderate.index
        ..lastNotificationTime = DateTime.now().subtract(const Duration(hours: 24))
        ..notificationInteractionCount = 0
        ..notificationTypesSent = {}
        ..notificationTypesSentJson = '{}'
        ..notificationInteractions = {}
        ..notificationInteractionsJson = '{}'
        ..enabledNotificationTypes = NotificationType.values.map((t) => t.index).toList()
        ..quietHours = [22, 23, 0, 1, 2, 3, 4, 5, 6] // Default quiet hours
        ..preferredNotificationHours = [];
    } else {
      // Deserialize JSON maps
      try {
        behaviorRecord.locationCheckFrequency = Map<String, int>.from(
          jsonDecode(behaviorRecord.locationCheckFrequencyJson)
        );
      } catch (e) {
        behaviorRecord.locationCheckFrequency = {};
      }
      
      try {
        behaviorRecord.notificationTypesSent = Map<int, int>.from(
          jsonDecode(behaviorRecord.notificationTypesSentJson)
        );
      } catch (e) {
        behaviorRecord.notificationTypesSent = {};
      }
      
      try {
        behaviorRecord.notificationInteractions = Map<int, int>.from(
          jsonDecode(behaviorRecord.notificationInteractionsJson)
        );
      } catch (e) {
        behaviorRecord.notificationInteractions = {};
      }
    }
    
    return behaviorRecord;
  }

  /// Save behavior record to database
  Future<void> _saveBehaviorRecord(UserBehaviorRecord behaviorRecord) async {
    // Serialize maps to JSON before saving
    behaviorRecord.locationCheckFrequencyJson = jsonEncode(behaviorRecord.locationCheckFrequency);
    behaviorRecord.notificationTypesSentJson = jsonEncode(behaviorRecord.notificationTypesSent);
    behaviorRecord.notificationInteractionsJson = jsonEncode(behaviorRecord.notificationInteractions);
    
    isar.writeTxnSync(() {
      isar.userBehaviorRecords.putSync(behaviorRecord);
    });
  }
}