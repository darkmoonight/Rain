import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/models/city_api.dart';

void main() {
  group('CityApi.fromJson', () {
    test('deserializes results list', () {
      final api = CityApi.fromJson({
        'results': [
          {
            'admin1': 'Moscow Oblast',
            'name': 'Moscow',
            'latitude': 55.75,
            'longitude': 37.62,
          },
        ],
      });

      expect(api.results, hasLength(1));
      expect(api.results.first.name, 'Moscow');
      expect(api.results.first.admin1, 'Moscow Oblast');
      expect(api.results.first.latitude, 55.75);
      expect(api.results.first.longitude, 37.62);
    });

    test('returns empty list when results is null', () {
      final api = CityApi.fromJson({});
      expect(api.results, isEmpty);
    });

    test('defaults admin1 to empty string', () {
      final result = Result.fromJson({
        'name': 'Berlin',
        'latitude': 52.52,
        'longitude': 13.405,
      });
      expect(result.admin1, '');
    });
  });
}
