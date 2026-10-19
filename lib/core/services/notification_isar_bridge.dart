import 'package:isar_community/isar.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/services/notification_service.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/data/models/db.dart';

typedef NotificationIsarPayload = ({
  Settings settings,
  MainWeatherCache? cache,
  String cityLabel,
});

Future<NotificationIsarPayload> _notificationPayloadFromIsar(Isar isar) async {
  final settings = await isar.settings.where().findFirst() ?? Settings();
  final cache = await isar.mainWeatherCaches.where().findFirst();
  final location = await isar.locationCaches.where().findFirst();
  return (
    settings: settings,
    cache: cache,
    cityLabel: location?.displayLabel ?? '',
  );
}

/// Background Isar callbacks run outside Riverpod; each call gets a fresh service.
NotificationService _backgroundNotificationService() =>
    NotificationService(AssetCacheService());

Future<void> updatePersistentNotificationFromIsar(Isar isar) async {
  final payload = await _notificationPayloadFromIsar(isar);
  if (!payload.settings.persistentNotification || payload.cache == null) {
    return;
  }

  await _backgroundNotificationService().updatePersistentNotification(
    cache: payload.cache!,
    settings: payload.settings,
    cityLabel: payload.cityLabel,
  );
}

/// Top-up forecast alarms and drop stale pending ones while the app is backgrounded.
Future<void> replenishForecastNotificationsFromIsar(Isar isar) async {
  final payload = await _notificationPayloadFromIsar(isar);
  if (!payload.settings.notifications || payload.cache == null) return;

  final service = _backgroundNotificationService();
  final appSettings = AppSettingsState.fromSettings(payload.settings);

  await service.ensureForecastNotificationsScheduled(
    cache: payload.cache!,
    settings: payload.settings,
    appSettings: appSettings,
    cityLabel: payload.cityLabel,
  );
}
