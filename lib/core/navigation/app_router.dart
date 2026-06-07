import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/navigation/app_routes.dart';
import 'package:rain/core/navigation/route_transitions.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/geolocation/presentation/geolocation_screen.dart';
import 'package:rain/features/onboarding/presentation/onboarding_screen.dart';
import 'package:rain/features/shell/presentation/home_screen.dart';

/// Forces [appRouterProvider] to re-evaluate redirects from a [WidgetRef].
void refreshAppRouter(WidgetRef ref) {
  ref.read(_routerRefreshProvider).value++;
}

/// Forces [appRouterProvider] to re-evaluate redirects from a [Ref].
void refreshAppRouterFromRef(Ref ref) {
  ref.read(_routerRefreshProvider).value++;
}

/// Notifier that triggers [appRouterProvider] redirect re-evaluation.
final _routerRefreshProvider = Provider<ValueNotifier<int>>((ref) {
  final notifier = ValueNotifier(0);
  ref.onDispose(notifier.dispose);
  ref.listen(settingsProvider, (_, _) => notifier.value++);
  ref.listen(locationCacheProvider, (_, _) => notifier.value++);
  return notifier;
});

/// App-wide [GoRouter] with onboarding and geolocation guards.
final appRouterProvider = Provider<GoRouter>((ref) {
  final refresh = ref.watch(_routerRefreshProvider);

  return GoRouter(
    refreshListenable: refresh,
    initialLocation: AppRoutes.home,
    redirect: (context, state) async {
      final container = ProviderScope.containerOf(context);
      final settings = container.read(settingsProvider);
      final cached = await container
          .read(weatherRepositoryProvider)
          .readCache();
      final location = cached.location ?? container.read(locationCacheProvider);
      return resolveAppRedirect(
        settings,
        location ?? LocationCache(),
        state.uri.path,
      );
    },
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnBoarding(),
      ),
      GoRoute(
        path: AppRoutes.geolocation,
        builder: (context, state) {
          final isStart = state.uri.queryParameters['start'] == 'true';
          return SelectGeolocation(isStart: isStart);
        },
      ),
    ],
  );
});

/// Returns a redirect when setup is incomplete or when setup routes should be skipped.
String? resolveAppRedirect(
  Settings settings,
  LocationCache location,
  String path,
) {
  if (!settings.onboard) {
    return path == AppRoutes.onboarding ? null : AppRoutes.onboarding;
  }
  final needsLocation =
      location.city == null ||
      location.district == null ||
      location.lat == null ||
      location.lon == null;
  if (needsLocation) {
    return path.startsWith(AppRoutes.geolocation)
        ? null
        : AppRoutes.geolocationStart;
  }
  if (path == AppRoutes.onboarding ||
      (path.startsWith(AppRoutes.geolocation) && path.contains('start=true'))) {
    return AppRoutes.home;
  }
  return null;
}

/// Convenience navigation helpers using slide transitions on the root navigator.
extension GoRouterNavigation on BuildContext {
  /// Pushes [page] with a vertical slide transition.
  Future<T?> pushRouteUp<T>(Widget page) => Navigator.of(
    this,
  ).push<T>(slideRoute<T>(child: page, begin: const Offset(0, 1)));
}
