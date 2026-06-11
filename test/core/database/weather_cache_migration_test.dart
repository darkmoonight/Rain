import '../../helpers/fixtures.dart';
import '../../helpers/isar_test_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/database/weather_cache_migration.dart';
import 'package:rain/data/models/db.dart';

void main() {
  late TestIsarContext ctx;

  setUp(() async {
    ctx = await openTestIsar();
  });

  test('skips when cache version is already current', () async {
    final settings = Settings()
      ..weatherCacheVersion = AppConstants.weatherCacheSchemaVersion;
    await ctx.isar.writeTxn(() => ctx.isar.settings.put(settings));

    final migrated = await performWeatherCacheMigrationIfNeeded(
      ctx.isar,
      settings,
    );

    expect(migrated, isFalse);
  });

  test(
    'migration keeps rows with valid time and drops corrupted rows',
    () async {
      final settings = Settings()..weatherCacheVersion = 2;
      await ctx.isar.writeTxn(() => ctx.isar.settings.put(settings));

      final valid = sampleMainWeatherCache();
      final corrupted = sampleMainWeatherCache()
        ..time = []
        ..id = 2;
      await ctx.isar.writeTxn(() async {
        await ctx.isar.mainWeatherCaches.putAll([valid, corrupted]);
      });

      final migrated = await performWeatherCacheMigrationIfNeeded(
        ctx.isar,
        settings,
      );

      expect(migrated, isTrue);
      expect(
        settings.weatherCacheVersion,
        AppConstants.weatherCacheSchemaVersion,
      );

      final caches = await ctx.isar.mainWeatherCaches.where().findAll();
      expect(caches, hasLength(1));
      expect(caches.single.time, valid.time);
    },
  );

  test('migration drops corrupted weather cards', () async {
    final settings = Settings()..weatherCacheVersion = 2;
    await ctx.isar.writeTxn(() => ctx.isar.settings.put(settings));

    final valid = completeWeatherCard();
    final corrupted = completeWeatherCard()
      ..time = []
      ..id = 2;
    await ctx.isar.writeTxn(() async {
      await ctx.isar.weatherCards.putAll([valid, corrupted]);
    });

    final migrated = await performWeatherCacheMigrationIfNeeded(
      ctx.isar,
      settings,
    );

    expect(migrated, isTrue);
    final cards = await ctx.isar.weatherCards.where().findAll();
    expect(cards, hasLength(1));
    expect(cards.single.city, valid.city);
  });
}
