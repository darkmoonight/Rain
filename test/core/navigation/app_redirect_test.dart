import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/core/navigation/app_routes.dart';
import 'package:rain/data/models/db.dart';

Settings _settings({bool onboard = true}) => Settings()..onboard = onboard;

LocationCache _location({
  String? city = 'Moscow',
  String? district = 'Moscow',
  double? lat = 55.75,
  double? lon = 37.62,
}) => LocationCache(city: city, district: district, lat: lat, lon: lon);

void main() {
  group('resolveAppRedirect', () {
    test('redirects to onboarding when not completed', () {
      expect(
        resolveAppRedirect(
          _settings(onboard: false),
          _location(),
          AppRoutes.home,
        ),
        AppRoutes.onboarding,
      );
      expect(
        resolveAppRedirect(
          _settings(onboard: false),
          _location(),
          AppRoutes.onboarding,
        ),
        isNull,
      );
    });

    test('redirects to geolocation when location is incomplete', () {
      expect(
        resolveAppRedirect(_settings(), _location(city: null), AppRoutes.home),
        AppRoutes.geolocationStart,
      );
      expect(
        resolveAppRedirect(
          _settings(),
          _location(city: null),
          AppRoutes.geolocation,
        ),
        isNull,
      );
    });

    test('redirects away from onboarding after setup is complete', () {
      expect(
        resolveAppRedirect(_settings(), _location(), AppRoutes.onboarding),
        AppRoutes.home,
      );
      expect(
        resolveAppRedirect(
          _settings(),
          _location(),
          AppRoutes.geolocationStart,
        ),
        AppRoutes.home,
      );
    });

    test('returns null on normal home route when setup is complete', () {
      expect(
        resolveAppRedirect(_settings(), _location(), AppRoutes.home),
        isNull,
      );
    });

    test('needs location when any coordinate field is missing', () {
      expect(
        resolveAppRedirect(_settings(), _location(lat: null), AppRoutes.home),
        AppRoutes.geolocationStart,
      );
      expect(
        resolveAppRedirect(_settings(), _location(lon: null), AppRoutes.home),
        AppRoutes.geolocationStart,
      );
      expect(
        resolveAppRedirect(
          _settings(),
          _location(district: null),
          AppRoutes.home,
        ),
        isNull,
      );
    });

    test('needs location when labels are blank strings', () {
      expect(
        resolveAppRedirect(
          _settings(),
          _location(city: '', district: ''),
          AppRoutes.home,
        ),
        AppRoutes.geolocationStart,
      );
      expect(
        resolveAppRedirect(
          _settings(),
          _location(city: '   ', district: ''),
          AppRoutes.home,
        ),
        AppRoutes.geolocationStart,
      );
    });
  });
}
