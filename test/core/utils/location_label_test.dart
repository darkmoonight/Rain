import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/location_label.dart';
import 'package:rain/data/models/db.dart';

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
        LocationCache(lat: 55.75, lon: 37.62, city: 'Moscow', district: ''),
      ),
      isTrue,
    );
    expect(
      hasResolvedLocation(
        LocationCache(lat: 55.75, lon: 37.62, city: '', district: ''),
      ),
      isFalse,
    );
    expect(
      hasResolvedLocation(
        LocationCache(lat: null, lon: 37.62, city: 'Moscow', district: ''),
      ),
      isFalse,
    );
  });
}
