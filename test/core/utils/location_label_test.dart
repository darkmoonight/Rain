import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/location_label.dart';
import 'package:rain/domain/entities/entities.dart';

void main() {
  test('formatLocationLabel handles common combinations', () {
    expect(formatLocationLabel('Moscow', ''), 'Moscow');
    expect(formatLocationLabel('', 'District'), 'District');
    expect(formatLocationLabel('Paris', 'Paris'), 'Paris');
    expect(formatLocationLabel('London', 'England'), 'London, England');
    expect(formatLocationLabel(null, null), '');
  });

  test('hasResolvedLocation requires coordinates and a label', () {
    expect(
      hasResolvedLocation(
        const GeoPlace(lat: 55.75, lon: 37.62, city: 'Moscow', district: ''),
      ),
      isTrue,
    );
    expect(
      hasResolvedLocation(
        const GeoPlace(lat: 55.75, lon: 37.62, city: '', district: ''),
      ),
      isFalse,
    );
    expect(
      hasResolvedLocation(
        const GeoPlace(lat: null, lon: 37.62, city: 'Moscow', district: ''),
      ),
      isFalse,
    );
  });
}
