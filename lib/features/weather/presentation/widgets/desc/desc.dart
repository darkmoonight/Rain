import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rain/core/widgets/metric_help_tooltip.dart';

/// Tappable grid cell for a single weather metric with optional help tooltip.
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

/// Manages tap-to-expand label and long-press help for one metric cell.
class _DescWeatherState extends State<DescWeather> {
  bool _compactLabel = true;

  /// Builds the metric cell; long-press shows [MetricHelpTooltip] when [message] is set.
  /// Builds the metric cell; long-press shows [MetricHelpTooltip] when [message] is set.
  @override
  Widget build(BuildContext context) {
    final content = SizedBox(
      height: 90,
      width: 100,
      child: _buildContent(Theme.of(context).textTheme),
    );

    return GestureDetector(
      onTap: () => setState(() => _compactLabel = !_compactLabel),
      child: MetricHelpTooltip.maybe(message: widget.message, child: content),
    );
  }

  /// Builds the icon, value, and short label column.
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
          overflow: _compactLabel
              ? TextOverflow.ellipsis
              : TextOverflow.visible,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
