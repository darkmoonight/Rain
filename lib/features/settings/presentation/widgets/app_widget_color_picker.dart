import 'package:flutter/material.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/utils/color_converter.dart';
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
    _syncFromColor(widget.color);
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

  void _syncFromColor(Color color) {
    _color = color;
    _hsv = HSVColor.fromColor(color);
  }

  /// Converts [hsv] to a [Color], keeping the current alpha channel.
  Color _toColor(HSVColor hsv) => hsv.toColor().withAlpha(_color.alpha);

  void _applyColor(Color color, {bool notify = true}) {
    setState(() {
      _syncFromColor(color);
      if (!_hexFocusNode.hasFocus) {
        _hexController.text = color.toRgbHex();
      }
    });
    if (notify) widget.onChanged(color);
  }

  void _applyHsv(HSVColor hsv) => _applyColor(_toColor(hsv));

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        WidgetColorHexField(
          color: _color,
          controller: _hexController,
          focusNode: _hexFocusNode,
          onSubmitted: _commitHex,
          onEditingComplete: () => _commitHex(_hexController.text),
        ),
        const SizedBox(height: AppConstants.spacingL),
        WidgetColorSaturationPalette(
          hsv: _hsv,
          height: widget.paletteHeight,
          onChanged: (offset) =>
              _applyHsv(_hsv.withSaturation(offset.dx).withValue(offset.dy)),
        ),
        const SizedBox(height: AppConstants.spacingM),
        WidgetColorPickerTrack(
          value: _hsv.hue,
          max: 360,
          colors: WidgetColorPickerSliderStyle.hueGradient(_hsv),
          onChanged: (hue) => _applyHsv(_hsv.withHue(hue)),
        ),
        const SizedBox(height: AppConstants.spacingL),
        WidgetColorAlphaSlider(
          alpha: _color.alpha,
          color: _color,
          onChanged: (alpha) => _applyColor(_color.withAlpha(alpha)),
        ),
      ],
    );
  }
}
