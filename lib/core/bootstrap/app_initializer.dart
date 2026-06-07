import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:display_mode/display_mode.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:home_widget/home_widget.dart';
import 'package:isar_community/isar.dart';
import 'package:rain/core/bootstrap/app_bootstrap.dart';
import 'package:rain/core/database/isar_schemas.dart';
import 'package:rain/core/config/app_config.dart';
import 'package:rain/i18n/locale_utils.dart';
import 'package:rain/i18n/strings.g.dart';
import 'package:rain/core/services/connectivity_service.dart';
import 'package:rain/core/services/home_widget_service.dart';
import 'package:rain/core/utils/device_info.dart';
import 'package:rain/data/models/db.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:workmanager/workmanager.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// One-time startup: DB, locale, notifications, widgets, and platform hooks.
class AppInitializer {
  /// Runs all bootstrap steps and returns the loaded [AppBootstrap].
  static Future<AppBootstrap> initialize() async {
    ConnectivityService.setup();
    await _initializeTimeZone();
    final bootstrap = await _initializeIsar();
    await _initializeNotifications();
    if (Platform.isAndroid) {
      await _setOptimalDisplayMode();
      Workmanager().initialize(callbackDispatcher);
      Future.microtask(HomeWidgetService.updateFromDisk);
    }
    if (Platform.isIOS) {
      HomeWidget.setAppGroupId(appGroupId);
    }
    await DeviceFeature().init();
    return bootstrap;
  }

  /// Loads the device timezone into the timezone package.
  static Future<void> _initializeTimeZone() async {
    final timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(timeZoneName.identifier));
  }

  /// Opens Isar, seeds default settings, and applies the stored locale.
  static Future<AppBootstrap> _initializeIsar() async {
    final isar = await openRainIsar();

    var settings = await isar.settings.where().findFirst() ?? Settings();
    var locationCache =
        await isar.locationCaches.where().findFirst() ?? LocationCache();

    final seeded = seedDefaultSettings(
      settings,
      PlatformDispatcher.instance.locale,
    );
    if (seeded) {
      await isar.writeTxn(() => isar.settings.put(settings));
    }

    await LocaleSettings.setLocale(
      appLocaleFromLanguageCode(settings.language),
    );

    return AppBootstrap(
      isar: isar,
      settings: settings,
      locationCache: locationCache,
    );
  }

  /// Initializes the local notifications plugin, ignoring failures in debug.
  static Future<void> _initializeNotifications() async {
    try {
      const initializationSettings = InitializationSettings(
        android: AndroidInitializationSettings('ic_notification'),
        iOS: DarwinInitializationSettings(),
        linux: LinuxInitializationSettings(defaultActionName: 'Rain'),
      );
      await flutterLocalNotificationsPlugin.initialize(
        settings: initializationSettings,
      );
    } catch (e, st) {
      if (kDebugMode) {
        debugPrint('Notification init failed: $e\n$st');
      }
    }
  }

  /// Picks the highest refresh rate matching the current display resolution.
  static Future<void> _setOptimalDisplayMode() async {
    final supported = await FlutterDisplayMode.supported;
    final active = await FlutterDisplayMode.active;
    final sameResolution =
        supported
            .where((m) => m.width == active.width && m.height == active.height)
            .toList()
          ..sort((a, b) => b.refreshRate.compareTo(a.refreshRate));
    final mostOptimalMode = sameResolution.isNotEmpty
        ? sameResolution.first
        : active;
    await FlutterDisplayMode.setPreferredMode(mostOptimalMode);
  }
}

/// Workmanager entry point that refreshes home widgets from disk.
@pragma('vm:entry-point')
void callbackDispatcher() => Workmanager().executeTask((task, inputData) async {
  return HomeWidgetService.updateFromDisk();
});

/// Seeds missing language and theme defaults on [settings].
///
/// Returns `true` when [settings] was modified and should be persisted.
@visibleForTesting
bool seedDefaultSettings(Settings settings, Locale deviceLocale) {
  var changed = false;

  if (settings.language == null) {
    settings.language =
        '${deviceLocale.languageCode}_${deviceLocale.countryCode}';
    changed = true;
  }

  if (settings.theme == null) {
    settings.theme = 'system';
    changed = true;
  }

  return changed;
}
