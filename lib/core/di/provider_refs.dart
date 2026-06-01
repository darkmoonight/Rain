import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:rain/core/bootstrap/app_bootstrap.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/services/connectivity_service.dart';
import 'package:rain/core/services/home_widget_service.dart';
import 'package:rain/core/services/location_service.dart';
import 'package:rain/core/services/notification_service.dart';
import 'package:rain/data/datasources/weather_local_datasource.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/data/repositories/cities_repository.dart';
import 'package:rain/core/di/settings_revision.dart';
import 'package:rain/data/repositories/settings_repository.dart';
import 'package:rain/data/repositories/weather_repository.dart';

final bootstrapProvider = Provider<AppBootstrap>((ref) {
  throw UnimplementedError('bootstrapProvider must be overridden');
});

final isarProvider = Provider<Isar>((ref) => ref.watch(bootstrapProvider).isar);

final settingsProvider = Provider<Settings>((ref) {
  ref.watch(settingsRevisionProvider);
  return ref.watch(bootstrapProvider).settings;
});

final locationCacheProvider = Provider<LocationCache>((ref) {
  return ref.watch(bootstrapProvider).locationCache;
});

void syncBootstrapLocationCache(Ref ref, LocationCache source) {
  final target = ref.read(bootstrapProvider).locationCache;
  target.lat = source.lat;
  target.lon = source.lon;
  target.city = source.city;
  target.district = source.district;
}

final assetCacheServiceProvider = Provider<AssetCacheService>(
  (ref) => AssetCacheService(),
);

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService(ref.watch(assetCacheServiceProvider));
});

final homeWidgetServiceProvider = Provider<HomeWidgetService>((ref) {
  return HomeWidgetService(ref.watch(assetCacheServiceProvider));
});

final locationServiceProvider = Provider<LocationService>(
  (ref) => LocationService(),
);

final weatherRemoteDatasourceProvider = Provider<WeatherRemoteDatasource>((
  ref,
) {
  final ds = WeatherRemoteDatasource(settings: ref.watch(settingsProvider));
  ref.listen(settingsProvider, (_, next) => ds.updateSettings(next));
  return ds;
});

final weatherLocalDatasourceProvider = Provider<WeatherLocalDatasource>(
  (ref) => WeatherLocalDatasource(ref.watch(isarProvider)),
);

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepository(
    ref.watch(weatherRemoteDatasourceProvider),
    ref.watch(weatherLocalDatasourceProvider),
  );
});

final citiesRepositoryProvider = Provider<CitiesRepository>((ref) {
  return CitiesRepository(
    ref.watch(isarProvider),
    ref.watch(weatherRemoteDatasourceProvider),
  );
});

final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => SettingsRepository(
    ref.watch(isarProvider),
    onSaved: () => notifySettingsChanged(ref),
  ),
);

final connectivityProvider = Provider<Future<bool>>(
  (ref) => ConnectivityService.hasInternet(),
);
