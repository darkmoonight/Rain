import 'package:flutter/foundation.dart';
import 'package:rain/app/notifications/models/notification_context.dart';
import 'package:rain/app/notifications/models/weather_insight.dart';

/// Calculates optimal timing for notifications
class NotificationScheduler {
  /// Calculate the optimal time to send a notification
  DateTime calculateOptimalTime({
    required WeatherInsight insight,
    required NotificationContext context,
    bool quickTest = false, // Add quick test mode
  }) {
    final now = context.currentTime;
    
    // For quick testing, schedule within 1 minute
    if (quickTest) {
      return now.add(const Duration(seconds: 30)); // 30 seconds for immediate testing
    }
    
    // For critical insights, send immediately
    if (insight.priority == InsightPriority.critical) {
      return now;
    }
    
    // Calculate base delay based on insight type and priority
    Duration baseDelay = _getBaseDelay(insight);
    
    // Adjust for user behavior patterns
    Duration behaviorAdjustment = _getBehaviorAdjustment(insight, context);
    
    // Ensure we don't schedule during quiet hours
    DateTime scheduledTime = now.add(baseDelay + behaviorAdjustment);
    scheduledTime = _avoidQuietHours(scheduledTime, context);
    
    // Ensure notification is still valid when scheduled
    if (scheduledTime.isAfter(insight.validUntil)) {
      scheduledTime = insight.validUntil.subtract(const Duration(minutes: 30));
    }
    
    // Don't schedule in the past
    if (scheduledTime.isBefore(now)) {
      scheduledTime = now.add(const Duration(minutes: 1));
    }
    
    if (kDebugMode) {
      print('NotificationScheduler: Scheduled ${insight.type.name} for $scheduledTime');
    }
    
    return scheduledTime;
  }

  /// Get base delay for different insight types
  Duration _getBaseDelay(WeatherInsight insight) {
    switch (insight.type) {
      // Immediate notifications
      case InsightType.severeWeatherWarning:
      case InsightType.precipitationAlert:
        return Duration.zero;
      
      // Quick notifications (within 15 minutes)
      case InsightType.windAlert:
      case InsightType.temperatureAlert:
      case InsightType.commuteAdvice:
        return const Duration(minutes: 5);
      
      // Moderate delay (30 minutes to 1 hour)
      case InsightType.outdoorActivityRecommendation:
      case InsightType.healthWarning:
      case InsightType.uvAlert:
        return const Duration(minutes: 30);
      
      // Longer delay (1-2 hours)
      case InsightType.indoorActivitySuggestion:
      case InsightType.clothingRecommendation:
        return const Duration(hours: 1);
      
      // Low priority (2+ hours)
      case InsightType.temperatureTrend:
      case InsightType.weatherComparison:
      case InsightType.seasonalInsight:
      case InsightType.historicalComparison:
        return const Duration(hours: 2);
      
      // Location-based (moderate delay)
      case InsightType.travelWeatherUpdate:
      case InsightType.locationWeatherChange:
      case InsightType.nearbyWeatherAlert:
        return const Duration(minutes: 45);
      
      // Health-related (quick for safety)
      case InsightType.airQualityAlert:
      case InsightType.allergyAlert:
      case InsightType.sunProtectionReminder:
        return const Duration(minutes: 15);
    }
  }

  /// Adjust timing based on user behavior
  Duration _getBehaviorAdjustment(WeatherInsight insight, NotificationContext context) {
    final userBehavior = context.userBehavior;
    final currentHour = context.currentTime.hour;
    
    Duration adjustment = Duration.zero;
    
    // If user is typically active at this hour, send sooner
    if (userBehavior.activeHours.contains(currentHour)) {
      adjustment = Duration(minutes: adjustment.inMinutes - 15);
    }
    
    // If user frequently interacts with notifications, send sooner
    if (userBehavior.notificationInteractionCount > 20) {
      adjustment = Duration(minutes: adjustment.inMinutes - 10);
    }
    
    // Adjust based on preferred frequency
    switch (userBehavior.preferredFrequency) {
      case NotificationFrequency.minimal:
        adjustment = Duration(minutes: adjustment.inMinutes + 60);
        break;
      case NotificationFrequency.moderate:
        // No adjustment
        break;
      case NotificationFrequency.frequent:
        adjustment = Duration(minutes: adjustment.inMinutes - 30);
        break;
      case NotificationFrequency.realtime:
        adjustment = Duration(minutes: adjustment.inMinutes - 60);
        break;
    }
    
    // Consider time since last notification
    final timeSinceLastNotification = context.currentTime
        .difference(userBehavior.lastNotificationTime);
    
    if (timeSinceLastNotification.inMinutes < 30) {
      // Recent notification, delay this one
      adjustment = Duration(minutes: adjustment.inMinutes + 30);
    }
    
    return adjustment;
  }

  /// Avoid scheduling during user's quiet hours
  DateTime _avoidQuietHours(DateTime scheduledTime, NotificationContext context) {
    final userBehavior = context.userBehavior;
    final quietHours = userBehavior.quietHours;
    
    if (quietHours.isEmpty) {
      return scheduledTime;
    }
    
    // Check if scheduled time falls in quiet hours
    if (quietHours.contains(scheduledTime.hour)) {
      // Find the next non-quiet hour
      DateTime adjustedTime = scheduledTime;
      
      while (quietHours.contains(adjustedTime.hour)) {
        adjustedTime = adjustedTime.add(const Duration(hours: 1));
        
        // Prevent infinite loop - if we've moved more than 24 hours, break
        if (adjustedTime.difference(scheduledTime).inHours > 24) {
          break;
        }
      }
      
      // Set to the beginning of the non-quiet hour
      adjustedTime = DateTime(
        adjustedTime.year,
        adjustedTime.month,
        adjustedTime.day,
        adjustedTime.hour,
        0, // Start of hour
      );
      
      if (kDebugMode) {
        print('NotificationScheduler: Moved from quiet hour ${scheduledTime.hour} to ${adjustedTime.hour}');
      }
      
      return adjustedTime;
    }
    
    return scheduledTime;
  }

  /// Calculate optimal notification frequency for a user
  NotificationFrequency calculateOptimalFrequency(NotificationContext context) {
    final userBehavior = context.userBehavior;
    
    // Calculate interaction rate
    final totalSent = userBehavior.notificationInteractionCount > 0 ? 
        userBehavior.notificationInteractionCount * 2 : 10; // Estimate
    final interactionRate = userBehavior.notificationInteractionCount / totalSent;
    
    // Determine optimal frequency based on interaction rate
    if (interactionRate > 0.7) {
      return NotificationFrequency.frequent; // High engagement
    } else if (interactionRate > 0.4) {
      return NotificationFrequency.moderate; // Medium engagement
    } else if (interactionRate > 0.2) {
      return NotificationFrequency.minimal; // Low engagement
    } else {
      return NotificationFrequency.minimal; // Very low engagement
    }
  }

  /// Get recommended quiet hours based on user activity
  List<int> getRecommendedQuietHours(NotificationContext context) {
    final userBehavior = context.userBehavior;
    final activeHours = userBehavior.activeHours;
    
    // Default quiet hours (late night/early morning)
    List<int> quietHours = [22, 23, 0, 1, 2, 3, 4, 5, 6];
    
    // If we have user activity data, refine quiet hours
    if (activeHours.isNotEmpty) {
      // Remove hours that user is typically active
      quietHours.removeWhere((hour) => activeHours.contains(hour));
      
      // Add hours where user is never active (if we have enough data)
      if (activeHours.length > 10) {
        for (int hour = 0; hour < 24; hour++) {
          if (!activeHours.contains(hour) && !quietHours.contains(hour)) {
            // If user is never active at this hour, consider it quiet
            final hourCount = activeHours.where((h) => h == hour).length;
            if (hourCount == 0) {
              quietHours.add(hour);
            }
          }
        }
      }
    }
    
    quietHours.sort();
    return quietHours;
  }

  /// Schedule batch notifications with optimal spacing
  List<DateTime> scheduleBatchNotifications({
    required List<WeatherInsight> insights,
    required NotificationContext context,
  }) {
    final scheduledTimes = <DateTime>[];
    DateTime lastScheduledTime = context.currentTime;
    
    // Sort insights by priority
    final sortedInsights = List<WeatherInsight>.from(insights);
    sortedInsights.sort((a, b) => b.priority.index.compareTo(a.priority.index));
    
    for (final insight in sortedInsights) {
      DateTime scheduledTime = calculateOptimalTime(
        insight: insight,
        context: context,
      );
      
      // Ensure minimum spacing between notifications (except critical)
      if (insight.priority != InsightPriority.critical) {
        final minSpacing = _getMinimumSpacing(context.userBehavior.preferredFrequency);
        if (scheduledTime.difference(lastScheduledTime) < minSpacing) {
          scheduledTime = lastScheduledTime.add(minSpacing);
        }
      }
      
      scheduledTimes.add(scheduledTime);
      lastScheduledTime = scheduledTime;
    }
    
    return scheduledTimes;
  }

  /// Get minimum spacing between notifications
  Duration _getMinimumSpacing(NotificationFrequency frequency) {
    switch (frequency) {
      case NotificationFrequency.minimal:
        return const Duration(hours: 4);
      case NotificationFrequency.moderate:
        return const Duration(hours: 2);
      case NotificationFrequency.frequent:
        return const Duration(hours: 1);
      case NotificationFrequency.realtime:
        return const Duration(minutes: 15);
    }
  }
}