import 'package:isar_community/isar.dart';
import 'package:rain/data/models/db.dart';

class SettingsRepository {
  SettingsRepository(this._isar, {this.onSaved});

  final Isar _isar;
  final void Function()? onSaved;

  Future<Settings> getSettings() async =>
      await _isar.settings.where().findFirst() ?? Settings();

  Future<void> save(Settings settings) async {
    await _isar.writeTxn(() => _isar.settings.put(settings));
    onSaved?.call();
  }

  Future<LocationCache> getLocationCache() async =>
      await _isar.locationCaches.where().findFirst() ?? LocationCache();
}
