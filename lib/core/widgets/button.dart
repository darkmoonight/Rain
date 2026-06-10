import 'package:flutter/material.dart';
import 'package:rain/core/utils/responsive_utils.dart';

/// Full-width primary or outlined action button with optional icon.
class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.icon,
    this.isOutlined = false,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final double? height;
  final IconData? icon;
  final bool isOutlined;
  final bool isLoading;

  /// Builds a filled or outlined full-width button based on [isOutlined].
  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? 52.0;

    if (isOutlined) {
      return _buildOutlinedButton(context, buttonHeight);
    }

    return _buildFilledButton(context, buttonHeight);
  }

  /// Builds the primary filled button with responsive padding and states.
  Widget _buildFilledButton(BuildContext context, double buttonHeight) {
    final colorScheme = Theme.of(context).colorScheme;
    final padding = ResponsiveUtils.getResponsivePadding(context);

    return SizedBox(
      height: buttonHeight,
      width: double.infinity,
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return colorScheme.onSurface.withValues(alpha: 0.12);
            }
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.primary;
            }
            if (states.contains(WidgetState.hovered)) {
              return colorScheme.primaryContainer;
            }
            return colorScheme.primaryContainer;
          }),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return colorScheme.onSurface.withValues(alpha: 0.38);
            }
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.onPrimary;
            }
            return colorScheme.onPrimaryContainer;
          }),
          elevation: WidgetStateProperty.resolveWith<double>((states) {
            if (states.contains(WidgetState.disabled)) return 0;
            if (states.contains(WidgetState.pressed)) return 0;
            if (states.contains(WidgetState.hovered)) return 1;
            return 0;
          }),
          shadowColor: WidgetStatePropertyAll(
            colorScheme.shadow.withValues(alpha: 0.2),
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.onPrimaryContainer.withValues(alpha: 0.12);
            }
            if (states.contains(WidgetState.hovered)) {
              return colorScheme.onPrimaryContainer.withValues(alpha: 0.08);
            }
            return Colors.transparent;
          }),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: padding * 2),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: _buildButtonContent(context),
      ),
    );
  }

  /// Builds the outlined variant with border and hover/pressed styling.
  Widget _buildOutlinedButton(BuildContext context, double buttonHeight) {
    final colorScheme = Theme.of(context).colorScheme;
    final padding = ResponsiveUtils.getResponsivePadding(context);

    return SizedBox(
      height: buttonHeight,
      width: double.infinity,
      child: OutlinedButton(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return colorScheme.onSurface.withValues(alpha: 0.38);
            }
            return colorScheme.primary;
          }),
          side: WidgetStateProperty.resolveWith<BorderSide>((states) {
            if (states.contains(WidgetState.disabled)) {
              return BorderSide(
                color: colorScheme.onSurface.withValues(alpha: 0.12),
                width: 1,
              );
            }
            if (states.contains(WidgetState.pressed)) {
              return BorderSide(color: colorScheme.primary, width: 1.5);
            }
            return BorderSide(color: colorScheme.outline, width: 1);
          }),
          overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.primary.withValues(alpha: 0.12);
            }
            if (states.contains(WidgetState.hovered)) {
              return colorScheme.primary.withValues(alpha: 0.08);
            }
            return Colors.transparent;
          }),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: padding * 2),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: _buildButtonContent(context),
      ),
    );
  }

  /// Builds the label row, optionally prefixed with [icon] or a loading spinner.
  Widget _buildButtonContent(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            isOutlined
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }

    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
