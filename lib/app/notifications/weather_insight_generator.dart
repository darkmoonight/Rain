import 'package:flutter/foundation.dart';
import 'package:rain/app/data/db.dart';
import 'package:rain/app/notifications/models/notification_context.dart';
import 'package:rain/app/notifications/models/weather_insight.dart';
import 'package:rain/app/ui/widgets/weather/status/status_weather.dart';

/// Generates intelligent weather insights for notifications
class WeatherInsightGenerator {
  /// Generate weather insights based on current conditions and forecasts
  Future<List<WeatherInsight>> generateInsights({
    required MainWeatherCache weatherData,
    required LocationCache location,
    required NotificationContext context,
  }) async {
    final insights = <WeatherInsight>[];

    try {
      // Generate different types of insights
      insights.addAll(await _generateSevereWeatherAlerts(weatherData, location, context));
      insights.addAll(await _generateTemperatureInsights(weatherData, location, context));
      insights.addAll(await _generatePrecipitationInsights(weatherData, location, context));
      insights.addAll(await _generateActivityRecommendations(weatherData, location, context));
      insights.addAll(await _generateCommuteAdvice(weatherData, location, context));
      insights.addAll(await _generateHealthWarnings(weatherData, location, context));
      insights.addAll(await _generateTrendInsights(weatherData, location, context));

      if (kDebugMode) {
        print('WeatherInsightGenerator: Generated ${insights.length} insights');
      }
    } catch (e) {
      if (kDebugMode) {
        print('WeatherInsightGenerator Error: $e');
      }
    }

    return insights;
  }

  /// Generate severe weather alerts
  Future<List<WeatherInsight>> _generateSevereWeatherAlerts(
    MainWeatherCache weather,
    LocationCache location,
    NotificationContext context,
  ) async {
    final insights = <WeatherInsight>[];
    final now = DateTime.now();

    // Check for severe weather in the next 6 hours
    for (int i = 0; i < 6 && i < (weather.time?.length ?? 0); i++) {
      final weatherCode = weather.weathercode?[i];
      final windSpeed = weather.windspeed10M?[i] ?? 0;
      final precipitation = weather.precipitation?[i] ?? 0;
      final timeStr = weather.time?[i];

      if (weatherCode == null || timeStr == null) continue;

      final forecastTime = DateTime.parse(timeStr);
      if (forecastTime.isBefore(now)) continue;

      // Severe thunderstorm
      if (weatherCode >= 95 && weatherCode <= 99) {
        insights.add(NotificationTemplates.severeWeatherWarning.createInsight(
          type: InsightType.severeWeatherWarning,
          parameters: {
            'weatherType': 'thunderstorm',
            'timeUntil': _formatTimeUntil(forecastTime),
            'location': location.city ?? 'your area',
          },
          priority: InsightPriority.critical,
          validUntil: forecastTime.add(const Duration(hours: 1)),
          iconPath: 'thunderstorm.png',
        ));
      }

      // High wind warning
      if (windSpeed > 50) {
        insights.add(WeatherInsight(
          type: InsightType.windAlert,
          titleKey: 'notification_wind_warning_title',
          messageKey: 'notification_wind_warning_message',
          parameters: {
            'windSpeed': windSpeed.round(),
            'timeUntil': _formatTimeUntil(forecastTime),
          },
          priority: InsightPriority.high,
          validUntil: forecastTime.add(const Duration(hours: 2)),
          iconPath: 'wind.png',
        ));
      }

      // Heavy rain warning
      if (precipitation > 10) {
        insights.add(NotificationTemplates.rainAlert.createInsight(
          type: InsightType.precipitationAlert,
          parameters: {
            'intensity': precipitation > 20 ? 'heavy' : 'moderate',
            'startTime': _formatTimeUntil(forecastTime),
            'location': location.city ?? 'your area',
          },
          priority: precipitation > 20 ? InsightPriority.high : InsightPriority.medium,
          validUntil: forecastTime.add(const Duration(hours: 3)),
        ));
      }
    }

    return insights;
  }

  /// Generate temperature-related insights
  Future<List<WeatherInsight>> _generateTemperatureInsights(
    MainWeatherCache weather,
    LocationCache location,
    NotificationContext context,
  ) async {
    final insights = <WeatherInsight>[];
    
    if (weather.temperature2M == null || weather.temperature2M!.isEmpty) {
      return insights;
    }

    final currentTemp = weather.temperature2M!.first;
    final dailyMax = weather.temperature2MMax?.first;
    final dailyMin = weather.temperature2MMin?.first;

    // Extreme temperature warnings
    if (currentTemp > 35) {
      insights.add(NotificationTemplates.temperatureExtreme.createInsight(
        type: InsightType.temperatureAlert,
        parameters: {
          'temperature': currentTemp.round(),
          'extremeType': 'hot',
          'advice': 'Stay hydrated and avoid prolonged sun exposure',
        },
        priority: InsightPriority.high,
        validUntil: DateTime.now().add(const Duration(hours: 4)),
      ));
    } else if (currentTemp < -10) {
      insights.add(NotificationTemplates.temperatureExtreme.createInsight(
        type: InsightType.temperatureAlert,
        parameters: {
          'temperature': currentTemp.round(),
          'extremeType': 'cold',
          'advice': 'Dress warmly and limit outdoor exposure',
        },
        priority: InsightPriority.high,
        validUntil: DateTime.now().add(const Duration(hours: 4)),
      ));
    }

    // Large temperature swings
    if (dailyMax != null && dailyMin != null) {
      final tempSwing = dailyMax - dailyMin;
      if (tempSwing > 15) {
        insights.add(WeatherInsight(
          type: InsightType.temperatureTrend,
          titleKey: 'notification_temp_swing_title',
          messageKey: 'notification_temp_swing_message',
          parameters: {
            'maxTemp': dailyMax.round(),
            'minTemp': dailyMin.round(),
            'swing': tempSwing.round(),
          },
          priority: InsightPriority.medium,
          validUntil: DateTime.now().add(const Duration(hours: 12)),
        ));
      }
    }

    return insights;
  }

  /// Generate precipitation insights
  Future<List<WeatherInsight>> _generatePrecipitationInsights(
    MainWeatherCache weather,
    LocationCache location,
    NotificationContext context,
  ) async {
    final insights = <WeatherInsight>[];
    final now = DateTime.now();

    // Check for rain in the next few hours
    for (int i = 0; i < 4 && i < (weather.time?.length ?? 0); i++) {
      final precipitation = weather.precipitation?[i] ?? 0;
      final timeStr = weather.time?[i];
      
      if (timeStr == null) continue;
      
      final forecastTime = DateTime.parse(timeStr);
      if (forecastTime.isBefore(now)) continue;

      if (precipitation > 2) {
        insights.add(WeatherInsight(
          type: InsightType.precipitationAlert,
          titleKey: 'notification_rain_coming_title',
          messageKey: 'notification_rain_coming_message',
          parameters: {
            'intensity': precipitation > 10 ? 'heavy' : 'light',
            'timeUntil': _formatTimeUntil(forecastTime),
            'amount': precipitation.toStringAsFixed(1),
          },
          priority: precipitation > 10 ? InsightPriority.high : InsightPriority.medium,
          validUntil: forecastTime.add(const Duration(hours: 1)),
          actionKeys: ['bring_umbrella', 'check_radar'],
        ));
        break; // Only notify about the first rain event
      }
    }

    return insights;
  }

  /// Generate activity recommendations
  Future<List<WeatherInsight>> _generateActivityRecommendations(
    MainWeatherCache weather,
    LocationCache location,
    NotificationContext context,
  ) async {
    final insights = <WeatherInsight>[];
    
    if (weather.temperature2M == null || weather.weathercode == null) {
      return insights;
    }

    final currentTemp = weather.temperature2M!.first;
    final currentWeatherCode = weather.weathercode!.first;
    final windSpeed = weather.windspeed10M?.first ?? 0;
    final precipitation = weather.precipitation?.first ?? 0;

    // Perfect weather for outdoor activities
    if (currentTemp >= 18 && currentTemp <= 28 && 
        currentWeatherCode <= 3 && windSpeed < 20 && precipitation < 1) {
      
      String activity = _suggestActivity(currentTemp, context.currentTime.hour);
      
      insights.add(NotificationTemplates.outdoorActivity.createInsight(
        type: InsightType.outdoorActivityRecommendation,
        parameters: {
          'activity': activity,
          'temperature': currentTemp.round(),
          'conditions': 'perfect',
        },
        priority: InsightPriority.medium,
        validUntil: DateTime.now().add(const Duration(hours: 4)),
      ));
    }

    // Indoor activity suggestions for bad weather
    if (precipitation > 5 || windSpeed > 30 || currentTemp < 5 || currentTemp > 35) {
      insights.add(WeatherInsight(
        type: InsightType.indoorActivitySuggestion,
        titleKey: 'notification_indoor_activity_title',
        messageKey: 'notification_indoor_activity_message',
        parameters: {
          'reason': _getWeatherReason(precipitation, windSpeed, currentTemp),
          'suggestion': 'Perfect time for indoor activities',
        },
        priority: InsightPriority.low,
        validUntil: DateTime.now().add(const Duration(hours: 6)),
      ));
    }

    return insights;
  }

  /// Generate commute advice
  Future<List<WeatherInsight>> _generateCommuteAdvice(
    MainWeatherCache weather,
    LocationCache location,
    NotificationContext context,
  ) async {
    final insights = <WeatherInsight>[];
    final hour = context.currentTime.hour;
    
    // Only generate commute advice during typical commute hours
    if (!((hour >= 6 && hour <= 9) || (hour >= 16 && hour <= 19))) {
      return insights;
    }

    final precipitation = weather.precipitation?.first ?? 0;
    final windSpeed = weather.windspeed10M?.first ?? 0;
    final visibility = weather.visibility?.first ?? 10000;

    String advice = '';
    InsightPriority priority = InsightPriority.medium;

    if (precipitation > 5) {
      advice = 'Heavy rain expected - allow extra travel time';
      priority = InsightPriority.high;
    } else if (precipitation > 1) {
      advice = 'Light rain - consider bringing an umbrella';
    } else if (windSpeed > 40) {
      advice = 'Strong winds - drive carefully';
      priority = InsightPriority.high;
    } else if (visibility < 1000) {
      advice = 'Poor visibility - drive with caution';
      priority = InsightPriority.high;
    }

    if (advice.isNotEmpty) {
      insights.add(NotificationTemplates.commuteAdvice.createInsight(
        type: InsightType.commuteAdvice,
        parameters: {
          'advice': advice,
          'weatherCondition': _getWeatherDescription(weather.weathercode?.first ?? 0),
        },
        priority: priority,
        validUntil: DateTime.now().add(const Duration(hours: 2)),
      ));
    }

    return insights;
  }

  /// Generate health warnings
  Future<List<WeatherInsight>> _generateHealthWarnings(
    MainWeatherCache weather,
    LocationCache location,
    NotificationContext context,
  ) async {
    final insights = <WeatherInsight>[];
    
    final uvIndex = weather.uvIndex?.first ?? 0;
    final temperature = weather.temperature2M?.first ?? 20;
    final humidity = weather.relativehumidity2M?.first ?? 50;

    // UV warnings
    if (uvIndex > 7) {
      insights.add(NotificationTemplates.uvWarning.createInsight(
        type: InsightType.uvAlert,
        parameters: {
          'uvIndex': uvIndex.round(),
          'recommendation': uvIndex > 10 ? 'Avoid sun exposure' : 'Use strong sun protection',
        },
        priority: uvIndex > 10 ? InsightPriority.high : InsightPriority.medium,
        validUntil: DateTime.now().add(const Duration(hours: 6)),
      ));
    }

    // Heat index warnings
    if (temperature > 30 && humidity > 70) {
      final heatIndex = _calculateHeatIndex(temperature, humidity.toDouble());
      if (heatIndex > 35) {
        insights.add(WeatherInsight(
          type: InsightType.healthWarning,
          titleKey: 'notification_heat_index_title',
          messageKey: 'notification_heat_index_message',
          parameters: {
            'heatIndex': heatIndex.round(),
            'advice': 'Stay hydrated and seek air conditioning',
          },
          priority: InsightPriority.high,
          validUntil: DateTime.now().add(const Duration(hours: 4)),
        ));
      }
    }

    return insights;
  }

  /// Generate trend insights
  Future<List<WeatherInsight>> _generateTrendInsights(
    MainWeatherCache weather,
    LocationCache location,
    NotificationContext context,
  ) async {
    final insights = <WeatherInsight>[];
    
    // Temperature trend over next 24 hours
    if (weather.temperature2M != null && weather.temperature2M!.length >= 24) {
      final currentTemp = weather.temperature2M!.first;
      final temp24h = weather.temperature2M![23];
      final tempChange = temp24h - currentTemp;

      if (tempChange.abs() > 10) {
        insights.add(NotificationTemplates.weatherTrend.createInsight(
          type: InsightType.temperatureTrend,
          parameters: {
            'trendType': tempChange > 0 ? 'warming' : 'cooling',
            'change': tempChange.abs().round(),
            'timeframe': '24 hours',
          },
          priority: InsightPriority.low,
          validUntil: DateTime.now().add(const Duration(hours: 12)),
        ));
      }
    }

    return insights;
  }

  /// Format time until event
  String _formatTimeUntil(DateTime eventTime) {
    final now = DateTime.now();
    final difference = eventTime.difference(now);
    
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours';
    } else {
      return '${difference.inDays} days';
    }
  }

  /// Suggest activity based on temperature and time
  String _suggestActivity(double temperature, int hour) {
    if (hour >= 6 && hour <= 10) {
      return temperature < 20 ? 'morning walk' : 'morning jog';
    } else if (hour >= 17 && hour <= 20) {
      return temperature < 25 ? 'evening walk' : 'outdoor dining';
    } else {
      return temperature < 25 ? 'outdoor sports' : 'park visit';
    }
  }

  /// Get weather reason for indoor activities
  String _getWeatherReason(double precipitation, double windSpeed, double temperature) {
    if (precipitation > 5) return 'heavy rain';
    if (windSpeed > 30) return 'strong winds';
    if (temperature < 5) return 'very cold';
    if (temperature > 35) return 'very hot';
    return 'poor weather';
  }

  /// Get weather description from weather code
  String _getWeatherDescription(int weatherCode) {
    return StatusWeather().getText(weatherCode);
  }

  /// Calculate heat index
  double _calculateHeatIndex(double temperature, double humidity) {
    // Simplified heat index calculation
    return temperature + (0.5 * humidity / 100 * (temperature - 14));
  }
}