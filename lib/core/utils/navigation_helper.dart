import 'package:flutter/material.dart';
import 'package:rain/core/navigation/app_router.dart';

class NavigationHelper {
  static Future<T?>? to<T>(BuildContext context, Widget Function() page) =>
      context.pushRoute<T>(page());

  static Future<T?>? toDownToUp<T>(
    BuildContext context,
    Widget Function() page,
  ) => context.pushRouteUp<T>(page());

  static void back<T>(BuildContext context, {T? result}) =>
      context.popRoute<T>(result);

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
