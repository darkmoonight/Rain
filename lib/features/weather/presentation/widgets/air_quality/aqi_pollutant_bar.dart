import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/weather/aqi_helper.dart';
import 'package:rain/i18n/tr.dart';

/// Single pollutant row with label, concentration, and a colored progress bar.
class AqiPollutantBar extends StatelessWidget {
  const AqiPollutantBar({
    super.key,
    required this.pollutantKey,
    required this.value,
    required this.labelStyle,
  });

  final String pollutantKey;
  final double? value;
  final TextStyle? labelStyle;

  static const _labelBarGap = AppConstants.spacingXS;
  static const _trackHeight = 6.0;
  static const _trackAlpha = 0.28;
  static const _minFillWidth = 4.0;

  /// Builds the pollutant label, value, and EEA-colored track bar.
  @override
  Widget build(BuildContext context) {
    final valueStyle = labelStyle?.copyWith(fontWeight: FontWeight.w600);
    final theme = Theme.of(context);
    final trackColor = theme.colorScheme.onSurface.withValues(alpha: _trackAlpha);
    final fraction = AqiHelper.pollutantBarFraction(pollutantKey, value);
    final barColor = AqiHelper.pollutantColor(pollutantKey, value);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(pollutantKey.tr, style: labelStyle)),
            Text(AqiHelper.formatConcentration(value), style: valueStyle),
          ],
        ),
        const Gap(_labelBarGap),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
          child: SizedBox(
            height: _trackHeight,
            width: double.infinity,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final fillWidth = fraction <= 0
                    ? 0.0
                    : (constraints.maxWidth * fraction).clamp(
                        _minFillWidth,
                        constraints.maxWidth,
                      );

                return Stack(
                  children: [
                    ColoredBox(color: trackColor),
                    if (fillWidth > 0)
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        width: fillWidth,
                        child: ColoredBox(color: barColor),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
