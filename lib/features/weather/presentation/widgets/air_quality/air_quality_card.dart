import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/weather/aqi_helper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/air_quality/aqi_pollutant_bar.dart';
import 'package:rain/features/weather/presentation/widgets/air_quality/aqi_scale_bar.dart';
import 'package:rain/i18n/tr.dart';

/// Summary air quality card: AQI core on the left, pollutant bars on the right.
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
  static const _pollutantGap = 6.0;
  static const _adviceBackgroundAlpha = 0.08;
  static const _dividerAlpha = 0.35;

  /// Builds the air quality summary card for [hourIndex], or nothing when data is missing.
  @override
  Widget build(BuildContext context) {
    if (!AqiHelper.hasData(weatherCard, hourIndex, aqiStandard)) {
      return const SizedBox.shrink();
    }

    final aqi = AqiHelper.resolveAqi(
      aqiStandard,
      weatherCard.europeanAqi?[hourIndex],
      weatherCard.usAqi?[hourIndex],
    )!;
    final severityColor = AqiHelper.severityColor(aqiStandard, aqi);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final captionStyle = _mutedStyle(theme, textTheme.bodySmall, height: 1.25);
    final compactStyle = _mutedStyle(theme, textTheme.labelSmall, height: 1.05);

    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.cardBottomMargin),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.cardPaddingHorizontal,
          vertical: AppConstants.spacingL,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: _buildCoreColumn(
                  aqi: aqi,
                  severityColor: severityColor,
                  textTheme: textTheme,
                  captionStyle: captionStyle,
                  compactStyle: compactStyle,
                ),
              ),
              _buildColumnDivider(theme),
              Expanded(
                flex: 4,
                child: _buildPollutantsColumn(captionStyle, compactStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the left column with AQI value, scale, and health advice.
  Widget _buildCoreColumn({
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
      const Spacer(),
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

  /// Builds the right column with pollutant labels and track bars.
  Widget _buildPollutantsColumn(
    TextStyle? captionStyle,
    TextStyle? compactStyle,
  ) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('pollutants'.tr, style: captionStyle),
      const Gap(_sectionGap),
      for (var i = 0; i < AqiHelper.pollutantKeys.length; i++) ...[
        if (i > 0) const Gap(_pollutantGap),
        AqiPollutantBar(
          pollutantKey: AqiHelper.pollutantKeys[i],
          value: AqiHelper.pollutantValue(
            weatherCard,
            hourIndex,
            AqiHelper.pollutantKeys[i],
          ),
          labelStyle: compactStyle,
        ),
      ],
    ],
  );

  /// Builds the vertical divider between the AQI core and pollutant columns.
  Widget _buildColumnDivider(ThemeData theme) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppConstants.spacingM),
    child: VerticalDivider(
      width: AppConstants.borderWidthThin,
      thickness: AppConstants.borderWidthThin,
      color: theme.colorScheme.outline.withValues(alpha: _dividerAlpha),
    ),
  );

  static TextStyle? _mutedStyle(
    ThemeData theme,
    TextStyle? base, {
    required double height,
  }) => base?.copyWith(
    color: theme.colorScheme.onSurfaceVariant,
    height: height,
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
