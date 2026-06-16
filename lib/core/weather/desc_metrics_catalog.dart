import 'package:rain/core/weather/message.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/weather/weather_icon_theme.dart';
import 'package:rain/i18n/tr.dart';

/// One row in the hourly/daily weather-variables grid.
class DescMetric {
  const DescMetric({
    required this.displayValue,
    required this.imageAsset,
    required this.label,
    required this.helpText,
  });

  final String displayValue;
  final String imageAsset;
  final String label;
  final String helpText;

  /// True when [displayValue] is present and not a stringified null.
  bool get hasValue =>
      displayValue.isNotEmpty && !displayValue.startsWith('null');
}

/// Input snapshot for [DescMetricsCatalog.build].
class DescMetricsInput {
  const DescMetricsInput({
    this.humidity,
    this.wind,
    this.visibility,
    this.feels,
    this.evaporation,
    this.precipitation,
    this.direction,
    this.pressure,
    this.rain,
    this.cloudcover,
    this.windgusts,
    this.uvIndex,
    this.dewpoint2M,
    this.precipitationProbability,
    this.shortwaveRadiation,
    this.apparentTemperatureMin,
    this.apparentTemperatureMax,
    this.uvIndexMax,
    this.windDirection10MDominant,
    this.windSpeed10MMax,
    this.windGusts10MMax,
    this.precipitationProbabilityMax,
    this.rainSum,
    this.precipitationSum,
  });

  final int? humidity;
  final double? wind;
  final double? visibility;
  final double? feels;
  final double? evaporation;
  final double? precipitation;
  final int? direction;
  final double? pressure;
  final double? rain;
  final int? cloudcover;
  final double? windgusts;
  final double? uvIndex;
  final double? dewpoint2M;
  final int? precipitationProbability;
  final double? shortwaveRadiation;
  final double? apparentTemperatureMin;
  final double? apparentTemperatureMax;
  final double? uvIndexMax;
  final int? windDirection10MDominant;
  final double? windSpeed10MMax;
  final double? windGusts10MMax;
  final int? precipitationProbabilityMax;
  final double? rainSum;
  final double? precipitationSum;
}

/// Builds the ordered list of weather-variable metrics for [DescContainer].
class DescMetricsCatalog {
  DescMetricsCatalog._();

  /// Returns metrics with formatted values; order matches the UI grid.
  static List<DescMetric> build({
    required DescMetricsInput input,
    required StatusData statusData,
    required Message message,
    String? themeId,
  }) {
    String img(String fileName) =>
        WeatherIconTheme.asset(fileName, themeId: themeId);

    DescMetric metric({
      required String? value,
      required String imageAsset,
      required String labelKey,
      required String helpText,
    }) => DescMetric(
      displayValue: value ?? '',
      imageAsset: imageAsset,
      label: labelKey.tr,
      helpText: helpText,
    );

    return [
      metric(
        value: statusData.getDegree(input.apparentTemperatureMin),
        imageAsset: img('cold.png'),
        labelKey: 'apparentTemperatureMin',
        helpText: message.helpApparentTemperatureMin(),
      ),
      metric(
        value: statusData.getDegree(input.apparentTemperatureMax),
        imageAsset: img('hot.png'),
        labelKey: 'apparentTemperatureMax',
        helpText: message.helpApparentTemperatureMax(),
      ),
      metric(
        value: _roundOrEmpty(input.uvIndexMax),
        imageAsset: img('uv.png'),
        labelKey: 'uvIndex',
        helpText: message.helpUvIndex(input.uvIndexMax?.round()),
      ),
      metric(
        value: _degrees(input.windDirection10MDominant),
        imageAsset: img('windsock.png'),
        labelKey: 'direction',
        helpText: message.helpDirection(input.windDirection10MDominant),
      ),
      metric(
        value: statusData.getSpeed(input.windSpeed10MMax?.round()),
        imageAsset: img('wind.png'),
        labelKey: 'wind',
        helpText: message.helpWind(),
      ),
      metric(
        value: statusData.getSpeed(input.windGusts10MMax?.round()),
        imageAsset: img('windgusts.png'),
        labelKey: 'windgusts',
        helpText: message.helpWindGusts(),
      ),
      metric(
        value: _percent(input.precipitationProbabilityMax),
        imageAsset: img('precipitation_probability.png'),
        labelKey: 'precipitationProbability',
        helpText: message.helpPrecipitationProbability(),
      ),
      metric(
        value: statusData.getPrecipitation(input.rainSum),
        imageAsset: img('water.png'),
        labelKey: 'rain',
        helpText: message.helpRain(),
      ),
      metric(
        value: statusData.getPrecipitation(input.precipitationSum),
        imageAsset: img('rainfall.png'),
        labelKey: 'precipitation',
        helpText: message.helpPrecipitation(),
      ),
      metric(
        value: statusData.getDegree(input.dewpoint2M),
        imageAsset: img('dew.png'),
        labelKey: 'dewpoint',
        helpText: message.helpDewpoint(),
      ),
      metric(
        value: statusData.getDegree(input.feels),
        imageAsset: img('temperature.png'),
        labelKey: 'feels',
        helpText: message.helpFeels(),
      ),
      metric(
        value: statusData.getVisibility(input.visibility),
        imageAsset: img('fog.png'),
        labelKey: 'visibility',
        helpText: message.helpVisibility(),
      ),
      metric(
        value: _degrees(input.direction),
        imageAsset: img('windsock.png'),
        labelKey: 'direction',
        helpText: message.helpDirection(input.direction),
      ),
      metric(
        value: statusData.getSpeed(input.wind?.round()),
        imageAsset: img('wind.png'),
        labelKey: 'wind',
        helpText: message.helpWind(),
      ),
      metric(
        value: statusData.getSpeed(input.windgusts?.round()),
        imageAsset: img('windgusts.png'),
        labelKey: 'windgusts',
        helpText: message.helpWindGusts(),
      ),
      metric(
        value: statusData.getPrecipitation(input.evaporation?.abs()),
        imageAsset: img('evaporation.png'),
        labelKey: 'evaporation',
        helpText: message.helpEvaporation(),
      ),
      metric(
        value: statusData.getPrecipitation(input.precipitation),
        imageAsset: img('rainfall.png'),
        labelKey: 'precipitation',
        helpText: message.helpPrecipitation(),
      ),
      metric(
        value: statusData.getPrecipitation(input.rain),
        imageAsset: img('water.png'),
        labelKey: 'rain',
        helpText: message.helpRain(),
      ),
      metric(
        value: _percent(input.precipitationProbability),
        imageAsset: img('precipitation_probability.png'),
        labelKey: 'precipitationProbability',
        helpText: message.helpPrecipitationProbability(),
      ),
      metric(
        value: _percent(input.humidity),
        imageAsset: img('humidity.png'),
        labelKey: 'humidity',
        helpText: message.helpHumidity(),
      ),
      metric(
        value: _percent(input.cloudcover),
        imageAsset: img('cloudy.png'),
        labelKey: 'cloudcover',
        helpText: message.helpCloudcover(),
      ),
      metric(
        value: statusData.getPressure(input.pressure?.round()),
        imageAsset: img('atmospheric.png'),
        labelKey: 'pressure',
        helpText: message.helpPressure(input.pressure?.round()),
      ),
      metric(
        value: _roundOrEmpty(input.uvIndex),
        imageAsset: img('uv.png'),
        labelKey: 'uvIndex',
        helpText: message.helpUvIndex(input.uvIndex?.round()),
      ),
      metric(
        value: input.shortwaveRadiation == null
            ? ''
            : '${input.shortwaveRadiation!.round()} ${'W/m2'.tr}',
        imageAsset: img('shortwave_radiation.png'),
        labelKey: 'shortwaveRadiation',
        helpText: message.helpShortwaveRadiation(),
      ),
    ];
  }

  static String _degrees(int? value) => value == null ? '' : '$value°';

  static String _percent(num? value) => value == null ? '' : '$value%';

  static String _roundOrEmpty(double? value) {
    if (value == null) return '';
    return '${value.round()}';
  }
}
