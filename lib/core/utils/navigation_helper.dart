import 'package:flutter/material.dart';
import 'package:rain/core/navigation/app_router.dart';

/// Thin wrappers around common navigation and modal presentation patterns.
class NavigationHelper {
  /// Pushes [page] with a horizontal slide transition.
  static Future<T?>? to<T>(BuildContext context, Widget Function() page) =>
      context.pushRoute<T>(page());

  /// Pushes [page] with a bottom-to-top slide transition.
  static Future<T?>? toDownToUp<T>(
    BuildContext context,
    Widget Function() page,
  ) => context.pushRouteUp<T>(page());

  /// Pops the current route, optionally returning [result].
  static void back<T>(BuildContext context, {T? result}) =>
      context.popRoute<T>(result);

  /// Presents [child] as a modal bottom sheet.
  static Future<T?>? showModalSheet<T>({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = true,
  }) => showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    builder: (context) => child,
  );

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
