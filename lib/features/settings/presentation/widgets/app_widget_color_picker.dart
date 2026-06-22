import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/utils/color_converter.dart';
import 'package:rain/core/utils/responsive_utils.dart';
import 'package:rain/core/widgets/checkerboard_painter.dart';
import 'package:rain/features/settings/presentation/widgets/settings_card_shape.dart';
import 'package:rain/features/settings/presentation/widgets/widget_color_picker_ui.dart';

/// HSV color picker styled for Rain widget settings dialogs.
class AppWidgetColorPicker extends StatefulWidget {
  const AppWidgetColorPicker({
    super.key,
    required this.color,
    required this.onChanged,
    this.paletteHeight = 200,
  });

  final Color color;
  final ValueChanged<Color> onChanged;
  final double paletteHeight;

  @override
  State<AppWidgetColorPicker> createState() => _AppWidgetColorPickerState();
}

class _AppWidgetColorPickerState extends State<AppWidgetColorPicker> {
  late Color _color;
  late HSVColor _hsv;
  late TextEditingController _hexController;
  late FocusNode _hexFocusNode;

  @override
  void initState() {
    super.initState();
    _color = widget.color;
    _hsv = HSVColor.fromColor(_color);
    _hexController = TextEditingController(text: _color.toRgbHex());
    _hexFocusNode = FocusNode();
  }

  @override
  void didUpdateWidget(covariant AppWidgetColorPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.color != widget.color && widget.color != _color) {
      _applyColor(widget.color, notify: false);
    }
  }

  @override
  void dispose() {
    _hexController.dispose();
    _hexFocusNode.dispose();
    super.dispose();
  }

  void _applyColor(Color color, {bool notify = true}) {
    setState(() {
      _color = color;
      _hsv = HSVColor.fromColor(color);
      if (!_hexFocusNode.hasFocus) {
        _hexController.text = color.toRgbHex();
      }
    });
    if (notify) widget.onChanged(color);
  }

  void _commitHex(String text) {
    final parsed = HexColor.tryFromRgbHex(text, alpha: _color.alpha);
    if (parsed == null) {
      _hexController.text = _color.toRgbHex();
      return;
    }
    _applyColor(parsed);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final sliderBorder = WidgetColorPickerSliderStyle.border(colorScheme);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _ColorHexField(
          color: _color,
          controller: _hexController,
          focusNode: _hexFocusNode,
          onSubmitted: _commitHex,
          onEditingComplete: () => _commitHex(_hexController.text),
        ),
        const SizedBox(height: AppConstants.spacingL),
        PaletteHuePicker(
          color: _hsv,
          paletteHeight: widget.paletteHeight,
          palettePadding: EdgeInsets.zero,
          paletteBorder: sliderBorder,
          paletteBorderRadius: WidgetColorPickerSliderStyle.largeRadius,
          hueBorder: sliderBorder,
          hueBorderRadius: WidgetColorPickerSliderStyle.mediumRadius,
          hueHeight: 18,
          onChanged: (value) =>
              _applyColor(value.toColor().withAlpha(_color.alpha)),
        ),
        const SizedBox(height: AppConstants.spacingM),
        _AlphaSlider(
          alpha: _color.alpha,
          color: _color,
          onChanged: (alpha) => _applyColor(_color.withAlpha(alpha)),
        ),
      ],
    );
  }
}

/// Hex input row with a live color preview swatch.
class _ColorHexField extends StatelessWidget {
  const _ColorHexField({
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
      fontSize: ResponsiveUtils.getResponsiveFontSize(context, 15),
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
              hintStyle: TextStyle(
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                fontSize: ResponsiveUtils.getResponsiveFontSize(context, 15),
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

/// Alpha slider with a checkerboard track and gradient overlay.
class _AlphaSlider extends StatelessWidget {
  const _AlphaSlider({
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
    final labelStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w500,
      fontSize: ResponsiveUtils.getResponsiveFontSize(context, 13),
    );
    final valueStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w600,
      fontFeatures: const [FontFeature.tabularFigures()],
      fontSize: ResponsiveUtils.getResponsiveFontSize(context, 13),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingXS,
          ),
          child: Row(
            children: [
              Text('A', style: labelStyle),
              const Spacer(),
              Text('$alpha', style: valueStyle),
            ],
          ),
        ),
        const SizedBox(height: AppConstants.spacingXS),
        SliderPicker(
          value: alpha.toDouble(),
          max: 255,
          height: 18,
          border: WidgetColorPickerSliderStyle.border(colorScheme),
          borderRadius: WidgetColorPickerSliderStyle.mediumRadius,
          onChanged: (value) => onChanged(value.round()),
          child: CustomPaint(
            painter: _AlphaTrackPainter(
              light: colorScheme.surfaceContainerHighest,
              dark: colorScheme.surfaceContainer,
              tint: color.withAlpha(255),
            ),
          ),
        ),
      ],
    );
  }
}

class _AlphaTrackPainter extends CustomPainter {
  const _AlphaTrackPainter({
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
      columns: 8,
      rows: 2,
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
  bool shouldRepaint(covariant _AlphaTrackPainter oldDelegate) =>
      oldDelegate.light != light ||
      oldDelegate.dark != dark ||
      oldDelegate.tint != tint;
}
