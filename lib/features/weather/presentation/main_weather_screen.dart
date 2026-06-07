import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/widgets/shimmer.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_card_list.dart';
import 'package:rain/features/weather/presentation/widgets/weather_detail_view.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/i18n/tr.dart';

/// Main tab showing the current location's full weather detail view.
class MainWeatherScreen extends ConsumerWidget {
  const MainWeatherScreen({super.key});

  /// Builds the refreshable main weather screen from [MainWeatherState].
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

  /// Renders loading, empty, or [WeatherDetailView] based on [state] and required forecast fields.
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
    final hasForecast =
        mainWeather.time != null &&
        mainWeather.time!.isNotEmpty &&
        mainWeather.timeDaily != null &&
        mainWeather.timeDaily!.isNotEmpty;

    if (!hasForecast) {
      return _emptyView(context);
    }

    final weatherCard = WeatherCard.fromJson(mainWeather.toJson());
    final hourOfDay = state.hourOfDay.clamp(0, mainWeather.time!.length - 1);
    final dayOfNow = state.dayOfNow.clamp(0, mainWeather.timeDaily!.length - 1);

    if (mainWeather.sunrise == null ||
        mainWeather.sunset == null ||
        mainWeather.temperature2MMax == null ||
        mainWeather.temperature2MMin == null) {
      return _emptyView(context);
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

  /// Shows shimmer placeholders while data is loading or daily min/max temps are missing.
  Widget _loadingView() => ListView(
    children: const [
      MyShimmer(height: 200),
      MyShimmer(height: 130, margin: EdgeInsets.symmetric(vertical: 15)),
      MyShimmer(height: 90, margin: EdgeInsets.only(bottom: 15)),
      MyShimmer(height: 400, margin: EdgeInsets.only(bottom: 15)),
      MyShimmer(height: 450, margin: EdgeInsets.only(bottom: 15)),
    ],
  );

  /// Shows an offline-style empty state when forecast data is unavailable.
  Widget _emptyView(BuildContext context) => ListView(
    physics: const AlwaysScrollableScrollPhysics(),
    children: [
      const SizedBox(height: 120),
      Icon(
        Icons.cloud_off_outlined,
        size: 56,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      const SizedBox(height: 16),
      Center(
        child: Text(
          'error_occurred'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      const SizedBox(height: 8),
      Center(
        child: Text(
          'no_inter'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    ],
  );
}
