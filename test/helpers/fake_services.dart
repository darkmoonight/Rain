import 'package:isar_community/isar.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/services/home_widget_service.dart';
import 'package:rain/core/services/location_service.dart';
import 'package:rain/core/services/notification_service.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/data/models/db.dart';

/// Fake location service with configurable behavior for tests.
class FakeLocationService extends LocationService {
  FakeLocationService({
    this.serviceEnabled = true,
    this.place = const (
      lat: 55.75,
      lon: 37.62,
      city: 'Moscow',
      district: 'Moscow Oblast',
    ),
  });

  final bool serviceEnabled;
  final ({double lat, double lon, String city, String district})? place;

  @override
  Future<bool> isServiceEnabled() async => serviceEnabled;

  @override
  Future<({double lat, double lon, String city, String district})?>
  getCurrentPlace() async => place;
}

/// No-op notification service for widget and notifier tests.
class FakeNotificationService extends NotificationService {
  FakeNotificationService() : super(AssetCacheService());

  int cancelAllCalls = 0;
  int cancelScheduledCalls = 0;
  int rescheduleCalls = 0;
  int ensureForecastCalls = 0;

  @override
  Future<void> cancelAll() async {
    cancelAllCalls++;
  }

  @override
  Future<void> cancelScheduled() async {
    cancelScheduledCalls++;
  }

  @override
  Future<void> ensureForecastNotificationsScheduled({
    required MainWeatherCache cache,
    required Settings settings,
    required AppSettingsState appSettings,
    required String cityLabel,
  }) async {
    ensureForecastCalls++;
  }

  @override
  Future<void> rescheduleForWeather({
    required MainWeatherCache cache,
    required Settings settings,
    required AppSettingsState appSettings,
    required String cityLabel,
  }) async {
    rescheduleCalls++;
  }
}

/// No-op home widget service for tests.
class FakeHomeWidgetService extends HomeWidgetService {
  FakeHomeWidgetService() : super(AssetCacheService());

  int updateCalls = 0;

  @override
  Future<bool> updateFromIsar(Isar isar, {Settings? settings}) async {
    updateCalls++;
    return true;
  }
}
