import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/location_service.dart';

void main() {
  group('LocationService.firstNonEmpty', () {
    test('returns first trimmed non-empty value', () {
      expect(
        LocationService.firstNonEmpty([null, '  ', 'Berlin', 'Moscow']),
        'Berlin',
      );
    });

    test('returns empty string when all values are blank', () {
      expect(LocationService.firstNonEmpty([null, '', '   ']), '');
    });
  });
}
