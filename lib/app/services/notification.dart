import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/main.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationShow {
  Future showNotification(
    int id,
    String title,
    String body,
    DateTime date,
    String icon,
  ) async {
    final imagePath = await WeatherController().getLocalImagePath(icon);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'Rain',
      'DARK NIGHT',
      priority: Priority.high,
      importance: Importance.max,
      playSound: false,
      enableVibration: false,
      largeIcon: FilePathAndroidBitmap(imagePath),
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    var scheduledTime = tz.TZDateTime.from(date, tz.local);
    flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledTime,
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: imagePath,
    );
  }
}
