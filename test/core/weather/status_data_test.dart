import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/data/models/db.dart';

import '../../helpers/test_helpers.dart';

void main() {
  setUpAll(() async => initTestEnvironment());

  group('StatusData formatting', () {
    test('formats temperature with unit suffix', () {
      final settings = Settings()..degrees = 'celsius';
      final status = StatusData(settings: settings);
      expect(status.getDegree(20), '20.0°C');
    });

    test('formats wind speed with localized unit', () {
      final settings = Settings()..wind = 'kph';
      final status = StatusData(settings: settings);
      expect(status.getSpeed(10), contains('10'));
    });

    test('returns empty strings for null values', () {
      final status = StatusData(settings: Settings());
      expect(status.getDegree(null), '');
      expect(status.getSpeed(null), '');
      expect(status.getPressure(null), '');
      expect(status.getVisibility(null), '');
      expect(status.getPrecipitation(null), '');
    });
  });
}
