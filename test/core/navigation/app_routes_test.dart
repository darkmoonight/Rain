import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/navigation/app_routes.dart';

void main() {
  group('AppRoutes', () {
    test('geolocationStart includes start query flag', () {
      expect(AppRoutes.geolocationStart, '${AppRoutes.geolocation}?start=true');
    });

    test('paths are stable route identifiers', () {
      expect(AppRoutes.home, '/');
      expect(AppRoutes.onboarding, '/onboarding');
      expect(AppRoutes.geolocation, '/geolocation');
    });
  });
}
