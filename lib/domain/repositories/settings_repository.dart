import 'package:rain/domain/entities/app_settings.dart';
import 'package:rain/domain/entities/geo_place.dart';

/// Port for app settings persistence.
abstract class SettingsRepository {
  /// Returns stored settings, or defaults when no row exists yet.
  Future<AppSettings> getSettings();

  /// Persists [settings] and notifies listeners when configured.
  Future<void> save(AppSettings settings);

  /// Updates clock skew when it differs from the stored value.
  Future<void> persistClockSkew(int clockSkewSeconds);

  /// Returns the stored primary location, or an empty place if none exists.
  Future<GeoPlace> getLocationCache();
}
