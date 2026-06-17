import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/forecast_notification_time.dart';

void main() {
  group('resolveAlarmEpochMillis', () {
    const timezone = 'Europe/Moscow';
    const offset = 10800;

    test('returns null for hours that already started', () {
      final nowMillis = forecastScheduleEpochMillis(
        DateTime(2026, 6, 17, 16, 5),
        timezone,
        utcOffsetSeconds: offset,
      );
      final pastSlot = forecastScheduleEpochMillis(
        DateTime(2026, 6, 17, 13, 0),
        timezone,
        utcOffsetSeconds: offset,
      );
      final currentSlot = forecastScheduleEpochMillis(
        DateTime(2026, 6, 17, 16, 0),
        timezone,
        utcOffsetSeconds: offset,
      );

      expect(
        resolveAlarmEpochMillis(
          nowMillis: nowMillis,
          deviceNowMillis: nowMillis,
          slotEpochMillis: pastSlot,
        ),
        isNull,
      );
      expect(
        resolveAlarmEpochMillis(
          nowMillis: nowMillis,
          deviceNowMillis: nowMillis,
          slotEpochMillis: currentSlot,
        ),
        isNull,
      );
    });

    test('bumps near-future hours to minimum lead time', () {
      final nowMillis = forecastScheduleEpochMillis(
        DateTime(2026, 6, 17, 16, 59, 30),
        timezone,
        utcOffsetSeconds: offset,
      );
      final nextHour = forecastScheduleEpochMillis(
        DateTime(2026, 6, 17, 17, 0),
        timezone,
        utcOffsetSeconds: offset,
      );

      expect(
        resolveAlarmEpochMillis(
          nowMillis: nowMillis,
          deviceNowMillis: nowMillis,
          slotEpochMillis: nextHour,
        ),
        nowMillis + forecastNotificationMinimumLeadMillis,
      );
    });
  });

  group('alignScheduleEpochForPlugin', () {
    test('bumps schedules inside the plugin lead window', () {
      const deviceNow = 1_000_000_000_000;
      const almostNow = deviceNow + 30_000;

      expect(
        alignScheduleEpochForPlugin(
          scheduleEpochMillis: almostNow,
          deviceNowMillis: deviceNow,
        ),
        deviceNow + forecastNotificationMinimumLeadMillis,
      );
    });

    test('returns null for schedules far in the past', () {
      const deviceNow = 1_000_000_000_000;

      expect(
        alignScheduleEpochForPlugin(
          scheduleEpochMillis: deviceNow - 3600000,
          deviceNowMillis: deviceNow,
        ),
        isNull,
      );
    });
  });
}
