import 'dart:io';
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

/// Android-specific implementation of [flutterLocalNotificationsPlugin], if available.
AndroidFlutterLocalNotificationsPlugin? get androidNotificationsPlugin {
  try {
    return flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
  } catch (_) {
    return null;
  }
}

/// Legacy forecast channel ids (pre-split and pre-v3 sound-channel rotation).
const _legacyForecastChannelIds = [
  NotificationService.legacyForecastChannelId,
  NotificationService.legacyPreSplitSoundChannelId,
  NotificationService.legacyForecastSoundChannelId,
  NotificationService.legacyForecastSoundChannelIdV2,
];

/// Default system notification sound for sounding forecast channels.
const _defaultNotificationSound = UriAndroidNotificationSound(
  NotificationService.defaultNotificationSoundUri,
);

/// Removes obsolete Android channels so users are not stuck with muted/legacy ids.
///
/// Called on every plugin init (fresh installs) and during channel schema migration
/// (upgrades) before recreating forecast channels.
Future<void> deleteLegacyForecastNotificationChannels() async {
  final android = androidNotificationsPlugin;
  if (android == null) return;

  for (final channelId in _legacyForecastChannelIds) {
    try {
      await android.deleteNotificationChannel(channelId: channelId);
    } catch (_) {
      // Channel may not exist on fresh installs.
    }
  }
}

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

/// Creates Android notification channels for forecast and persistent weather alerts.
Future<void> _ensureAndroidNotificationChannels() async {
  final android = androidNotificationsPlugin;
  if (android == null) return;

  await deleteLegacyForecastNotificationChannels();

  await android.createNotificationChannel(
    const AndroidNotificationChannel(
      NotificationService.forecastChannelId,
      NotificationService.forecastChannelName,
      description: NotificationService.forecastChannelDescription,
      importance: Importance.high,
      playSound: false,
      enableVibration: false,
    ),
  );

  final soundChannelId = await _createVerifiedForecastSoundChannel(android);
  NotificationService.setActiveForecastSoundChannelId(soundChannelId);

  await android.createNotificationChannel(
    const AndroidNotificationChannel(
      NotificationService.persistentChannelId,
      NotificationService.persistentChannelName,
      description: NotificationService.persistentChannelDescription,
      importance: Importance.low,
    ),
  );
}

AndroidNotificationChannel _forecastSoundChannel(String id) =>
    AndroidNotificationChannel(
      id,
      NotificationService.forecastSoundChannelName,
      description: NotificationService.forecastSoundChannelDescription,
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
      sound: _defaultNotificationSound,
      audioAttributesUsage: AudioAttributesUsage.notification,
    );

/// Creates the primary sound channel; falls back to V3b if OEM reports no sound.
Future<String> _createVerifiedForecastSoundChannel(
  AndroidFlutterLocalNotificationsPlugin android,
) async {
  const primary = NotificationService.forecastSoundChannelIdPrimary;
  const fallback = NotificationService.forecastSoundChannelIdFallback;

  await android.createNotificationChannel(_forecastSoundChannel(primary));
  if (await _channelReportsSound(android, primary)) return primary;

  logBackgroundError(
    '_createVerifiedForecastSoundChannel',
    'Primary sound channel $primary reports no sound; trying $fallback',
  );
  try {
    await android.deleteNotificationChannel(channelId: primary);
  } catch (_) {
    // Continue with fallback even if delete fails.
  }
  await android.createNotificationChannel(_forecastSoundChannel(fallback));
  return fallback;
}

Future<bool> _channelReportsSound(
  AndroidFlutterLocalNotificationsPlugin android,
  String channelId,
) async {
  try {
    final channels = await android.getNotificationChannels();
    if (channels == null) return true; // Unable to verify; assume OK.
    for (final channel in channels) {
      if (channel.id != channelId) continue;
      return channel.playSound;
    }
    // Channel missing from list — treat as failure so fallback can run.
    return false;
  } catch (e, st) {
    logBackgroundError('_channelReportsSound', e, st);
    return true;
  }
}

/// Requests the Android post-notification permission when running on Android.
Future<bool> requestAndroidNotificationPermission() async {
  if (!Platform.isAndroid) return true;

  final result = await androidNotificationsPlugin
      ?.requestNotificationsPermission();
  return result != false;
}

/// Requests permissions needed for scheduled forecast notifications.
Future<bool> requestForecastNotificationPermissions() async {
  if (Platform.isIOS) {
    final result = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions();
    return result != false;
  }

  final android = androidNotificationsPlugin;
  await android?.requestExactAlarmsPermission();
  final result = await android?.requestNotificationsPermission();
  return result != false;
}

/// Prepares a background isolate for notification and timezone work.
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

void logBackgroundError(
  String context,
  Object error, [
  StackTrace? stackTrace,
]) {
  if (!kDebugMode) return;
  debugPrint('RainBackground[$context]: $error');
  if (stackTrace != null) {
    debugPrint(stackTrace.toString());
  }
}
