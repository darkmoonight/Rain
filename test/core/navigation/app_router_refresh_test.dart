import '../../helpers/fixtures.dart';
import '../../helpers/test_bootstrap.dart';
import '../../helpers/test_helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/core/navigation/app_routes.dart';
import 'package:rain/data/mappers/domain_mapper.dart';
import 'package:rain/domain/entities/entities.dart';

void main() {
  setUpAll(initTestEnvironment);

  group('appRouterProvider refresh', () {
    test(
      'syncBootstrapLocationCache clears geolocation redirect target',
      () async {
        final ctx = await createTestBootstrap(
          settings: onboardedSettings(),
          locationCache: GeoPlace(),
        );
        final container = createTestContainer(bootstrap: ctx.bootstrap);
        addTearDown(container.dispose);

        expect(
          resolveAppRedirect(
            DomainMapper.settingsToDomain(ctx.bootstrap.settings),
            container.read(locationCacheProvider),
            AppRoutes.home,
          ),
          AppRoutes.geolocationStart,
        );

        container.read(
          Provider<void>((ref) {
            syncBootstrapLocationCache(ref, sampleGeoPlace());
          }),
        );

        expect(
          resolveAppRedirect(
            DomainMapper.settingsToDomain(ctx.bootstrap.settings),
            container.read(locationCacheProvider),
            AppRoutes.home,
          ),
          isNull,
        );
      },
    );
  });
}
