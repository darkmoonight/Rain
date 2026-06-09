import 'package:isar_community/isar.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/data/models/db.dart';

/// Re-saves weather caches when the Isar schema changes (Isar migration recipe).
///
/// Returns `true` when migration ran and [settings] was persisted.
Future<bool> performWeatherCacheMigrationIfNeeded(
  Isar isar,
  Settings settings,
) async {
  if (settings.weatherCacheVersion >= AppConstants.weatherCacheSchemaVersion) {
    return false;
  }

  final mainCaches = await isar.mainWeatherCaches.where().findAll();
  final cards = await isar.weatherCards.where().findAll();

  await isar.writeTxn(() async {
    await isar.mainWeatherCaches.clear();
    await isar.weatherCards.clear();
    if (mainCaches.isNotEmpty) {
      await isar.mainWeatherCaches.putAll(mainCaches);
    }
    if (cards.isNotEmpty) {
      await isar.weatherCards.putAll(cards);
    }
    settings.weatherCacheVersion = AppConstants.weatherCacheSchemaVersion;
    await isar.settings.put(settings);
  });
  return true;
}
