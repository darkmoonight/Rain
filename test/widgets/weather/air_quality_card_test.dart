import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/weather/aqi_helper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/air_quality/air_quality_card.dart';
import 'package:rain/features/weather/presentation/widgets/air_quality/aqi_pollutant_bar.dart';
import 'package:rain/i18n/strings.g.dart';

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.enUs));

  testWidgets('AirQualityCard renders pollutant rows', (tester) async {
    final card = WeatherCard(
      time: ['2026-06-05T12:00'],
      europeanAqi: [26],
      usAqi: [45],
      pm25: [11],
      pm10: [12],
      ozone: [48],
      no2: [30],
      so2: [4.8],
      co: [170],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 400,
            child: AirQualityCard(
              weatherCard: card,
              hourIndex: 0,
              aqiStandard: AqiHelper.european,
            ),
          ),
        ),
      ),
    );

    expect(find.byType(AqiPollutantBar), findsNWidgets(6));
  });
}
