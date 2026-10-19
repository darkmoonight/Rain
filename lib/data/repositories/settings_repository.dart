import 'package:isar_community/isar.dart';
import 'package:rain/data/mappers/domain_mapper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/domain/entities/app_settings.dart';
import 'package:rain/domain/entities/geo_place.dart';
import 'package:rain/domain/repositories/settings_repository.dart';

/// Isar implementation of [SettingsRepository].
class IsarSettingsRepository implements SettingsRepository {
  IsarSettingsRepository(this._isar, {this.onSaved});

  final Isar _isar;
  final void Function()? onSaved;

  @override
  Future<AppSettings> getSettings() async {
    final settings = await _isar.settings.where().findFirst() ?? Settings();
    return DomainMapper.settingsToDomain(settings);
  }

  @override
  Future<void> save(AppSettings settings) async {
    final existing = await _isar.settings.where().findFirst();
    final isar = DomainMapper.settingsToIsar(settings, existing: existing);
    await _isar.writeTxn(() => _isar.settings.put(isar));
    onSaved?.call();
  }

  @override
  Future<void> persistClockSkew(int clockSkewSeconds) async {
    final existing = await _isar.settings.where().findFirst() ?? Settings();
    if (existing.clockSkewSeconds == clockSkewSeconds) return;
    existing.clockSkewSeconds = clockSkewSeconds;
    await _isar.writeTxn(() => _isar.settings.put(existing));
    onSaved?.call();
  }

  @override
  Future<GeoPlace> getLocationCache() async {
    final location =
        await _isar.locationCaches.where().findFirst() ?? LocationCache();
    return DomainMapper.placeToDomain(location);
  }
}
