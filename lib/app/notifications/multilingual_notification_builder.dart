import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/data/db.dart';
import 'package:rain/app/notifications/models/weather_insight.dart';
import 'package:rain/app/notifications/smart_notification_manager.dart';

/// Builds localized notifications using the existing translation system
class MultilingualNotificationBuilder {
  /// Build localized notification content
  Future<NotificationContent> buildNotification({
    required WeatherInsight insight,
    required String languageCode,
    required LocationCache location,
  }) async {
    try {
      // Get localized title and message
      final title = _getLocalizedText(insight.titleKey, insight.parameters);
      final body = _getLocalizedText(insight.messageKey, insight.parameters);
      
      // Get appropriate icon
      final iconPath = await _getNotificationIcon(insight, location);
      
      // Build action buttons (if any)
      final actions = insight.actionKeys.map((actionKey) => 
          _getLocalizedText(actionKey, {})).toList();

      if (kDebugMode) {
        print('MultilingualNotificationBuilder: Built notification in $languageCode');
        print('  Title: $title');
        print('  Body: $body');
      }

      return NotificationContent(
        title: title,
        body: body,
        iconPath: iconPath,
        actions: actions,
      );
    } catch (e) {
      if (kDebugMode) {
        print('MultilingualNotificationBuilder Error: $e');
      }
      
      // Fallback to English
      return NotificationContent(
        title: _getFallbackText(insight.titleKey),
        body: _getFallbackText(insight.messageKey),
        iconPath: await _getNotificationIcon(insight, location),
      );
    }
  }

  /// Get localized text using GetX translation system
  String _getLocalizedText(String key, Map<String, dynamic> parameters) {
    try {
      // Use GetX translation system
      String text = key.tr;
      
      // Replace parameters in the text
      parameters.forEach((paramKey, paramValue) {
        text = text.replaceAll('{$paramKey}', paramValue.toString());
      });
      
      return text;
    } catch (e) {
      if (kDebugMode) {
        print('Translation error for key $key: $e');
      }
      return _getFallbackText(key);
    }
  }

  /// Get fallback English text if translation fails
  String _getFallbackText(String key) {
    // Fallback translations for notification keys
    final fallbackTranslations = {
      // Severe weather
      'notification_severe_weather_title': 'Severe Weather Alert',
      'notification_severe_weather_message': '{weatherType} expected in {timeUntil} in {location}',
      'notification_rain_alert_title': 'Rain Alert',
      'notification_rain_alert_message': '{intensity} rain starting in {startTime}',
      
      // Wind warnings
      'notification_wind_warning_title': 'Wind Warning',
      'notification_wind_warning_message': 'Strong winds up to {windSpeed} km/h expected in {timeUntil}',
      
      // Temperature
      'notification_temperature_extreme_title': 'Temperature Alert',
      'notification_temperature_extreme_message': '{extremeType} temperature of {temperature}°C - {advice}',
      'notification_temp_swing_title': 'Large Temperature Change',
      'notification_temp_swing_message': 'Temperature will range from {minTemp}°C to {maxTemp}°C today ({swing}°C swing)',
      
      // Precipitation
      'notification_rain_coming_title': 'Rain Approaching',
      'notification_rain_coming_message': '{intensity} rain ({amount}mm) expected in {timeUntil}',
      
      // Activities
      'notification_outdoor_activity_title': 'Perfect Weather!',
      'notification_outdoor_activity_message': 'Great conditions for {activity} - {temperature}°C and {conditions}',
      'notification_indoor_activity_title': 'Indoor Day',
      'notification_indoor_activity_message': '{reason} outside - {suggestion}',
      
      // Commute
      'notification_commute_advice_title': 'Commute Update',
      'notification_commute_advice_message': '{advice} - {weatherCondition} conditions',
      
      // Health
      'notification_uv_warning_title': 'UV Alert',
      'notification_uv_warning_message': 'High UV index ({uvIndex}) - {recommendation}',
      'notification_heat_index_title': 'Heat Warning',
      'notification_heat_index_message': 'Heat index {heatIndex}°C - {advice}',
      
      // Trends
      'notification_weather_trend_title': 'Weather Trend',
      'notification_weather_trend_message': '{trendType} trend: {change}°C change over {timeframe}',
      'notification_seasonal_comparison_title': 'Seasonal Insight',
      'notification_seasonal_comparison_message': '{comparison} - {difference}°C {season} average',
      
      // Actions
      'bring_umbrella': 'Bring Umbrella',
      'check_radar': 'Check Radar',
      'view_forecast': 'View Forecast',
      'check_other_cities': 'Check Other Cities',
    };
    
    return fallbackTranslations[key] ?? key;
  }

  /// Get appropriate notification icon
  Future<String> _getNotificationIcon(WeatherInsight insight, LocationCache location) async {
    try {
      final controller = Get.find<WeatherController>();
      
      // Use custom icon if specified
      if (insight.iconPath != null) {
        return await controller.getLocalImagePath(insight.iconPath!);
      }
      
      // Determine icon based on insight type
      String iconName = _getIconForInsightType(insight.type);
      
      return await controller.getLocalImagePath(iconName);
    } catch (e) {
      if (kDebugMode) {
        print('Error getting notification icon: $e');
      }
      // Fallback to default weather icon
      try {
        final controller = Get.find<WeatherController>();
        return await controller.getLocalImagePath('01d.png');
      } catch (e2) {
        return '';
      }
    }
  }

  /// Get icon name for insight type
  String _getIconForInsightType(InsightType type) {
    switch (type) {
      case InsightType.severeWeatherWarning:
        return '11d.png'; // Thunderstorm
      case InsightType.temperatureAlert:
        return '01d.png'; // Clear sky (temperature)
      case InsightType.precipitationAlert:
        return '09d.png'; // Rain
      case InsightType.windAlert:
        return '50d.png'; // Mist/wind
      case InsightType.uvAlert:
        return '01d.png'; // Sunny
      case InsightType.outdoorActivityRecommendation:
        return '01d.png'; // Clear sky
      case InsightType.indoorActivitySuggestion:
        return '04d.png'; // Cloudy
      case InsightType.commuteAdvice:
        return '10d.png'; // Rain day
      case InsightType.healthWarning:
        return '01d.png'; // Clear sky
      case InsightType.temperatureTrend:
        return '02d.png'; // Few clouds
      case InsightType.weatherComparison:
        return '03d.png'; // Scattered clouds
      case InsightType.seasonalInsight:
        return '02d.png'; // Few clouds
      case InsightType.historicalComparison:
        return '03d.png'; // Scattered clouds
      case InsightType.travelWeatherUpdate:
        return '04d.png'; // Broken clouds
      case InsightType.locationWeatherChange:
        return '02d.png'; // Few clouds
      case InsightType.nearbyWeatherAlert:
        return '09d.png'; // Rain
      case InsightType.airQualityAlert:
        return '50d.png'; // Mist
      case InsightType.allergyAlert:
        return '01d.png'; // Clear sky
      case InsightType.sunProtectionReminder:
        return '01d.png'; // Clear sky
      case InsightType.clothingRecommendation:
        return '02d.png'; // Few clouds
    }
  }

  /// Add new translation keys to the system (for development)
  void addNotificationTranslations() {
    // This method can be used to add new translation keys
    // to all language files during development
    
    final notificationKeys = [
      'notification_severe_weather_title',
      'notification_severe_weather_message',
      'notification_rain_alert_title',
      'notification_rain_alert_message',
      'notification_wind_warning_title',
      'notification_wind_warning_message',
      'notification_temperature_extreme_title',
      'notification_temperature_extreme_message',
      'notification_temp_swing_title',
      'notification_temp_swing_message',
      'notification_rain_coming_title',
      'notification_rain_coming_message',
      'notification_outdoor_activity_title',
      'notification_outdoor_activity_message',
      'notification_indoor_activity_title',
      'notification_indoor_activity_message',
      'notification_commute_advice_title',
      'notification_commute_advice_message',
      'notification_uv_warning_title',
      'notification_uv_warning_message',
      'notification_heat_index_title',
      'notification_heat_index_message',
      'notification_weather_trend_title',
      'notification_weather_trend_message',
      'notification_seasonal_comparison_title',
      'notification_seasonal_comparison_message',
      'bring_umbrella',
      'check_radar',
      'view_forecast',
      'check_other_cities',
    ];
    
    if (kDebugMode) {
      print('Notification translation keys to add:');
      for (final key in notificationKeys) {
        print('  "$key": "${_getFallbackText(key)}",');
      }
    }
  }
}