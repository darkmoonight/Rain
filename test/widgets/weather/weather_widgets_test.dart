import '../../helpers/fixtures.dart';
import '../../helpers/test_bootstrap.dart';
import '../../helpers/widget_test_harness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/desc/desc.dart';
import 'package:rain/features/weather/presentation/widgets/desc/desc_container.dart';
import 'package:rain/features/weather/presentation/widgets/hourly.dart';
import 'package:rain/features/weather/presentation/widgets/now.dart';
import 'package:rain/features/weather/presentation/widgets/sunset_sunrise.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_card.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_card_list.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_container.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:rain/features/weather/presentation/widgets/weather_detail_view.dart';

void main() {
  late TestBootstrapContext ctx;
  late WeatherCard card;

  setUp(() async {
    ctx = await createTestBootstrap();
    card = completeWeatherCard();
  });

  double req(double? v) => v!;

  tearDown(() async {});

  testWidgets('Now renders compact layout by default', (tester) async {
    await pumpRainWidget(
      tester,
      Now(
        time: card.time!.first,
        weather: card.weathercode!.first,
        degree: card.temperature2M!.first,
        feels: req(card.apparentTemperature!.first),
        timeDay: card.sunrise!.first,
        timeNight: card.sunset!.first,
        tempMax: req(card.temperature2MMax!.first),
        tempMin: req(card.temperature2MMin!.first),
      ),
      bootstrap: ctx.bootstrap,
    );

    expect(find.byType(Card), findsOneWidget);
  });

  testWidgets('Now shows last updated when timestamp is set', (tester) async {
    await pumpRainWidget(
      tester,
      Now(
        time: card.time!.first,
        weather: card.weathercode!.first,
        degree: card.temperature2M!.first,
        feels: req(card.apparentTemperature!.first),
        timeDay: card.sunrise!.first,
        timeNight: card.sunset!.first,
        tempMax: req(card.temperature2MMax!.first),
        tempMin: req(card.temperature2MMin!.first),
        updatedAt: DateTime(2026, 6, 9, 14, 30),
      ),
      bootstrap: ctx.bootstrap,
    );

    expect(find.textContaining('Updated:'), findsOneWidget);
    expect(find.textContaining('14:30'), findsOneWidget);
  });

  testWidgets('Now renders large layout when enabled', (tester) async {
    ctx.bootstrap.settings.largeElement = true;

    await pumpRainWidget(
      tester,
      Now(
        time: card.time!.first,
        weather: card.weathercode!.first,
        degree: card.temperature2M!.first,
        feels: req(card.apparentTemperature!.first),
        timeDay: card.sunrise!.first,
        timeNight: card.sunset!.first,
        tempMax: req(card.temperature2MMax!.first),
        tempMin: req(card.temperature2MMin!.first),
      ),
      bootstrap: ctx.bootstrap,
    );

    expect(find.byType(Card), findsNothing);
  });

  testWidgets('Hourly renders time column', (tester) async {
    await pumpRainWidget(
      tester,
      Hourly(
        time: card.time!.first,
        weather: card.weathercode!.first,
        degree: card.temperature2M!.first,
        timeDay: card.sunrise!.first,
        timeNight: card.sunset!.first,
      ),
      bootstrap: ctx.bootstrap,
    );

    expect(find.byType(Column), findsWidgets);
  });

  testWidgets('SunsetSunrise renders card', (tester) async {
    await pumpRainWidget(
      tester,
      SunsetSunrise(
        timeSunrise: card.sunrise!.first,
        timeSunset: card.sunset!.first,
      ),
      bootstrap: ctx.bootstrap,
    );

    expect(find.byType(Card), findsOneWidget);
  });

  testWidgets('DescWeather toggles description on tap', (tester) async {
    await pumpRainWidget(
      tester,
      const DescWeather(
        imageName: 'assets/icons/icon.png',
        value: '50%',
        desc: 'Humidity',
      ),
      bootstrap: ctx.bootstrap,
    );

    await tester.tap(find.byType(GestureDetector));
    await tester.pump();
    expect(find.text('Humidity'), findsOneWidget);
  });

  testWidgets('DescContainer renders expandable section', (tester) async {
    await pumpRainWidget(
      tester,
      DescContainer(
        humidity: 50,
        wind: 5,
        initiallyExpanded: true,
        title: 'Hourly variables',
      ),
      bootstrap: ctx.bootstrap,
    );

    expect(find.text('Hourly variables'), findsOneWidget);
  });

  testWidgets('DailyCardList renders forecast rows', (tester) async {
    await pumpRainWidget(
      tester,
      DailyCardList(weatherData: card),
      bootstrap: ctx.bootstrap,
    );

    expect(find.byType(DailyCard), findsWidgets);
  });

  testWidgets('DailyContainer renders preview and more button', (tester) async {
    final weekly = weeklyWeatherCard();
    await pumpRainWidget(
      tester,
      DailyContainer(
        weatherData: weekly,
        dayIndex: 0,
        hourIndex: 0,
        onTap: () {},
      ),
      bootstrap: ctx.bootstrap,
    );

    expect(find.byType(InkWell), findsWidgets);
  });

  testWidgets('WeatherDetailView renders main sections', (tester) async {
    final weekly = weeklyWeatherCard();
    final scrollController = ItemScrollController();
    await pumpRainWidget(
      tester,
      WeatherDetailView(
        weatherCard: weekly,
        hourIndex: 0,
        dayIndex: 0,
        aqiStandard: 'european',
        itemScrollController: scrollController,
        onHourSelected: (_, _) {},
      ),
      bootstrap: ctx.bootstrap,
    );

    expect(find.byType(Now), findsOneWidget);

    await tester.scrollUntilVisible(
      find.byType(DailyContainer),
      500,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.byType(DailyContainer), findsOneWidget);
  });
}
