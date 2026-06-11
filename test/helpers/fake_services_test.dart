import 'fake_services.dart';
import 'isar_test_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/data/models/db.dart';

void main() {
  group('FakeLocationService', () {
    test('returns configured place', () async {
      final service = FakeLocationService();
      final place = await service.getCurrentPlace();

      expect(place?.city, 'Moscow');
      expect(place?.lat, 55.75);
    });

    test('reports service enabled flag', () async {
      final service = FakeLocationService(serviceEnabled: false);
      expect(await service.isServiceEnabled(), isFalse);
    });
  });

  group('FakeNotificationService', () {
    test('cancelScheduled increments counter', () async {
      final service = FakeNotificationService();
      await service.cancelScheduled();
      await service.cancelScheduled();

      expect(service.cancelScheduledCalls, 2);
    });

    test('cancelAll increments counter', () async {
      final service = FakeNotificationService();
      await service.cancelAll();
      await service.cancelAll();

      expect(service.cancelAllCalls, 2);
    });

    test('rescheduleForWeather increments counter', () async {
      final service = FakeNotificationService();
      await service.rescheduleForWeather(
        cache: MainWeatherCache(),
        settings: Settings(),
        appSettings: const AppSettingsState(),
        cityLabel: 'Moscow',
      );

      expect(service.rescheduleCalls, 1);
    });
  });

  group('FakeHomeWidgetService', () {
    test('updateFromIsar increments counter', () async {
      final service = FakeHomeWidgetService();
      final isarContext = await openTestIsar();

      expect(await service.updateFromIsar(isarContext.isar), isTrue);
      expect(service.updateCalls, 1);
    });
  });
}
