import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Tappable grid cell for a single weather metric with optional tooltip.
class DescWeather extends StatefulWidget {
  const DescWeather({
    super.key,
    required this.imageName,
    required this.value,
    required this.desc,
    this.message = '',
  });

  final String imageName;
  final String value;
  final String desc;
  final String? message;

  /// Creates the [State] for [DescWeather].
  @override
  State<DescWeather> createState() => _DescWeatherState();
}

/// Manages tap-to-expand behavior for one [DescWeather] metric cell.
class _DescWeatherState extends State<DescWeather> {
  bool hide = true;

  /// Builds the tappable metric cell with tooltip and expandable description.
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: _toggleDescriptionVisibility,
    child: Tooltip(
      message: widget.message,
      child: SizedBox(
        height: 90,
        width: 100,
        child: _buildContent(Theme.of(context).textTheme),
      ),
    ),
  );

  /// Toggles whether the metric description text is truncated.
  void _toggleDescriptionVisibility() => setState(() => hide = !hide);

  /// Builds the icon, value, and description column for this metric.
  Widget _buildContent(TextTheme textTheme) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(widget.imageName, scale: 20),
      const Gap(5),
      Text(
        widget.value,
        style: textTheme.labelLarge,
        overflow: TextOverflow.ellipsis,
      ),
      Expanded(
        child: Text(
          widget.desc,
          style: textTheme.bodySmall,
          overflow: hide ? TextOverflow.ellipsis : TextOverflow.visible,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
