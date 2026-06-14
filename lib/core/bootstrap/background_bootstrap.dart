import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rain/core/bootstrap/timezone_bootstrap.dart';
import 'package:rain/core/services/notification_service.dart';
import 'package:timezone/timezone.dart' as tz;

/// Shared local notifications plugin for main and background isolates.
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// Initializes [flutterLocalNotificationsPlugin]; safe to call from any isolate.
Future<void> initializeNotificationsPlugin() async {
  try {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('ic_notification'),
      iOS: DarwinInitializationSettings(),
      linux: LinuxInitializationSettings(defaultActionName: 'Rain'),
    );
    await flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
    );
    await _ensureAndroidNotificationChannels();
  } catch (e, st) {
    logBackgroundError('initializeNotificationsPlugin', e, st);
  }
}

Future<void> _ensureAndroidNotificationChannels() async {
  final android = flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();
  if (android == null) return;

  await android.createNotificationChannel(
    const AndroidNotificationChannel(
      NotificationService.forecastChannelId,
      NotificationService.forecastChannelName,
      importance: Importance.max,
    ),
  );
  await android.createNotificationChannel(
    const AndroidNotificationChannel(
      NotificationService.persistentChannelId,
      NotificationService.persistentChannelName,
      description: 'Current weather in the status bar',
      importance: Importance.low,
    ),
  );
}

/// Prepares a background isolate for widget and notification updates.
Future<void> prepareBackgroundIsolate() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await _initializeAppTimeZoneWithFallback();
  await initializeNotificationsPlugin();
}

Future<void> _initializeAppTimeZoneWithFallback() async {
  try {
    await initializeAppTimeZone();
  } catch (e, st) {
    logBackgroundError('initializeAppTimeZone', e, st);
    tz.setLocalLocation(tz.UTC);
  }
}

/// Logs background errors in debug and release (no stack traces in release).
void logBackgroundError(
  String context,
  Object error, [
  StackTrace? stackTrace,
]) {
  debugPrint('RainBackground[$context]: $error');
  if (kDebugMode && stackTrace != null) {
    debugPrint(stackTrace.toString());
  }
}
