import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:rain/core/bootstrap/app_bootstrap.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/core/services/connectivity_service.dart';
import 'package:rain/i18n/strings.g.dart';
import 'test_helpers.dart';

/// Sets whether tests treat the device as online.
void setTestConnectivity(bool online) {
  ConnectivityService.isOnline.value = Future.value(online);
}

/// Pumps [widget] inside ProviderScope with optional overrides.
Future<void> pumpRainWidget(
  WidgetTester tester,
  Widget widget, {
  AppBootstrap? bootstrap,
  List overrides = const [],
}) async {
  await initTestEnvironment();
  setTestConnectivity(true);

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        if (bootstrap != null) bootstrapProvider.overrideWithValue(bootstrap),
        ...overrides,
      ],
      child: MaterialApp(
        locale: const Locale('en', 'US'),
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: AppLocaleUtils.supportedLocales,
        home: widget,
      ),
    ),
  );
  await tester.pump();
}

/// Pumps [widget] with a minimal GoRouter for navigation tests.
Future<void> pumpRainRouter(
  WidgetTester tester, {
  required AppBootstrap bootstrap,
  required GoRouter router,
  List overrides = const [],
}) async {
  await initTestEnvironment();
  setTestConnectivity(true);

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        bootstrapProvider.overrideWithValue(bootstrap),
        appRouterProvider.overrideWithValue(router),
        ...overrides,
      ],
      child: MaterialApp.router(
        locale: const Locale('en', 'US'),
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: AppLocaleUtils.supportedLocales,
        routerConfig: router,
      ),
    ),
  );
  await tester.pump();
}

/// Builds a GoRouter using production redirect logic with test bootstrap.
GoRouter createTestRouter(AppBootstrap bootstrap) {
  final container = ProviderContainer(
    overrides: [bootstrapProvider.overrideWithValue(bootstrap)],
  );
  addTearDown(container.dispose);
  return container.read(appRouterProvider);
}
