import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/location_label.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rain/core/services/location_service.dart';

Position _testPosition({double lat = 55.75, double lon = 37.62}) {
  return Position(
    latitude: lat,
    longitude: lon,
    timestamp: DateTime.utc(2026, 6, 5, 12),
    accuracy: 0,
    altitude: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
    altitudeAccuracy: 0,
    headingAccuracy: 0,
  );
}

void main() {
  group('firstNonEmptyLocationLabel', () {
    test('returns first trimmed non-empty value', () {
      expect(
        firstNonEmptyLocationLabel([null, '  ', 'Berlin', 'Moscow']),
        'Berlin',
      );
    });

    test('returns empty string when all values are blank', () {
      expect(firstNonEmptyLocationLabel([null, '', '   ']), '');
    });
  });

  group('LocationService.parsePlaceFromPlacemarks', () {
    test('builds city and district from placemark fields', () {
      final place = LocationService.parsePlaceFromPlacemarks(_testPosition(), [
        Placemark(locality: 'Moscow', administrativeArea: 'Moscow Oblast'),
      ]);

      expect(place, isNotNull);
      expect(place!.city, 'Moscow');
      expect(place.district, 'Moscow Oblast');
      expect(place.lat, 55.75);
      expect(place.lon, 37.62);
    });

    test('returns null when placemarks are empty', () {
      expect(
        LocationService.parsePlaceFromPlacemarks(_testPosition(), []),
        isNull,
      );
    });

    test('returns null when city and district cannot be resolved', () {
      expect(
        LocationService.parsePlaceFromPlacemarks(_testPosition(), [
          Placemark(),
        ]),
        isNull,
      );
    });
  });
}
