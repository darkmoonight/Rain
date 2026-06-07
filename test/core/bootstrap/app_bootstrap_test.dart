import '../../helpers/test_bootstrap.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/bootstrap/app_bootstrap.dart';

void main() {
  group('AppBootstrap', () {
    late TestBootstrapContext ctx;

    setUp(() async {
      ctx = await createTestBootstrap();
    });

    test('exposes isar, settings, and location cache', () {
      final bootstrap = ctx.bootstrap;

      expect(bootstrap, isA<AppBootstrap>());
      expect(bootstrap.isar.isOpen, isTrue);
      expect(bootstrap.settings.onboard, isTrue);
      expect(bootstrap.locationCache.city, 'Moscow');
    });
  });
}
