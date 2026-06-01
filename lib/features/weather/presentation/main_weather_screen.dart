import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/widgets/shimmer.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_card_list.dart';
import 'package:rain/features/weather/presentation/widgets/weather_detail_view.dart';
import 'package:rain/core/navigation/app_router.dart';

class MainWeatherScreen extends ConsumerWidget {
  const MainWeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainWeatherNotifierProvider);
    final notifier = ref.read(mainWeatherNotifierProvider.notifier);

    return RefreshIndicator(
      onRefresh: notifier.refresh,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: _buildBody(context, ref, state, notifier),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    MainWeatherState state,
    MainWeatherNotifier notifier,
  ) {
    if (state.isLoading) {
      return _loadingView();
    }

    final mainWeather = state.mainWeather;
    final weatherCard = WeatherCard.fromJson(mainWeather.toJson());
    final hourOfDay = state.hourOfDay;
    final dayOfNow = state.dayOfNow;

    if (dayOfNow < 0 ||
        mainWeather.sunrise == null ||
        mainWeather.sunset == null ||
        mainWeather.temperature2MMax == null ||
        mainWeather.temperature2MMin == null) {
      return _loadingView();
    }

    final tempMax = mainWeather.temperature2MMax![dayOfNow];
    final tempMin = mainWeather.temperature2MMin![dayOfNow];
    if (tempMax == null || tempMin == null) return _loadingView();

    return WeatherDetailView(
      weatherCard: weatherCard,
      hourIndex: hourOfDay,
      dayIndex: dayOfNow,
      itemScrollController: notifier.itemScrollController,
      onHourSelected: notifier.setHourAndDay,
      showDailyTap: () =>
          context.pushRouteUp(DailyCardList(weatherData: weatherCard)),
    );
  }

  Widget _loadingView() => ListView(
    children: const [
      MyShimmer(height: 200),
      MyShimmer(height: 130, margin: EdgeInsets.symmetric(vertical: 15)),
      MyShimmer(height: 90, margin: EdgeInsets.only(bottom: 15)),
      MyShimmer(height: 400, margin: EdgeInsets.only(bottom: 15)),
      MyShimmer(height: 450, margin: EdgeInsets.only(bottom: 15)),
    ],
  );
}
