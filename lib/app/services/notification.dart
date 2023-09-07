import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'Rain',
      'DARK NIGHT',
      priority: Priority.max,
      importance: Importance.max,
      playSound: false,
      enableVibration: false,
      largeIcon: FilePathAndroidBitmap(icon),
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
      payload: icon,
    );
  }
}
