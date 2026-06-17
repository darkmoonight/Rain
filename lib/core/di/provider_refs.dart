import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:rain/core/bootstrap/app_bootstrap.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/services/home_widget_service.dart';
import 'package:rain/core/services/location_service.dart';
import 'package:rain/core/services/notification_service.dart';
import 'package:rain/core/services/widget_settings_service.dart';
import 'package:rain/data/datasources/weather_local_datasource.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/data/repositories/cities_repository.dart';
import 'package:rain/core/di/settings_revision.dart';
import 'package:rain/data/repositories/settings_repository.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/core/weather/weather_icon_theme.dart';
import 'package:rain/data/repositories/weather_repository.dart';

/// Riverpod providers for bootstrap state, services, and repositories.

/// Provides the app bootstrap container; must be overridden at startup.
final bootstrapProvider = Provider<AppBootstrap>((ref) {
  throw UnimplementedError('bootstrapProvider must be overridden');
});

/// Provides the shared [Isar] database from [bootstrapProvider].
final isarProvider = Provider<Isar>((ref) => ref.watch(bootstrapProvider).isar);

/// Provides persisted [Settings], refreshing when [settingsRevisionProvider] changes.
final settingsProvider = Provider<Settings>((ref) {
  ref.watch(settingsRevisionProvider);
  return ref.watch(bootstrapProvider).settings;
});

/// Asset root for the selected weather icon theme.
final weatherIconAssetRootProvider = Provider<String>((ref) {
  ref.watch(settingsRevisionProvider);
  return WeatherIconTheme.assetRoot(
    ref.watch(settingsProvider).weatherIconTheme,
  );
});

/// Maps WMO weather codes to icons for the selected weather icon theme.
final statusWeatherProvider = Provider<StatusWeather>((ref) {
  return StatusWeather(assetRoot: ref.watch(weatherIconAssetRootProvider));
});

/// Provides the primary location cache from [bootstrapProvider].
final locationCacheProvider = Provider<LocationCache>((ref) {
  return ref.watch(bootstrapProvider).locationCache;
});

/// Copies [source] fields into the bootstrap-held location cache instance.
void syncBootstrapLocationCache(Ref ref, LocationCache source) {
  final target = ref.read(bootstrapProvider).locationCache;
  target.lat = source.lat;
  target.lon = source.lon;
  target.city = source.city;
  target.district = source.district;
}

/// Provides the asset cache service for weather icons and images.
final assetCacheServiceProvider = Provider<AssetCacheService>(
  (ref) => AssetCacheService(),
);

/// Provides the local notification scheduling service.
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService(ref.watch(assetCacheServiceProvider));
});

/// Provides the home-screen widget update service.
final homeWidgetServiceProvider = Provider<HomeWidgetService>((ref) {
  return HomeWidgetService(ref.watch(assetCacheServiceProvider));
});

/// Provides widget appearance persistence and refresh orchestration.
final widgetSettingsServiceProvider = Provider<WidgetSettingsService>(
  (ref) => WidgetSettingsService(ref),
);

/// Provides the device geolocation service.
final locationServiceProvider = Provider<LocationService>(
  (ref) => LocationService(),
);

/// Provides the remote weather API datasource.
final weatherRemoteDatasourceProvider = Provider<WeatherRemoteDatasource>(
  (ref) => WeatherRemoteDatasource(),
);

/// Provides the local Isar-backed weather cache datasource.
final weatherLocalDatasourceProvider = Provider<WeatherLocalDatasource>(
  (ref) => WeatherLocalDatasource(ref.watch(isarProvider)),
);

/// Provides the weather repository combining remote and local sources.
final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepository(
    ref.watch(weatherRemoteDatasourceProvider),
    ref.watch(weatherLocalDatasourceProvider),
  );
});

/// Provides the saved cities repository.
final citiesRepositoryProvider = Provider<CitiesRepository>((ref) {
  return CitiesRepository(
    ref.watch(isarProvider),
    ref.watch(weatherRemoteDatasourceProvider),
  );
});

/// Provides the settings repository and notifies on save.
final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => SettingsRepository(
    ref.watch(isarProvider),
    onSaved: () => notifySettingsChanged(ref),
  ),
);
