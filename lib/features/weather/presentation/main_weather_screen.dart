import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/utils/show_snack_bar.dart';
import 'package:rain/core/widgets/shimmer.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_card_list.dart';
import 'package:rain/features/weather/presentation/widgets/weather_detail_view.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/i18n/tr.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:rain/domain/entities/entities.dart';

/// Main tab showing the current location's full weather detail view.
class MainWeatherScreen extends ConsumerStatefulWidget {
  const MainWeatherScreen({super.key});

  @override
  ConsumerState<MainWeatherScreen> createState() => _MainWeatherScreenState();
}

class _MainWeatherScreenState extends ConsumerState<MainWeatherScreen> {
  Timer? _clockTimer;
  final _itemScrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    _clockTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (!mounted) return;
      ref.read(mainWeatherNotifierProvider.notifier).syncCurrentTimeIndices();
    });
  }

  @override
  void dispose() {
    _clockTimer?.cancel();
    super.dispose();
  }

  void _scrollToCurrentHour({int retryCount = 0}) {
    if (!mounted) return;
    final hour = ref.read(mainWeatherNotifierProvider).hourOfDay;
    if (_itemScrollController.isAttached) {
      _itemScrollController.scrollTo(
        index: hour,
        duration: AppConstants.scrollDuration,
        curve: Curves.easeInOutCubic,
      );
    } else if (retryCount < AppConstants.maxScrollRetries) {
      Future.delayed(
        AppConstants.scrollToRetryDelay,
        () => _scrollToCurrentHour(retryCount: retryCount + 1),
      );
    }
  }

  /// Builds the refreshable main weather screen from [MainWeatherState].
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mainWeatherNotifierProvider);
    final notifier = ref.read(mainWeatherNotifierProvider.notifier);

    ref.listen(mainWeatherNotifierProvider, (previous, next) {
      if (notifier.takeScrollToCurrentHourRequest()) {
        Future.delayed(
          AppConstants.scrollToCurrentHourDelay,
          _scrollToCurrentHour,
        );
      }
      if (next.userMessage != null &&
          next.userMessageId != previous?.userMessageId) {
        final message = next.userMessage!;
        showSnackBar(message.key.tr, isError: message.isError);
        notifier.clearUserMessage();
      }
    });

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
    // Loading shimmer is controlled by MainWeatherNotifier: isLoading stays
    // false while stale cached forecast data is still displayable.
    if (state.isLoading) {
      return _loadingView();
    }

    final mainWeather = state.mainWeather;
    if (!mainWeather.hasDisplayableForecast) {
      return _emptyView(context);
    }

    // Adapter: screen → detail widgets consume [SavedPlace], not raw Isar.
    final weatherCard = SavedPlace.fromForecast(mainWeather);
    final hourOfDay = state.hourOfDay.clamp(0, mainWeather.time!.length - 1);
    final dayOfNow = state.dayOfNow.clamp(0, mainWeather.timeDaily!.length - 1);

    if (mainWeather.dailyTempRangeAt(dayOfNow) == null) {
      return _emptyView(context);
    }

    return WeatherDetailView(
      weatherCard: weatherCard,
      hourIndex: hourOfDay,
      dayIndex: dayOfNow,
      aqiStandard: ref.watch(settingsProvider.select((s) => s.aqiStandard)),
      itemScrollController: _itemScrollController,
      onHourSelected: notifier.setHourAndDay,
      showDailyTap: () => context.pushRouteUp(
        DailyCardList(
          weatherData: weatherCard,
          dayIndex: dayOfNow,
          hourIndex: hourOfDay,
        ),
      ),
    );
  }

  /// Shows shimmer placeholders while data is loading or daily min/max temps are missing.
  Widget _loadingView() => const MainWeatherLoadingShimmer();

  /// Shows an empty state when forecast data is unavailable.
  Widget _emptyView(BuildContext context) => ListView(
    physics: const AlwaysScrollableScrollPhysics(),
    children: [
      const SizedBox(height: 120),
      Icon(
        Icons.cloud_off_outlined,
        size: 56,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      const SizedBox(height: AppConstants.spacingL),
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
          'location_not_found'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
      ),
    ],
  );
}
