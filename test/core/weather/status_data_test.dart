import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/domain/entities/entities.dart';

import '../../helpers/test_helpers.dart';

void main() {
  setUpAll(() async => initTestEnvironment());

  group('StatusData formatting', () {
    test('formats temperature with unit suffix', () {
      const settings = AppSettings(degrees: 'celsius');
      final status = StatusData(settings: settings);
      expect(status.getDegree(20), '20.0°C');
    });

    test('formats wind speed with localized unit', () {
      const settings = AppSettings(wind: 'kph');
      final status = StatusData(settings: settings);
      expect(status.getSpeed(10), contains('10'));
    });

    test('returns empty strings for null values', () {
      final status = StatusData(settings: const AppSettings());
      expect(status.getDegree(null), '');
      expect(status.getSpeed(null), '');
    });
  });
}
