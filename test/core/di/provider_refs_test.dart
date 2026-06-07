import '../../helpers/test_bootstrap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/data/models/db.dart';

void main() {
  group('syncBootstrapLocationCache', () {
    test('copies location fields into bootstrap cache', () async {
      final ctx = await createTestBootstrap();
      final container = ProviderContainer(
        overrides: [bootstrapProvider.overrideWithValue(ctx.bootstrap)],
      );
      addTearDown(container.dispose);

      container.read(
        Provider<void>((ref) {
          syncBootstrapLocationCache(
            ref,
            LocationCache(
              city: 'Berlin',
              district: 'Berlin',
              lat: 52.52,
              lon: 13.405,
            ),
          );
        }),
      );

      final cache = ctx.bootstrap.locationCache;
      expect(cache.city, 'Berlin');
      expect(cache.district, 'Berlin');
      expect(cache.lat, 52.52);
      expect(cache.lon, 13.405);
    });
  });

  group('providers', () {
    test('isarProvider reads shared database from bootstrap', () async {
      final ctx = await createTestBootstrap();
      final container = createTestContainer(bootstrap: ctx.bootstrap);
      addTearDown(container.dispose);

      expect(container.read(isarProvider), same(ctx.bootstrap.isar));
    });
  });
}
