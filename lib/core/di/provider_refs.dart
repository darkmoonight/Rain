import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rain/core/bootstrap/app_bootstrap.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/services/home_widget_service.dart';
import 'package:rain/core/services/location_service.dart';
import 'package:rain/core/services/notification_service.dart';
import 'package:rain/core/services/widget_settings_service.dart';
import 'package:rain/data/datasources/weather_local_datasource.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/data/mappers/domain_mapper.dart';
import 'package:rain/data/repositories/cities_repository.dart';
import 'package:rain/core/di/settings_revision.dart';
import 'package:rain/data/repositories/settings_repository.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/core/weather/weather_icon_theme.dart';
import 'package:rain/data/repositories/weather_repository.dart';
import 'package:rain/domain/entities/app_settings.dart';
import 'package:rain/domain/entities/geo_place.dart';
import 'package:rain/domain/repositories/cities_repository.dart';
import 'package:rain/domain/repositories/settings_repository.dart';
import 'package:rain/domain/repositories/weather_repository.dart';

/// Riverpod providers for bootstrap state, services, and repositories.

/// Provides the app bootstrap container; must be overridden at startup.
final bootstrapProvider = Provider<AppBootstrap>((ref) {
  throw UnimplementedError('bootstrapProvider must be overridden');
});

/// Provides the shared [Isar] database from [bootstrapProvider].
final isarProvider = Provider<Isar>((ref) => ref.watch(bootstrapProvider).isar);

/// Provides domain [AppSettings], refreshing when [settingsRevisionProvider] changes.
final settingsProvider = Provider<AppSettings>((ref) {
  ref.watch(settingsRevisionProvider);
  return DomainMapper.settingsToDomain(ref.watch(bootstrapProvider).settings);
});

/// Installed app version from the platform package info.
final appVersionProvider = FutureProvider<String>((ref) async {
  final packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
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

/// Provides the primary location as a domain [GeoPlace].
final locationCacheProvider = Provider<GeoPlace>((ref) {
  return DomainMapper.placeToDomain(ref.watch(bootstrapProvider).locationCache);
});

/// Copies [source] fields into the bootstrap-held Isar location cache instance.
///
/// Invalidates [locationCacheProvider] so dependents see a fresh [GeoPlace]
/// copy (in-place Isar mutations alone do not notify Riverpod).
void syncBootstrapLocationCache(Ref ref, GeoPlace source) {
  DomainMapper.applyPlaceToIsar(
    source,
    ref.read(bootstrapProvider).locationCache,
  );
  ref.invalidate(locationCacheProvider);
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
  return IsarWeatherRepository(
    ref.watch(weatherRemoteDatasourceProvider),
    ref.watch(weatherLocalDatasourceProvider),
  );
});

/// Provides the saved cities repository.
final citiesRepositoryProvider = Provider<CitiesRepository>((ref) {
  return IsarCitiesRepository(
    ref.watch(isarProvider),
    ref.watch(weatherRemoteDatasourceProvider),
  );
});

/// Provides the settings repository and notifies on save.
final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => IsarSettingsRepository(
    ref.watch(isarProvider),
    onSaved: () => notifySettingsChanged(ref),
  ),
);
