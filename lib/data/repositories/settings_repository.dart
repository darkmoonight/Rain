import 'package:isar_community/isar.dart';
import 'package:rain/data/models/db.dart';

/// Reads and writes app settings and reads the primary location cache from Isar.
class SettingsRepository {
  SettingsRepository(this._isar, {this.onSaved});

  final Isar _isar;
  final void Function()? onSaved;

  /// Returns stored settings, or defaults when no row exists yet.
  Future<Settings> getSettings() async =>
      await _isar.settings.where().findFirst() ?? Settings();

  /// Persists settings and invokes [onSaved] when provided.
  Future<void> save(Settings settings) async {
    await _isar.writeTxn(() => _isar.settings.put(settings));
    onSaved?.call();
  }

  /// Returns the stored location cache, or an empty model if none exists.
  Future<LocationCache> getLocationCache() async =>
      await _isar.locationCaches.where().findFirst() ?? LocationCache();
}
