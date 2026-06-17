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
          slotEpochMillis: pastSlot,
        ),
        isNull,
      );
      expect(
        resolveAlarmEpochMillis(
          nowMillis: nowMillis,
          slotEpochMillis: currentSlot,
        ),
        isNull,
        reason: 'active hour must not be re-scheduled on every reschedule',
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
          slotEpochMillis: nextHour,
        ),
        nowMillis + forecastNotificationMinimumLeadMillis,
      );
    });
  });
}
