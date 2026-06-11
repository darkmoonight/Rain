import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/theme/theme_text.dart';
import 'package:rain/core/widgets/collapsible_section.dart';
import 'package:rain/core/widgets/metric_help_tooltip.dart';
import 'package:rain/core/weather/aqi_helper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/air_quality/aqi_pollutant_list.dart';
import 'package:rain/features/weather/presentation/widgets/air_quality/aqi_scale_bar.dart';
import 'package:rain/i18n/tr.dart';

/// Summary air quality card: AQI core on top, collapsible pollutant bars below.
class AirQualityCard extends StatelessWidget {
  const AirQualityCard({
    super.key,
    required this.weatherCard,
    required this.hourIndex,
    required this.aqiStandard,
  });

  final WeatherCard weatherCard;
  final int hourIndex;
  final String aqiStandard;

  static const _sectionGap = AppConstants.spacingS;
  static const _adviceBackgroundAlpha = 0.08;

  @override
  Widget build(BuildContext context) {
    final aqi = AqiHelper.aqiAt(weatherCard, hourIndex, aqiStandard);
    if (aqi == null) return const SizedBox.shrink();
    final severityColor = AqiHelper.severityColor(aqiStandard, aqi);
    final helpText = AqiHelper.buildHelpText(
      standard: aqiStandard,
      card: weatherCard,
      hourIndex: hourIndex,
      aqi: aqi,
    );
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final captionStyle = ThemeText.muted(theme, textTheme.bodySmall);
    final compactStyle = ThemeText.muted(
      theme,
      textTheme.labelSmall,
      height: 1.05,
    );

    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.cardBottomMargin),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppConstants.spacingL,
          AppConstants.spacingL,
          AppConstants.spacingL,
          AppConstants.spacingS,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            MetricHelpTooltip.maybe(
              message: helpText,
              child: _buildCoreSection(
                aqi: aqi,
                severityColor: severityColor,
                textTheme: textTheme,
                captionStyle: captionStyle,
                compactStyle: compactStyle,
              ),
            ),
            CollapsibleSection(
              headerPadding: CollapsibleSection.nestedHeaderPadding,
              title: Text('pollutants'.tr, style: textTheme.labelLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Gap(AppConstants.spacingS),
                  AqiPollutantList(
                    weatherCard: weatherCard,
                    hourIndex: hourIndex,
                    labelStyle: compactStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// AQI value, scale, and localized health advice.
  Widget _buildCoreSection({
    required double aqi,
    required Color severityColor,
    required TextTheme textTheme,
    required TextStyle? captionStyle,
    required TextStyle? compactStyle,
  }) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(child: Text('airQuality'.tr, style: textTheme.titleSmall)),
          Text(AqiHelper.standardLabel(aqiStandard), style: captionStyle),
        ],
      ),
      const Gap(AppConstants.spacingM),
      Row(
        children: [
          Text(
            aqi.round().toString(),
            style: textTheme.titleLarge?.copyWith(
              fontSize: AqiHelper.valueFontSize,
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
          const Gap(AppConstants.spacingS),
          _SeverityBadge(
            label: AqiHelper.severityLabel(aqiStandard, aqi),
            color: severityColor,
          ),
        ],
      ),
      const Gap(_sectionGap),
      AqiScaleBar(currentAqi: aqi, standard: aqiStandard),
      const Gap(AppConstants.spacingXS),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('0', style: compactStyle),
          Text(
            AqiHelper.scaleMax(aqiStandard).round().toString(),
            style: compactStyle,
          ),
        ],
      ),
      const Gap(_sectionGap),
      DecoratedBox(
        decoration: BoxDecoration(
          color: severityColor.withValues(alpha: _adviceBackgroundAlpha),
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.spacingS),
          child: Text(
            AqiHelper.recommendation(aqiStandard, aqi),
            style: captionStyle,
          ),
        ),
      ),
    ],
  );
}

/// Pill showing the localized AQI severity level.
class _SeverityBadge extends StatelessWidget {
  const _SeverityBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(
      horizontal: AppConstants.spacingS,
      vertical: 2,
    ),
    decoration: BoxDecoration(
      color: color.withValues(alpha: AqiHelper.severityBadgeAlpha),
      borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
    ),
    child: Text(
      label,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: color,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
