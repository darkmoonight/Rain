import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/theme/theme_text.dart';
import 'package:rain/core/utils/color_converter.dart';
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
        color: WidgetColorPickerSliderStyle.panelBackground(colorScheme),
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
                light: WidgetColorPickerSliderStyle.checkerboardLight(
                  colorScheme,
                ),
                dark: WidgetColorPickerSliderStyle.checkerboardDark(
                  colorScheme,
                ),
              ),
              child: overlay,
            )
          : overlay,
    );
  }
}

/// Eye-slash icon shown on transparent widget color previews.
class WidgetTransparentIndicator extends StatelessWidget {
  const WidgetTransparentIndicator({
    super.key,
    this.size = WidgetColorPickerSliderStyle.transparentIconSizeLarge,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      IconsaxPlusLinear.eye_slash,
      size: size,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
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
      color: WidgetColorPickerSliderStyle.optionBackground(
        colorScheme,
        isSelected: isSelected,
      ),
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
                overlay: const Center(child: WidgetTransparentIndicator()),
              ),
              const SizedBox(width: AppConstants.spacingL),
              Expanded(
                child: Text(
                  'widgetBackgroundTransparent'.tr,
                  style: ThemeText.settingsBody(
                    context,
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.onSurface,
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
    final outline = colorScheme.outlineVariant.withValues(
      alpha: WidgetColorPickerSliderStyle.listSwatchOutlineAlpha,
    );

    if (color.isFullyTransparent) {
      return CircleAvatar(
        backgroundColor: outline,
        radius: WidgetColorPickerSliderStyle.listSwatchOuterRadius,
        child: const WidgetTransparentIndicator(
          size: WidgetColorPickerSliderStyle.transparentIconSizeSmall,
        ),
      );
    }

    return CircleAvatar(
      backgroundColor: outline,
      radius: WidgetColorPickerSliderStyle.listSwatchOuterRadius,
      child: CircleAvatar(
        backgroundColor: color,
        radius: WidgetColorPickerSliderStyle.listSwatchInnerRadius,
      ),
    );
  }
}

/// Hex input row with a live color preview swatch.
class WidgetColorHexField extends StatelessWidget {
  const WidgetColorHexField({
    super.key,
    required this.color,
    required this.controller,
    required this.focusNode,
    required this.onSubmitted,
    required this.onEditingComplete,
  });

  final Color color;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onEditingComplete;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final borderColor = SettingsCardShape.settingsDividerColor(colorScheme);
    final fieldRadius = WidgetColorPickerSliderStyle.mediumRadius;
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w600,
      fontFeatures: const [FontFeature.tabularFigures()],
      fontSize: ThemeText.settingsBody(context)?.fontSize,
    );

    return Row(
      children: [
        WidgetColorPreviewSwatch(color: color),
        const SizedBox(width: AppConstants.spacingM),
        Expanded(
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            onSubmitted: onSubmitted,
            onEditingComplete: onEditingComplete,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9A-Fa-f#]')),
              LengthLimitingTextInputFormatter(7),
            ],
            style: textStyle,
            decoration: InputDecoration(
              prefixText: '#',
              prefixStyle: textStyle?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              hintText: 'RRGGBB',
              hintStyle: ThemeText.settingsBody(context)?.copyWith(
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.5,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppConstants.spacingL,
                vertical: AppConstants.spacingM,
              ),
              border: OutlineInputBorder(
                borderRadius: fieldRadius,
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: fieldRadius,
                borderSide: BorderSide(color: borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: fieldRadius,
                borderSide: BorderSide(
                  color: colorScheme.primary,
                  width: AppConstants.borderWidthMedium,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Saturation/value palette for the widget color picker.
class WidgetColorSaturationPalette extends StatelessWidget {
  const WidgetColorSaturationPalette({
    super.key,
    required this.hsv,
    required this.height,
    required this.onChanged,
  });

  final HSVColor hsv;
  final double height;
  final ValueChanged<Offset> onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final border = WidgetColorPickerSliderStyle.border(colorScheme);

    return SizedBox(
      height: height,
      child: Padding(
        padding: WidgetColorPickerSliderStyle.paletteInset,
        child: PalettePicker(
          border: border,
          borderRadius: WidgetColorPickerSliderStyle.largeRadius,
          position: Offset(hsv.saturation, hsv.value),
          onChanged: onChanged,
          leftRightColors: [
            Colors.white,
            HSVColor.fromAHSV(1, hsv.hue, 1, 1).toColor(),
          ],
          topPosition: 1,
          bottomPosition: 0,
          topBottomColors: const [Colors.transparent, Colors.black],
        ),
      ),
    );
  }
}

/// Styled slider track shared by hue and alpha pickers.
class WidgetColorPickerTrack extends StatelessWidget {
  const WidgetColorPickerTrack({
    super.key,
    required this.value,
    required this.max,
    required this.onChanged,
    this.colors,
    this.child,
  });

  final double value;
  final double max;
  final ValueChanged<double> onChanged;
  final List<Color>? colors;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SliderPicker(
      value: value,
      max: max,
      height: WidgetColorPickerSliderStyle.trackHeight,
      border: WidgetColorPickerSliderStyle.border(colorScheme),
      borderRadius: WidgetColorPickerSliderStyle.mediumRadius,
      onChanged: onChanged,
      colors: colors,
      child: child,
    );
  }
}

/// Alpha slider with a checkerboard track and gradient overlay.
class WidgetColorAlphaSlider extends StatelessWidget {
  const WidgetColorAlphaSlider({
    super.key,
    required this.alpha,
    required this.color,
    required this.onChanged,
  });

  final int alpha;
  final Color color;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final labelStyle = ThemeText.settingsLabel(context);
    final valueStyle = ThemeText.settingsLabel(context)?.copyWith(
      fontWeight: FontWeight.w600,
      fontFeatures: const [FontFeature.tabularFigures()],
      color: colorScheme.onSurface,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppConstants.spacingS),
          child: Row(
            children: [
              Text('A', style: labelStyle),
              const Spacer(),
              Text('$alpha', style: valueStyle),
            ],
          ),
        ),
        WidgetColorPickerTrack(
          value: alpha.toDouble(),
          max: WidgetColorPickerSliderStyle.alphaMax.toDouble(),
          onChanged: (value) => onChanged(value.round()),
          child: CustomPaint(
            painter: _WidgetAlphaTrackPainter(
              light: WidgetColorPickerSliderStyle.checkerboardLight(
                colorScheme,
              ),
              dark: WidgetColorPickerSliderStyle.checkerboardDark(colorScheme),
              tint: color.withAlpha(255),
            ),
          ),
        ),
      ],
    );
  }
}

/// Picker chrome shared by the saturation and hue sliders.
class WidgetColorPickerSliderStyle {
  const WidgetColorPickerSliderStyle._();

  /// Default height of the saturation/value palette.
  static const double defaultPaletteHeight = 200;

  /// Maximum hue value for the hue slider.
  static const double hueMax = 360;

  /// Maximum alpha value for the alpha slider.
  static const int alphaMax = 255;

  /// Track height that fits the package thumb without clipping.
  static const double trackHeight = 36;

  /// Outer radius of list-row color swatches.
  static const double listSwatchOuterRadius = 11;

  /// Inner color radius inside list-row swatches.
  static const double listSwatchInnerRadius = 10;

  /// Outline alpha for list-row swatches.
  static const double listSwatchOutlineAlpha = 0.4;

  /// Large transparent icon used in the picker preview swatch.
  static const double transparentIconSizeLarge = 18;

  /// Small transparent icon used in settings list rows.
  static const double transparentIconSizeSmall = 14;

  /// Checkerboard columns painted inside the alpha slider track.
  static const int alphaTrackColumns = 8;

  /// Checkerboard rows painted inside the alpha slider track.
  static const int alphaTrackRows = 2;

  static const double _panelBackgroundAlpha = 0.35;
  static const double _selectedOptionAlpha = 0.35;
  static const double _idleOptionAlpha = 0.45;

  /// Vertical insets so palette thumbs stay inside the panel bounds.
  static const EdgeInsets paletteInset = EdgeInsets.symmetric(
    vertical: AppConstants.spacingM,
  );

  static Color panelBackground(ColorScheme colorScheme) =>
      colorScheme.surfaceContainerLow.withValues(alpha: _panelBackgroundAlpha);

  static Color optionBackground(
    ColorScheme colorScheme, {
    required bool isSelected,
  }) => isSelected
      ? colorScheme.primaryContainer.withValues(alpha: _selectedOptionAlpha)
      : colorScheme.surfaceContainerLow.withValues(alpha: _idleOptionAlpha);

  static Border border(ColorScheme colorScheme) => Border.all(
    color: SettingsCardShape.settingsDividerColor(colorScheme),
    width: AppConstants.borderWidthThin,
  );

  static Color checkerboardLight(ColorScheme colorScheme) =>
      colorScheme.surfaceContainerHighest;

  static Color checkerboardDark(ColorScheme colorScheme) =>
      colorScheme.surfaceContainer;

  /// Full-spectrum hue stops for the hue slider track.
  static List<Color> hueGradient(HSVColor base) => [
    for (final hue in [0.0, 60.0, 120.0, 180.0, 240.0, 300.0, 0.0])
      base.withHue(hue).toColor(),
  ];

  static final BorderRadius largeRadius = BorderRadius.circular(
    AppConstants.borderRadiusLarge,
  );

  static final BorderRadius mediumRadius = BorderRadius.circular(
    AppConstants.borderRadiusMedium,
  );
}

/// Checkerboard plus alpha gradient painted inside the alpha slider track.
class _WidgetAlphaTrackPainter extends CustomPainter {
  const _WidgetAlphaTrackPainter({
    required this.light,
    required this.dark,
    required this.tint,
  });

  final Color light;
  final Color dark;
  final Color tint;

  @override
  void paint(Canvas canvas, Size size) {
    CheckerboardPainter.paintPattern(
      canvas,
      size,
      light: light,
      dark: dark,
      columns: WidgetColorPickerSliderStyle.alphaTrackColumns,
      rows: WidgetColorPickerSliderStyle.alphaTrackRows,
    );

    final rect = Offset.zero & size;
    canvas.drawRect(
      rect,
      Paint()
        ..shader = LinearGradient(
          colors: [tint.withValues(alpha: 0), tint],
        ).createShader(rect),
    );
  }

  @override
  bool shouldRepaint(covariant _WidgetAlphaTrackPainter oldDelegate) =>
      oldDelegate.light != light ||
      oldDelegate.dark != dark ||
      oldDelegate.tint != tint;
}
