import 'package:flutter/material.dart';
import 'package:rain/core/constants/app_constants.dart';

/// Slide transition used for secondary screens pushed from the bottom.
Widget slideTransition({
  required Animation<double> animation,
  required Widget child,
  Offset begin = const Offset(0, 1),
}) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: begin,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
    child: child,
  );
}

/// Builds a slide transition page route from the given [begin] offset.
PageRouteBuilder<T> slideRoute<T>({
  required Widget child,
  required Offset begin,
}) {
  return PageRouteBuilder<T>(
    pageBuilder: (_, _, _) => child,
    transitionDuration: AppConstants.animationDuration,
    reverseTransitionDuration: AppConstants.animationDuration,
    transitionsBuilder: (_, animation, _, child) =>
        slideTransition(animation: animation, begin: begin, child: child),
  );
}
