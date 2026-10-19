import 'package:isar_community/isar.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/services/notification_service.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/data/mappers/domain_mapper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/domain/entities/app_settings.dart';
import 'package:rain/domain/entities/weather_forecast.dart';

typedef NotificationIsarPayload = ({
  AppSettings settings,
  WeatherForecast? cache,
  String cityLabel,
});

Future<NotificationIsarPayload> _notificationPayloadFromIsar(Isar isar) async {
  final settings = DomainMapper.settingsToDomain(
    await isar.settings.where().findFirst() ?? Settings(),
  );
  final cache = await isar.mainWeatherCaches.where().findFirst();
  final location = await isar.locationCaches.where().findFirst();
  return (
    settings: settings,
    cache: cache == null ? null : DomainMapper.forecastToDomain(cache),
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
  final appSettings = AppSettingsState.fromAppSettings(payload.settings);

  await service.ensureForecastNotificationsScheduled(
    cache: payload.cache!,
    settings: payload.settings,
    appSettings: appSettings,
    cityLabel: payload.cityLabel,
  );
}
