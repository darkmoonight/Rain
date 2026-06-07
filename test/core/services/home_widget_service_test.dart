import '../../helpers/fake_home_widget.dart';
import '../../helpers/fake_path_provider.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/isar_test_helper.dart';
import '../../helpers/test_bootstrap.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/services/home_widget_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    installFakePathProvider();
    installFakeHomeWidget();
  });

  group('HomeWidgetService', () {
    late TestBootstrapContext ctx;
    late HomeWidgetService service;

    setUp(() async {
      ctx = await createTestBootstrap();
      service = HomeWidgetService(AssetCacheService());
    });

    test('updateFromIsar returns false when cache is empty', () async {
      final result = await service.updateFromIsar(ctx.isarContext.isar);

      expect(result, isTrue);
    });

    test('updateFromIsar handles seeded weather cache', () async {
      await seedMainWeatherCache(
        ctx.isarContext.isar,
        weather: sampleMainWeatherCache(),
        location: sampleLocationCache(),
      );

      final result = await service.updateFromIsar(ctx.isarContext.isar);

      expect(result, isTrue);
    });
  });
}
