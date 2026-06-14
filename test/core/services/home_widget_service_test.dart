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

    test('updateFromIsar writes per-theme widget color prefs', () async {
      final settings = ctx.bootstrap.settings
        ..widgetBackgroundColorLight = '#111111'
        ..widgetBackgroundColorDark = '#222222'
        ..widgetTextColorLight = '#333333'
        ..widgetTextColorDark = '#444444';
      await seedSettings(ctx.isarContext.isar, settings);

      await service.updateFromIsar(ctx.isarContext.isar);

      expect(savedWidgetData['background_color_light'], '#111111');
      expect(savedWidgetData['background_color_dark'], '#222222');
      expect(savedWidgetData['text_color_light'], '#333333');
      expect(savedWidgetData['text_color_dark'], '#444444');
    });

    test(
      'updateFromIsar writes widget theme prefs for native palette resolution',
      () async {
        final settings = ctx.bootstrap.settings..theme = 'dark';
        await seedSettings(ctx.isarContext.isar, settings);

        await service.updateFromIsar(ctx.isarContext.isar);

        expect(savedWidgetData['widget_theme_mode'], 'dark');
      },
    );

    test(
      'updateFromIsar writes widget data before requesting widget refresh',
      () async {
        await seedMainWeatherCache(
          ctx.isarContext.isar,
          weather: sampleMainWeatherCache(),
          location: sampleLocationCache(),
        );

        homeWidgetCallLog.clear();
        await service.updateFromIsar(ctx.isarContext.isar);

        final firstUpdateIndex = homeWidgetCallLog.indexOf('updateWidget');
        expect(firstUpdateIndex, greaterThan(0));
        expect(
          homeWidgetCallLog.sublist(firstUpdateIndex),
          everyElement('updateWidget'),
        );
        expect(
          homeWidgetCallLog.sublist(0, firstUpdateIndex),
          everyElement(isNot('updateWidget')),
        );
      },
    );
  });
}
