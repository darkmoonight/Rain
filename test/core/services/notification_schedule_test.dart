import '../../helpers/fixtures.dart';
import '../../helpers/test_helpers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/notification_service.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/data/models/db.dart';

void main() {
  setUpAll(initTestEnvironment);

  group('buildWeatherNotificationSlots', () {
    test('returns empty list when cache has no hourly data', () {
      final slots = buildWeatherNotificationSlots(
        cache: MainWeatherCache(),
        settings: Settings(),
        appSettings: const AppSettingsState(),
        cityLabel: 'Moscow',
      );

      expect(slots, isEmpty);
    });

    test('skips notifications outside configured time window', () {
      final cache = sampleMainWeatherCache();
      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '23:00',
          timeEnd: '23:30',
        ),
        cityLabel: 'Moscow',
        now: DateTime(2026, 6, 5, 12),
      );

      expect(slots, isEmpty);
    });

    test('builds slots for future hours inside time window', () {
      final cache = sampleMainWeatherCache();
      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '00:00',
          timeEnd: '23:59',
          timeRange: 1,
        ),
        cityLabel: 'Moscow',
        now: DateTime(2026, 6, 5, 11),
      );

      expect(slots, isNotEmpty);
      expect(slots.first.title, contains('Moscow'));
    });

    test('creates one slot per hour when multiple daily rows match', () {
      final cache = sampleMainWeatherCache()
        ..timeDaily = [DateTime(2026, 6, 5), DateTime(2026, 6, 5)]
        ..sunrise = ['06:00', '06:01']
        ..sunset = ['18:00', '18:01'];

      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '00:00',
          timeEnd: '23:59',
          timeRange: 1,
        ),
        cityLabel: 'Moscow',
        now: DateTime(2026, 6, 5, 11),
      );

      expect(slots.where((slot) => slot.time.hour == 13).length, 1);
    });

    test('builds slots for the next calendar day', () {
      final cache = sampleMainWeatherCache()
        ..time = ['2026-06-05T18:00', '2026-06-06T08:00', '2026-06-06T09:00']
        ..temperature2M = [20.0, 19.0, 20.0]
        ..weathercode = [0, 1, 0];

      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '08:00',
          timeEnd: '20:00',
          timeRange: 1,
        ),
        cityLabel: 'Moscow',
        now: DateTime(2026, 6, 5, 18),
      );

      expect(slots.any((slot) => slot.time.day == 6), isTrue);
    });

    test('includes hours at the end of the notification window', () {
      final cache = sampleMainWeatherCache()..time = ['2026-06-05T20:00'];

      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '08:00',
          timeEnd: '20:00',
        ),
        cityLabel: 'Moscow',
        now: DateTime(2026, 6, 5, 12),
      );

      expect(slots, hasLength(1));
      expect(slots.first.time.hour, 20);
    });

    test('supports overnight notification windows', () {
      final cache = sampleMainWeatherCache()
        ..time = ['2026-06-05T23:00', '2026-06-06T01:00'];

      final slots = buildWeatherNotificationSlots(
        cache: cache,
        settings: Settings(),
        appSettings: const AppSettingsState(
          timeStart: '22:00',
          timeEnd: '08:00',
        ),
        cityLabel: 'Moscow',
        now: DateTime(2026, 6, 5, 12),
      );

      expect(slots.map((slot) => slot.time.hour), containsAll([23, 1]));
    });
  });
}
