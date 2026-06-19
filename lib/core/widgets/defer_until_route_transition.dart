import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rain/core/constants/app_constants.dart';

/// Shows [placeholder] until the enclosing route's push animation finishes.
///
/// Prevents heavy child builds from blocking slide transitions when data is
/// already available (for example from an in-memory cache).
class DeferUntilRouteTransition extends StatefulWidget {
  const DeferUntilRouteTransition({
    super.key,
    required this.child,
    required this.placeholder,
  });

  final Widget child;
  final Widget placeholder;

  @override
  State<DeferUntilRouteTransition> createState() =>
      _DeferUntilRouteTransitionState();
}

class _DeferUntilRouteTransitionState extends State<DeferUntilRouteTransition> {
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _waitForTransition());
  }

  Future<void> _waitForTransition() async {
    if (!mounted) return;

    final animation = ModalRoute.of(context)?.animation;
    if (animation != null && animation.status != AnimationStatus.completed) {
      final completer = Completer<void>();
      void listener(AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          animation.removeStatusListener(listener);
          if (!completer.isCompleted) completer.complete();
        }
      }

      animation.addStatusListener(listener);
      if (animation.status == AnimationStatus.completed &&
          !completer.isCompleted) {
        animation.removeStatusListener(listener);
        completer.complete();
      }
      await completer.future;
    } else if (animation == null) {
      await Future<void>.delayed(AppConstants.animationDuration);
    }

    if (mounted) {
      setState(() => _ready = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) return widget.placeholder;

    return widget.child;
  }
}
