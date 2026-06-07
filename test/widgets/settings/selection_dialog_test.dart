import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/features/settings/presentation/widgets/selection_dialog.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  testWidgets('SelectionDialog lists items', (tester) async {
    await pumpRainWidget(
      tester,
      Scaffold(
        body: SelectionDialog<String>(
          title: 'Pick theme',
          icon: IconsaxPlusLinear.sun_1,
          items: const ['light', 'dark'],
          currentValue: 'light',
          itemBuilder: (item) => item,
          onSelected: (_) {},
          enableSearch: false,
        ),
      ),
      bootstrap: ctx.bootstrap,
    );

    expect(find.text('light'), findsWidgets);
    expect(find.text('dark'), findsOneWidget);
  });

  testWidgets('closes dialog when item is selected', (tester) async {
    await pumpRainRouter(
      tester,
      bootstrap: ctx.bootstrap,
      router: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () => NavigationHelper.showAppDialog(
                    context: context,
                    child: SelectionDialog<String>(
                      title: 'Pick theme',
                      icon: IconsaxPlusLinear.sun_1,
                      items: const ['light', 'dark'],
                      currentValue: 'light',
                      itemBuilder: (item) => item,
                      onSelected: (_) {},
                      enableSearch: false,
                    ),
                  ),
                  child: const Text('Open dialog'),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    await tester.tap(find.text('Open dialog'));
    await tester.pumpAndSettle();

    expect(find.text('Pick theme'), findsOneWidget);

    await tester.tap(find.text('dark'));
    await tester.pumpAndSettle();

    expect(find.text('Pick theme'), findsNothing);
  });

  testWidgets('search filters visible items', (tester) async {
    await pumpRainWidget(
      tester,
      Scaffold(
        body: SelectionDialog<String>(
          title: 'Pick language',
          icon: IconsaxPlusLinear.global,
          items: const ['English', 'Deutsch', 'Français'],
          currentValue: 'English',
          itemBuilder: (item) => item,
          onSelected: (_) {},
          enableSearch: true,
        ),
      ),
      bootstrap: ctx.bootstrap,
    );

    expect(find.text('Deutsch'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'fran');
    await tester.pump();

    expect(find.text('Français'), findsOneWidget);
    expect(find.text('Deutsch'), findsNothing);
    expect(find.text('English'), findsNothing);
  });
}
