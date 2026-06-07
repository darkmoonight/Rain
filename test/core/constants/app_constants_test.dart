import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/constants/app_constants.dart';

void main() {
  group('AppConstants', () {
    test('cache expiry is twelve hours', () {
      expect(AppConstants.cacheExpiry, const Duration(hours: 12));
    });

    test('latitude and longitude bounds are valid', () {
      expect(AppConstants.minLatitude, -90.0);
      expect(AppConstants.maxLatitude, 90.0);
      expect(AppConstants.minLongitude, -180.0);
      expect(AppConstants.maxLongitude, 180.0);
    });

    test('map defaults point to Moscow area', () {
      expect(AppConstants.mapInitialCenterLat, closeTo(55.75, 0.01));
      expect(AppConstants.mapInitialCenterLon, closeTo(37.62, 0.01));
    });

    test('notification defaults are defined', () {
      expect(AppConstants.defaultNotificationIntervalHours, 1);
      expect(AppConstants.defaultNotificationTimeStart, '08:00');
      expect(AppConstants.defaultNotificationTimeEnd, '20:00');
    });
  });
}
