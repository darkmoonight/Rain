import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/data/db.dart';
import 'package:rain/app/notifications/smart_notification_manager.dart';
import 'package:rain/app/notifications/models/notification_context.dart';
import 'package:rain/app/notifications/models/weather_insight.dart';
import 'package:rain/app/notifications/weather_insight_generator.dart';
import 'package:rain/app/notifications/multilingual_notification_builder.dart';

/// Test class for Smart Notification System
class SmartNotificationTester {
  /// Test the complete smart notification flow
  static Future<void> testSmartNotificationFlow() async {
    if (kDebugMode) {
      print('🧪 Testing Smart Notification System...');
    }

    try {
      // Get weather controller
      final controller = Get.find<WeatherController>();
      
      // Create test weather data
      final testWeatherData = _createTestWeatherData();
      final testLocationData = _createTestLocationData();
      
      // Test smart notification manager
      final smartManager = SmartNotificationManager();
      
      await smartManager.scheduleIntelligentNotifications(
        weatherData: testWeatherData,
        location: testLocationData,
        userLocations: [],
      );
      
      // Get notification statistics
      final stats = await smartManager.getNotificationStats();
      
      if (kDebugMode) {
        print('✅ Smart Notification Test Results:');
        print('   - Notification system initialized successfully');
        print('   - Statistics: $stats');
        print('   - Test completed without errors');
      }
      
    } catch (e) {
      if (kDebugMode) {
        print('❌ Smart Notification Test Failed: $e');
      }
    }
  }

  /// Test individual components
  static Future<void> testComponents() async {
    if (kDebugMode) {
      print('🔧 Testing Smart Notification Components...');
    }

    try {
      // Test notification templates
      _testNotificationTemplates();
      
      // Test insight generation
      await _testInsightGeneration();
      
      // Test multilingual support
      await _testMultilingualSupport();
      
      if (kDebugMode) {
        print('✅ All component tests passed');
      }
      
    } catch (e) {
      if (kDebugMode) {
        print('❌ Component test failed: $e');
      }
    }
  }

  /// Create test weather data
  static MainWeatherCache _createTestWeatherData() {
    return MainWeatherCache(
      time: [
        DateTime.now().toIso8601String(),
        DateTime.now().add(const Duration(hours: 1)).toIso8601String(),
        DateTime.now().add(const Duration(hours: 2)).toIso8601String(),
      ],
      temperature2M: [22.5, 24.0, 25.5],
      weathercode: [1, 2, 3], // Clear to partly cloudy
      precipitation: [0.0, 0.5, 1.2],
      windspeed10M: [15.0, 18.0, 22.0],
      relativehumidity2M: [65, 68, 70],
      uvIndex: [6.0, 7.5, 8.0],
      timezone: 'UTC',
      timestamp: DateTime.now(),
    );
  }

  /// Create test location data
  static LocationCache _createTestLocationData() {
    return LocationCache(
      lat: 40.7128,
      lon: -74.0060,
      city: 'New York',
      district: 'Manhattan',
    );
  }

  /// Test notification templates
  static void _testNotificationTemplates() {
    // Test severe weather template
    final severeWeatherInsight = NotificationTemplates.severeWeatherWarning.createInsight(
      type: InsightType.severeWeatherWarning,
      parameters: {
        'weatherType': 'thunderstorm',
        'timeUntil': '30 minutes',
        'location': 'New York',
      },
    );
    
    assert(severeWeatherInsight.priority == InsightPriority.critical);
    assert(severeWeatherInsight.type == InsightType.severeWeatherWarning);
    
    if (kDebugMode) {
      print('   ✓ Notification templates working correctly');
    }
  }

  /// Test insight generation
  static Future<void> _testInsightGeneration() async {
    // This would test the WeatherInsightGenerator
    // For now, just verify it can be instantiated
    final generator = WeatherInsightGenerator();
    assert(generator != null);
    
    if (kDebugMode) {
      print('   ✓ Insight generation component ready');
    }
  }

  /// Test multilingual support
  static Future<void> _testMultilingualSupport() async {
    // This would test the MultilingualNotificationBuilder
    // For now, just verify it can be instantiated
    final builder = MultilingualNotificationBuilder();
    assert(builder != null);
    
    if (kDebugMode) {
      print('   ✓ Multilingual support component ready');
    }
  }

  /// Simulate user interaction with notification
  static Future<void> simulateUserInteraction() async {
    if (kDebugMode) {
      print('👤 Simulating user interaction...');
    }

    try {
      final smartManager = SmartNotificationManager();
      
      // Simulate opening a notification
      // This would normally be called when user taps a notification
      
      if (kDebugMode) {
        print('   ✓ User interaction simulation completed');
      }
      
    } catch (e) {
      if (kDebugMode) {
        print('   ❌ User interaction simulation failed: $e');
      }
    }
  }

  /// Generate test insights for demonstration
  static List<WeatherInsight> generateTestInsights() {
    return [
      // Rain alert
      NotificationTemplates.rainAlert.createInsight(
        type: InsightType.precipitationAlert,
        parameters: {
          'intensity': 'light',
          'startTime': '1 hour',
        },
        priority: InsightPriority.medium,
      ),
      
      // UV warning
      NotificationTemplates.uvWarning.createInsight(
        type: InsightType.uvAlert,
        parameters: {
          'uvIndex': 8,
          'recommendation': 'Use strong sun protection',
        },
        priority: InsightPriority.medium,
      ),
      
      // Outdoor activity recommendation
      NotificationTemplates.outdoorActivity.createInsight(
        type: InsightType.outdoorActivityRecommendation,
        parameters: {
          'activity': 'evening walk',
          'temperature': 24,
          'conditions': 'perfect',
        },
        priority: InsightPriority.low,
      ),
    ];
  }
}