import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/features/settings/presentation/widgets/widget_color_picker_dialog.dart';
import 'package:rain/i18n/tr.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  tearDown(() async {
    await ctx.dispose();
  });

  testWidgets('widget color picker dialog shows title and save actions', (
    tester,
  ) async {
    await pumpRainWidget(
      tester,
      Builder(
        builder: (context) {
          return ElevatedButton(
            onPressed: () => showWidgetColorPicker(
              context: context,
              titleKey: 'widgetBackgroundLight',
              initialColor: Colors.blue,
              onSave: (_) async {},
              onReset: () async {},
            ),
            child: const Text('open'),
          );
        },
      ),
      bootstrap: ctx.bootstrap,
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(find.text('widgetBackgroundLight'.tr), findsOneWidget);
    expect(find.text('save'.tr), findsOneWidget);
    expect(find.byIcon(IconsaxPlusLinear.rotate_left), findsOneWidget);
  });
}
