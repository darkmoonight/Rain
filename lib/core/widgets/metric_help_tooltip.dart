import 'package:flutter/material.dart';

/// Long-press tooltip for weather metric help text (theme-aware bubble).
class MetricHelpTooltip extends StatelessWidget {
  const MetricHelpTooltip({
    super.key,
    required this.message,
    required this.child,
  });

  final String message;
  final Widget child;

  /// Wraps [child] when [message] is non-empty; otherwise returns [child] as-is.
  static Widget maybe({required String? message, required Widget child}) {
    final help = message?.trim();
    if (help == null || help.isEmpty) return child;
    return MetricHelpTooltip(message: help, child: child);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Tooltip(
      message: message,
      triggerMode: TooltipTriggerMode.longPress,
      waitDuration: const Duration(milliseconds: 350),
      showDuration: const Duration(seconds: 6),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.35),
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.28),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      textStyle: theme.textTheme.bodySmall?.copyWith(
        color: colorScheme.onInverseSurface,
        height: 1.4,
      ),
      child: child,
    );
  }
}
