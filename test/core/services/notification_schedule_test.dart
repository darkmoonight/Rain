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
  });
}
