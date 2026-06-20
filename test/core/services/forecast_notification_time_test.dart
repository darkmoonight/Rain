import '../../helpers/fixtures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/forecast_notification_time.dart';
import 'package:rain/core/services/notification_service.dart';
import 'package:rain/data/models/db.dart';

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

  group('isForecastNotificationExpired', () {
    test('treats hour as expired after grace window', () {
      const epoch = 1_000_000_000_000;
      expect(isForecastNotificationExpired(epoch, epoch + 1000), isFalse);
      expect(
        isForecastNotificationExpired(
          epoch,
          epoch + forecastNotificationDeliveryGraceMillis,
        ),
        isTrue,
      );
    });
  });

  group('expiredForecastNotificationIds', () {
    test('returns ids for past hours still pending', () {
      const timezone = 'Europe/Moscow';
      const offset = 10800;
      final cache = sampleMainWeatherCache()
        ..time = ['2026-06-17T22:00', '2026-06-17T23:00', '2026-06-18T00:00']
        ..timeDaily = [DateTime(2026, 6, 17), DateTime(2026, 6, 18)]
        ..sunrise = ['06:00', '06:00']
        ..sunset = ['21:00', '21:00']
        ..temperature2M = [20.0, 21.0, 22.0]
        ..weathercode = [0, 1, 2];
      final nowMillis = forecastScheduleEpochMillis(
        DateTime(2026, 6, 18, 0, 10),
        timezone,
        utcOffsetSeconds: offset,
      );

      final expired = expiredForecastNotificationIds(
        cache: cache,
        settings: Settings(),
        notificationIdForEpoch: NotificationService.notificationIdForEpoch,
        referenceNowMillis: nowMillis,
      );

      final hour22 = NotificationService.notificationIdForEpoch(
        forecastScheduleEpochMillis(
          DateTime(2026, 6, 17, 22),
          timezone,
          utcOffsetSeconds: offset,
        ),
      );
      final hour23 = NotificationService.notificationIdForEpoch(
        forecastScheduleEpochMillis(
          DateTime(2026, 6, 17, 23),
          timezone,
          utcOffsetSeconds: offset,
        ),
      );

      expect(expired, containsAll([hour22, hour23]));
      expect(
        expired,
        isNot(
          contains(
            NotificationService.notificationIdForEpoch(
              forecastScheduleEpochMillis(
                DateTime(2026, 6, 18, 0),
                timezone,
                utcOffsetSeconds: offset,
              ),
            ),
          ),
        ),
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
