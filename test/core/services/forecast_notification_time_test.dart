import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/forecast_notification_time.dart';

void main() {
  group('resolveAlarmEpochMillis', () {
    const timezone = 'Europe/Moscow';
    const offset = 10800;

    test('returns null for past hours except the active hour once', () {
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

      expect(
        resolveAlarmEpochMillis(
          slotTime: DateTime(2026, 6, 17, 13, 0),
          wallNow: DateTime(2026, 6, 17, 16, 5),
          nowMillis: nowMillis,
          realNowMillis: nowMillis,
          slotEpochMillis: pastSlot,
          currentHourAlreadyScheduled: false,
        ),
        isNull,
      );
    });

    test('schedules the active hour with minimum lead time', () {
      final nowMillis = forecastScheduleEpochMillis(
        DateTime(2026, 6, 17, 16, 5),
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
          slotTime: DateTime(2026, 6, 17, 16, 0),
          wallNow: DateTime(2026, 6, 17, 16, 5),
          nowMillis: nowMillis,
          realNowMillis: nowMillis,
          slotEpochMillis: currentSlot,
          currentHourAlreadyScheduled: false,
        ),
        nowMillis + forecastNotificationMinimumLeadMillis,
      );
    });
  });
}
