import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/main.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationShow {
  static const String _channelId = 'Rain';
  static const String _channelName = 'DARK NIGHT';

  Future<void> showNotification(
    int id,
    String title,
    String body,
    DateTime date,
    String icon,
  ) async {
    try {
      if (kDebugMode) {
        print('🔔 Scheduling notification:');
        print('   ID: $id');
        print('   Title: $title');
        print('   Body: $body');
        print('   Scheduled for: $date');
        print('   Icon: $icon');
      }

      final imagePath = await _getLocalImagePath(icon);
      final notificationDetails = await _buildNotificationDetails(imagePath);
      final scheduledTime = _getScheduledTime(date);

      if (kDebugMode) {
        print('   Image path: $imagePath');
        print('   Scheduled time: $scheduledTime');
        print('   Current time: ${DateTime.now()}');
        print('   Time difference: ${scheduledTime.difference(DateTime.now())}');
      }

      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduledTime,
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: imagePath,
      );

      if (kDebugMode) {
        print('✅ Notification scheduled successfully!');
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error showing notification: $e');
      }
    }
  }

  Future<String> _getLocalImagePath(String icon) async {
    return await WeatherController().getLocalImagePath(icon);
  }

  Future<NotificationDetails> _buildNotificationDetails(
    String imagePath,
  ) async {
    final androidNotificationDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      priority: Priority.high,
      importance: Importance.max,
      playSound: false,
      enableVibration: false,
      largeIcon: FilePathAndroidBitmap(imagePath),
    );
    return NotificationDetails(android: androidNotificationDetails);
  }

  tz.TZDateTime _getScheduledTime(DateTime date) {
    return tz.TZDateTime.from(date, tz.local);
  }

  /// Show an immediate test notification (for debugging)
  Future<void> showImmediateTestNotification() async {
    try {
      if (kDebugMode) {
        print('🚀 Showing immediate test notification...');
      }

      const androidNotificationDetails = AndroidNotificationDetails(
        _channelId,
        _channelName,
        priority: Priority.high,
        importance: Importance.max,
        playSound: true,
        enableVibration: true,
      );
      
      const notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
      );

      await flutterLocalNotificationsPlugin.show(
        999999, // Unique ID for test
        '🔔 Smart Notification Test',
        'If you see this, notifications are working! Smart weather insights will appear soon.',
        notificationDetails,
      );

      if (kDebugMode) {
        print('✅ Immediate test notification sent!');
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error showing immediate notification: $e');
      }
    }
  }
}
