import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:rain/core/navigation/app_routes.dart';
import 'package:rain/core/utils/navigation_helper.dart';

void main() {
  late TestBootstrapContext ctx;

  setUp(() async {
    ctx = await createTestBootstrap();
  });

  group('NavigationHelper', () {
    testWidgets('toDownToUp and back navigate between pages', (tester) async {
      final router = GoRouter(
        initialLocation: AppRoutes.home,
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => Scaffold(
              body: ElevatedButton(
                onPressed: () => NavigationHelper.toDownToUp(
                  context,
                  () => Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => NavigationHelper.back(context),
                      ),
                    ),
                    body: const Text('Second page'),
                  ),
                ),
                child: const Text('Open'),
              ),
            ),
          ),
        ],
      );

      await pumpRainRouter(tester, bootstrap: ctx.bootstrap, router: router);

      await tester.tap(find.text('Open'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Second page'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Open'), findsOneWidget);
    });

    testWidgets('showAppDialog presents dialog content', (tester) async {
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
                      child: const AlertDialog(title: Text('Dialog title')),
                    ),
                    child: const Text('Show dialog'),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

      await tester.tap(find.text('Show dialog'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));

      expect(find.text('Dialog title'), findsOneWidget);
    });

    testWidgets('back pops GoRouter route when no navigator overlay', (
      tester,
    ) async {
      final router = GoRouter(
        initialLocation: AppRoutes.home,
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => Scaffold(
              body: ElevatedButton(
                onPressed: () => context.push('/details'),
                child: const Text('Go details'),
              ),
            ),
          ),
          GoRoute(
            path: '/details',
            builder: (context, state) => Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => NavigationHelper.back(context),
                ),
              ),
              body: const Text('Details page'),
            ),
          ),
        ],
      );

      await pumpRainRouter(tester, bootstrap: ctx.bootstrap, router: router);

      await tester.tap(find.text('Go details'));
      await tester.pumpAndSettle();

      expect(find.text('Details page'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      expect(router.state.uri.path, AppRoutes.home);
      expect(find.text('Go details'), findsOneWidget);
    });

    testWidgets('back closes showAppDialog without GoError', (tester) async {
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
                      child: AlertDialog(
                        title: const Text('Overlay dialog'),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                NavigationHelper.back(context, result: 'ok'),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    ),
                    child: const Text('Show overlay'),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

      await tester.tap(find.text('Show overlay'));
      await tester.pumpAndSettle();
      expect(find.text('Overlay dialog'), findsOneWidget);

      await tester.tap(find.text('Close'));
      await tester.pumpAndSettle();

      expect(find.text('Overlay dialog'), findsNothing);
      expect(find.text('Show overlay'), findsOneWidget);
    });
  });
}
