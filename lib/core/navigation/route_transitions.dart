import 'package:flutter/material.dart';

PageRouteBuilder<T> slideRoute<T>({
  required Widget child,
  required Offset begin,
}) {
  return PageRouteBuilder<T>(
    pageBuilder: (_, _, _) => child,
    transitionsBuilder: (_, animation, _, child) => SlideTransition(
      position: Tween<Offset>(
        begin: begin,
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
  );
}
