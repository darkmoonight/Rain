import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/utils/color_converter.dart';
import 'package:rain/core/utils/responsive_utils.dart';
import 'package:rain/core/widgets/checkerboard_painter.dart';
import 'package:rain/features/settings/presentation/widgets/settings_card_shape.dart';
import 'package:rain/i18n/tr.dart';

/// Bordered panel that groups widget color controls inside settings dialogs.
class WidgetColorPickerPanel extends StatelessWidget {
  const WidgetColorPickerPanel({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final dividerColor = SettingsCardShape.settingsDividerColor(colorScheme);

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
        border: Border.all(
          color: dividerColor,
          width: AppConstants.borderWidthThin,
        ),
      ),
      padding: const EdgeInsets.all(AppConstants.spacingL),
      child: child,
    );
  }
}

/// Swatch preview for solid or transparent widget colors.
class WidgetColorPreviewSwatch extends StatelessWidget {
  const WidgetColorPreviewSwatch({
    super.key,
    this.color,
    this.size = 44,
    this.overlay,
    this.showCheckerboard = false,
  });

  final Color? color;
  final double size;
  final Widget? overlay;
  final bool showCheckerboard;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final borderColor = SettingsCardShape.settingsDividerColor(colorScheme);
    final useCheckerboard =
        showCheckerboard || (color != null && color!.isFullyTransparent);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: useCheckerboard ? null : color,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        border: Border.all(color: borderColor),
      ),
      clipBehavior: Clip.antiAlias,
      child: useCheckerboard
          ? CustomPaint(
              painter: CheckerboardPainter(
                light: colorScheme.surfaceContainerHighest,
                dark: colorScheme.surfaceContainer,
              ),
              child: overlay,
            )
          : overlay,
    );
  }
}

/// Transparent background preset shown above the custom color picker.
class WidgetTransparentOption extends StatelessWidget {
  const WidgetTransparentOption({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final dividerColor = SettingsCardShape.settingsDividerColor(colorScheme);
    final borderRadius = BorderRadius.circular(AppConstants.borderRadiusLarge);

    return Material(
      color: isSelected
          ? colorScheme.primaryContainer.withValues(alpha: 0.35)
          : colorScheme.surfaceContainerLow.withValues(alpha: 0.45),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(
          color: isSelected ? colorScheme.primary : dividerColor,
          width: isSelected
              ? AppConstants.borderWidthMedium
              : AppConstants.borderWidthThin,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingL,
            vertical: AppConstants.spacingM,
          ),
          child: Row(
            children: [
              WidgetColorPreviewSwatch(
                showCheckerboard: true,
                overlay: Center(
                  child: Icon(
                    IconsaxPlusLinear.eye_slash,
                    size: 18,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(width: AppConstants.spacingL),
              Expanded(
                child: Text(
                  'widgetBackgroundTransparent'.tr,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.onSurface,
                    fontSize: ResponsiveUtils.getResponsiveFontSize(
                      context,
                      15,
                    ),
                  ),
                ),
              ),
              Icon(
                isSelected
                    ? IconsaxPlusBold.tick_circle
                    : IconsaxPlusLinear.arrow_right_3,
                size: isSelected ? AppConstants.iconSizeMedium : 20,
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Trailing swatch for widget color rows on the settings page.
class WidgetColorListSwatch extends StatelessWidget {
  const WidgetColorListSwatch({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final outline = colorScheme.outlineVariant.withValues(alpha: 0.4);

    if (color.isFullyTransparent) {
      return CircleAvatar(
        backgroundColor: outline,
        radius: 11,
        child: Icon(
          IconsaxPlusLinear.eye_slash,
          size: 14,
          color: colorScheme.onSurfaceVariant,
        ),
      );
    }

    return CircleAvatar(
      backgroundColor: outline,
      radius: 11,
      child: CircleAvatar(backgroundColor: color, radius: 10),
    );
  }
}

/// Picker chrome shared by the saturation and hue sliders.
class WidgetColorPickerSliderStyle {
  const WidgetColorPickerSliderStyle._();

  static Border border(ColorScheme colorScheme) => Border.all(
    color: SettingsCardShape.settingsDividerColor(colorScheme),
    width: AppConstants.borderWidthThin,
  );

  static final BorderRadius largeRadius = BorderRadius.circular(
    AppConstants.borderRadiusLarge,
  );

  static final BorderRadius mediumRadius = BorderRadius.circular(
    AppConstants.borderRadiusMedium,
  );
}
