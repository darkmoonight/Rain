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
      final imagePath = await _getLocalImagePath(icon);
      final notificationDetails = await _buildNotificationDetails(imagePath);
      final scheduledTime = _getScheduledTime(date);

      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduledTime,
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: imagePath,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error showing notification: $e');
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
}
