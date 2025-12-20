import 'package:flutter/foundation.dart';
import 'package:rain/app/notifications/models/notification_context.dart';
import 'package:rain/app/notifications/models/weather_insight.dart';

/// Intelligence engine for prioritizing and filtering weather notifications
class NotificationIntelligence {
  /// Prioritize insights based on user context and weather conditions
  List<WeatherInsight> prioritizeInsights({
    required List<WeatherInsight> insights,
    required NotificationContext context,
  }) {
    // Filter out invalid insights
    final validInsights = insights.where((insight) => insight.isValid).toList();

    // Score each insight based on multiple factors
    final scoredInsights = validInsights.map((insight) {
      final score = _calculateInsightScore(insight, context);
      return _ScoredInsight(insight, score);
    }).toList();

    // Sort by score (highest first)
    scoredInsights.sort((a, b) => b.score.compareTo(a.score));

    // Apply frequency limits based on user preferences
    final filteredInsights = _applyFrequencyLimits(
      scoredInsights.map((s) => s.insight).toList(),
      context,
    );

    if (kDebugMode) {
      print('NotificationIntelligence: Prioritized ${filteredInsights.length}/${insights.length} insights');
      for (final insight in filteredInsights.take(3)) {
        print('  - ${insight.type.name}: ${insight.priority.name}');
      }
    }

    return filteredInsights;
  }

  /// Calculate relevance score for an insight
  double _calculateInsightScore(WeatherInsight insight, NotificationContext context) {
    double score = 0.0;

    // Base score from priority
    score += _getPriorityScore(insight.priority);

    // Time relevance (how soon is this relevant?)
    score += _getTimeRelevanceScore(insight, context);

    // User interest (based on past behavior)
    score += _getUserInterestScore(insight, context);

    // Weather severity (more severe = higher score)
    score += _getWeatherSeverityScore(insight, context);

    // Location relevance (current location vs other locations)
    score += _getLocationRelevanceScore(insight, context);

    // Avoid notification fatigue
    score *= _getNotificationFatigueMultiplier(insight, context);

    return score;
  }

  /// Get base score from insight priority
  double _getPriorityScore(InsightPriority priority) {
    switch (priority) {
      case InsightPriority.critical:
        return 100.0;
      case InsightPriority.high:
        return 75.0;
      case InsightPriority.medium:
        return 50.0;
      case InsightPriority.low:
        return 25.0;
    }
  }

  /// Calculate time relevance score
  double _getTimeRelevanceScore(WeatherInsight insight, NotificationContext context) {
    final now = context.currentTime;
    final validUntil = insight.validUntil;
    final timeUntilExpiry = validUntil.difference(now);

    // More urgent if expires soon
    if (timeUntilExpiry.inHours <= 1) {
      return 30.0; // Very urgent
    } else if (timeUntilExpiry.inHours <= 3) {
      return 20.0; // Moderately urgent
    } else if (timeUntilExpiry.inHours <= 6) {
      return 10.0; // Somewhat urgent
    } else {
      return 5.0; // Not urgent
    }
  }

  /// Calculate user interest score based on behavior
  double _getUserInterestScore(WeatherInsight insight, NotificationContext context) {
    final userBehavior = context.userBehavior;
    double score = 0.0;

    // Check if user is interested in this type of weather condition
    switch (insight.type) {
      case InsightType.precipitationAlert:
        if (userBehavior.interestedConditions.contains(WeatherCondition.rainy)) {
          score += 15.0;
        }
        break;
      case InsightType.temperatureAlert:
        if (userBehavior.interestedConditions.contains(WeatherCondition.hot) ||
            userBehavior.interestedConditions.contains(WeatherCondition.cold)) {
          score += 15.0;
        }
        break;
      case InsightType.outdoorActivityRecommendation:
        if (userBehavior.interestedConditions.contains(WeatherCondition.sunny)) {
          score += 20.0;
        }
        break;
      case InsightType.commuteAdvice:
        // Higher score during typical commute hours
        final hour = context.currentTime.hour;
        if ((hour >= 7 && hour <= 9) || (hour >= 17 && hour <= 19)) {
          score += 25.0;
        }
        break;
      default:
        score += 5.0; // Base interest
    }

    // Boost score if user frequently interacts with notifications
    if (userBehavior.notificationInteractionCount > 10) {
      score *= 1.2;
    }

    return score;
  }

  /// Calculate weather severity score
  double _getWeatherSeverityScore(WeatherInsight insight, NotificationContext context) {
    final weather = context.currentWeather;
    double score = 0.0;

    // Check current weather conditions for severity
    if (weather.temperature2M != null && weather.temperature2M!.isNotEmpty) {
      final currentTemp = weather.temperature2M!.first;
      
      // Extreme temperatures
      if (currentTemp > 35 || currentTemp < -10) {
        score += 20.0;
      } else if (currentTemp > 30 || currentTemp < 0) {
        score += 10.0;
      }
    }

    // High wind speeds
    if (weather.windspeed10M != null && weather.windspeed10M!.isNotEmpty) {
      final windSpeed = weather.windspeed10M!.first;
      if (windSpeed != null) {
        if (windSpeed > 50) {
          score += 20.0;
        } else if (windSpeed > 30) {
          score += 10.0;
        }
      }
    }

    // Precipitation
    if (weather.precipitation != null && weather.precipitation!.isNotEmpty) {
      final precipitation = weather.precipitation!.first;
      if (precipitation != null) {
        if (precipitation > 10) {
          score += 15.0;
        } else if (precipitation > 5) {
          score += 8.0;
        }
      }
    }

    return score;
  }

  /// Calculate location relevance score
  double _getLocationRelevanceScore(WeatherInsight insight, NotificationContext context) {
    // Current location gets highest priority
    return 10.0; // Base score for current location
    
    // TODO: Add logic for multiple locations when implementing multi-location insights
  }

  /// Apply notification fatigue multiplier
  double _getNotificationFatigueMultiplier(WeatherInsight insight, NotificationContext context) {
    final timeSinceLastNotification = context.currentTime
        .difference(context.userBehavior.lastNotificationTime);

    // Reduce score if notifications were sent recently
    if (timeSinceLastNotification.inMinutes < 30) {
      return 0.5; // Significant reduction
    } else if (timeSinceLastNotification.inHours < 2) {
      return 0.8; // Moderate reduction
    } else {
      return 1.0; // No reduction
    }
  }

  /// Apply frequency limits based on user preferences
  List<WeatherInsight> _applyFrequencyLimits(
    List<WeatherInsight> insights,
    NotificationContext context,
  ) {
    final frequency = context.preferredFrequency;
    
    // Determine maximum notifications based on frequency preference
    int maxNotifications;
    switch (frequency) {
      case NotificationFrequency.minimal:
        maxNotifications = 1;
        break;
      case NotificationFrequency.moderate:
        maxNotifications = 2;
        break;
      case NotificationFrequency.frequent:
        maxNotifications = 4;
        break;
      case NotificationFrequency.realtime:
        maxNotifications = insights.length; // No limit for real-time
        break;
    }

    // Always include critical insights regardless of frequency limits
    final criticalInsights = insights
        .where((insight) => insight.priority == InsightPriority.critical)
        .toList();
    
    final nonCriticalInsights = insights
        .where((insight) => insight.priority != InsightPriority.critical)
        .take(maxNotifications - criticalInsights.length)
        .toList();

    return [...criticalInsights, ...nonCriticalInsights];
  }

  /// Analyze notification effectiveness for learning
  void recordNotificationInteraction({
    required WeatherInsight insight,
    required NotificationInteractionType interactionType,
    required NotificationContext context,
  }) {
    // TODO: Implement machine learning feedback loop
    // This would help improve future notification prioritization
    
    if (kDebugMode) {
      print('NotificationIntelligence: Recorded ${interactionType.name} for ${insight.type.name}');
    }
  }
}

/// Internal class for scoring insights
class _ScoredInsight {
  final WeatherInsight insight;
  final double score;

  _ScoredInsight(this.insight, this.score);
}

/// Types of user interactions with notifications
enum NotificationInteractionType {
  opened,     // User opened the notification
  dismissed,  // User dismissed without opening
  actionTaken, // User took an action from notification
  ignored,    // Notification expired without interaction
}