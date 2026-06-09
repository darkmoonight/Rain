import 'package:flutter/material.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/weather/aqi_helper.dart';

/// Colored AQI scale bar with a circular marker for the current value.
class AqiScaleBar extends StatelessWidget {
  const AqiScaleBar({
    super.key,
    required this.currentAqi,
    required this.standard,
  });

  final double currentAqi;
  final String standard;

  static const _barHeight = 5.0;
  static const _markerSize = 10.0;
  static const _segmentGap = 2.0;
  static const _segmentRadius = 3.0;

  /// Builds the segmented scale and positions the marker for [currentAqi].
  @override
  Widget build(BuildContext context) {
    final markerColor = AqiHelper.severityColor(standard, currentAqi);
    final markerFraction = (currentAqi / AqiHelper.scaleMax(standard)).clamp(
      0.0,
      1.0,
    );
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return SizedBox(
      height: _markerSize,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final markerLeft = (width * markerFraction - _markerSize / 2).clamp(
            0.0,
            width - _markerSize,
          );

          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: (_markerSize - _barHeight) / 2,
                height: _barHeight,
                child: _ScaleSegments(colors: AqiHelper.scaleColors(standard)),
              ),
              Positioned(
                left: markerLeft,
                top: 0,
                width: _markerSize,
                height: _markerSize,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: markerColor,
                    border: Border.all(
                      color: onSurface,
                      width: AppConstants.borderWidthMedium,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Row of equal-width colored scale segments.
class _ScaleSegments extends StatelessWidget {
  const _ScaleSegments({required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) => Row(
    spacing: AqiScaleBar._segmentGap,
    children: [
      for (final color in colors)
        Expanded(
          child: Container(
            height: AqiScaleBar._barHeight,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(AqiScaleBar._segmentRadius),
            ),
          ),
        ),
    ],
  );
}
