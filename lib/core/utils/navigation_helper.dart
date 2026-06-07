import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rain/core/navigation/app_router.dart';

/// Thin wrappers around common navigation and modal presentation patterns.
class NavigationHelper {
  /// Pushes [page] with a bottom-to-top slide transition.
  static Future<T?>? toDownToUp<T>(
    BuildContext context,
    Widget Function() page,
  ) => context.pushRouteUp<T>(page());

  /// Pops the innermost route: dialog/bottom sheet first, then GoRouter.
  static void back<T>(BuildContext context, {T? result}) {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop(result);
      return;
    }
    final router = GoRouter.maybeOf(context);
    if (router != null && router.canPop()) {
      router.pop(result);
    }
  }

  /// Presents [child] as a dialog.
  static Future<T?>? showAppDialog<T>({
    required BuildContext context,
    required Widget child,
    bool barrierDismissible = true,
  }) => showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) => child,
  );
}
