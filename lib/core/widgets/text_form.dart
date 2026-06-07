import 'package:flutter/material.dart';
import 'package:rain/core/utils/responsive_utils.dart';

/// Visual style variants for [MyTextForm].
enum TextFieldVariant { outlined, filled, card }

/// Styled text field with icon, validation, and responsive sizing.
class MyTextForm extends StatelessWidget {
  const MyTextForm({
    super.key,
    required this.labelText,
    required this.type,
    required this.icon,
    required this.controller,
    required this.margin,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.validator,
    this.iconButton,
    this.elevation,
    this.focusNode,
    this.maxLine = 1,
    this.autofocus = false,
    this.helperText,
    this.hintText,
    this.variant = TextFieldVariant.outlined,
    this.style,
    this.contentPadding,
  });

  final String labelText;
  final TextInputType type;
  final Icon icon;
  final Widget? iconButton;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsets margin;
  final String? Function(String?)? validator;
  final bool readOnly;
  final double? elevation;
  final FocusNode? focusNode;
  final int? maxLine;
  final bool autofocus;
  final String? helperText;
  final String? hintText;
  final TextFieldVariant variant;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;

  /// Builds the text field wrapped in a card or padded container.
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = ResponsiveUtils.isMobile(context);

    if (variant == TextFieldVariant.card ||
        (elevation != null && elevation! > 0)) {
      return Card(
        elevation: elevation,
        margin: margin,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: _buildTextFormField(context, colorScheme, isMobile),
      );
    }

    return Padding(
      padding: margin,
      child: _buildTextFormField(context, colorScheme, isMobile),
    );
  }

  /// Builds the underlying [TextFormField] with keyboard and validation.
  Widget _buildTextFormField(
    BuildContext context,
    ColorScheme colorScheme,
    bool isMobile,
  ) {
    return TextFormField(
      focusNode: focusNode,
      readOnly: readOnly,
      onChanged: onChanged,
      onTap: readOnly ? onTap : null,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      keyboardType: type,
      style:
          style ??
          Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: ResponsiveUtils.getResponsiveFontSize(context, 15),
            color: colorScheme.onSurface,
          ),
      decoration: _buildInputDecoration(context, colorScheme, isMobile),
      validator: validator,
      maxLines: maxLine,
      autofocus: autofocus,
    );
  }

  /// Builds the input decoration for the selected [variant].
  InputDecoration _buildInputDecoration(
    BuildContext context,
    ColorScheme colorScheme,
    bool isMobile,
  ) {
    if (variant == TextFieldVariant.card ||
        (elevation != null && elevation! > 0)) {
      return InputDecoration(
        prefixIcon: icon,
        suffixIcon: iconButton,
        labelText: labelText,
        hintText: hintText,
        helperText: helperText,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        labelStyle: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 13),
          color: colorScheme.onSurfaceVariant,
        ),
        floatingLabelStyle: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 13),
          color: colorScheme.primary,
        ),
        hintStyle: TextStyle(
          color: colorScheme.onSurfaceVariant,
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 13),
        ),
        helperStyle: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 11),
          color: colorScheme.onSurfaceVariant,
        ),
        errorStyle: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 11),
          color: colorScheme.error,
        ),
        contentPadding: contentPadding,
      );
    }

    if (variant == TextFieldVariant.filled) {
      return InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8, right: 6),
          child: IconTheme(
            data: IconThemeData(
              color: colorScheme.onSurfaceVariant,
              size: isMobile ? 18 : 20,
            ),
            child: icon,
          ),
        ),
        suffixIcon: iconButton != null
            ? Padding(
                padding: const EdgeInsets.only(right: 6),
                child: iconButton,
              )
            : null,
        labelText: labelText,
        hintText: hintText,
        helperText: helperText,
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        labelStyle: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 13),
          color: colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w500,
        ),
        floatingLabelStyle: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 13),
          color: colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
        hintStyle: TextStyle(
          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 13),
        ),
        helperStyle: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 11),
          color: colorScheme.onSurfaceVariant,
        ),
        errorStyle: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 11),
          color: colorScheme.error,
        ),
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(
              horizontal: isMobile ? 12 : 14,
              vertical: isMobile ? 12 : 14,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colorScheme.error.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      );
    }

    return InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 8, right: 6),
        child: IconTheme(
          data: IconThemeData(
            color: colorScheme.onSurfaceVariant,
            size: isMobile ? 18 : 20,
          ),
          child: icon,
        ),
      ),
      suffixIcon: iconButton != null
          ? Padding(padding: const EdgeInsets.only(right: 6), child: iconButton)
          : null,
      labelText: labelText,
      hintText: hintText,
      helperText: helperText,
      filled: true,
      fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
      labelStyle: TextStyle(
        fontSize: ResponsiveUtils.getResponsiveFontSize(context, 13),
        color: colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.w500,
      ),
      floatingLabelStyle: TextStyle(
        fontSize: ResponsiveUtils.getResponsiveFontSize(context, 13),
        color: colorScheme.primary,
        fontWeight: FontWeight.w600,
      ),
      hintStyle: TextStyle(
        color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
        fontSize: ResponsiveUtils.getResponsiveFontSize(context, 13),
      ),
      helperStyle: TextStyle(
        fontSize: ResponsiveUtils.getResponsiveFontSize(context, 11),
        color: colorScheme.onSurfaceVariant,
      ),
      errorStyle: TextStyle(
        fontSize: ResponsiveUtils.getResponsiveFontSize(context, 11),
        color: colorScheme.error,
      ),
      contentPadding:
          contentPadding ??
          EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 14,
            vertical: isMobile ? 12 : 14,
          ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.outline, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: colorScheme.outline.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colorScheme.error, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: colorScheme.onSurface.withValues(alpha: 0.12),
          width: 1,
        ),
      ),
    );
  }
}
