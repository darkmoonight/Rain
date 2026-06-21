import '../../helpers/fake_home_widget.dart';
import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/background_refresh_log.dart';
import 'package:rain/features/settings/presentation/view/widget_settings_page.dart';
import 'package:rain/i18n/tr.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    installFakeHomeWidget();
    ctx = await createTestBootstrap();
    await recordBackgroundRefreshResult(
      success: false,
      error: 'network timeout',
    );
  });

  tearDown(() async {
    await ctx.dispose();
  });

  testWidgets('WidgetSettingsPage shows background refresh diagnostics', (
    tester,
  ) async {
    await pumpRainWidget(
      tester,
      const WidgetSettingsPage(),
      bootstrap: ctx.bootstrap,
    );

    await tester.pumpAndSettle();

    expect(find.text('lastBackgroundRefresh'.tr), findsOneWidget);
    expect(find.text('backgroundRefreshError'.tr), findsOneWidget);
    expect(find.text('network timeout'), findsOneWidget);
  });
}
