import '../../helpers/test_helpers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/utils/place_form_validators.dart';

void main() {
  setUpAll(initTestEnvironment);

  group('PlaceFormValidators', () {
    test('latitude rejects empty and out-of-range values', () {
      expect(PlaceFormValidators.latitude(null), isNotNull);
      expect(PlaceFormValidators.latitude(''), isNotNull);
      expect(PlaceFormValidators.latitude('abc'), isNotNull);
      expect(
        PlaceFormValidators.latitude('${AppConstants.maxLatitude + 1}'),
        isNotNull,
      );
      expect(PlaceFormValidators.latitude('-90'), isNull);
      expect(PlaceFormValidators.latitude('45.5'), isNull);
    });

    test('longitude rejects empty and out-of-range values', () {
      expect(PlaceFormValidators.longitude(null), isNotNull);
      expect(PlaceFormValidators.longitude('181'), isNotNull);
      expect(PlaceFormValidators.longitude('-180'), isNull);
      expect(PlaceFormValidators.longitude('12.3'), isNull);
    });

    test('city and district require non-empty names', () {
      expect(PlaceFormValidators.city(null), isNotNull);
      expect(PlaceFormValidators.city('Paris'), isNull);
      expect(PlaceFormValidators.district(''), isNotNull);
      expect(PlaceFormValidators.district('Central'), isNull);
    });
  });
}
