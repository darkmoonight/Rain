import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/theme/theme_text.dart';
import 'package:rain/core/widgets/app_back_button.dart';
import 'package:rain/core/utils/location_label.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/cities/domain/weather_card_validator.dart';
import 'package:rain/features/cities/presentation/widgets/place_action.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_card_list.dart';
import 'package:rain/features/weather/presentation/widgets/weather_detail_view.dart';
import 'package:rain/i18n/tr.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

/// Full weather detail screen for a single saved city card.
class PlaceInfo extends ConsumerStatefulWidget {
  const PlaceInfo({super.key, this.cardId, this.card})
    : assert(cardId != null || card != null);

  /// Saved city id from [CitiesNotifier]; used when the card is in the cities list.
  final int? cardId;

  /// In-memory card when the location is not saved (e.g. main weather on the map).
  final WeatherCard? card;

  /// Creates the mutable state for this [PlaceInfo] widget.
  @override
  ConsumerState<PlaceInfo> createState() => _PlaceInfoState();
}

/// State for [PlaceInfo], syncing time indices and hourly scroll position.
class _PlaceInfoState extends ConsumerState<PlaceInfo> {
  late int timeNow;
  late int dayNow;
  DateTime? _lastSyncedTimestamp;
  Timer? _clockTimer;
  bool _followCurrentTime = true;
  final itemScrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    timeNow = 0;
    dayNow = 0;
    _clockTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (!mounted) return;
      final card = _resolveCard(ref.read(citiesNotifierProvider));
      if (card != null) _refreshTimeIndices(card, scrollToHour: false);
    });
  }

  @override
  void dispose() {
    _clockTimer?.cancel();
    super.dispose();
  }

  /// Resets hour/day to "now" only when forecast [card.timestamp] changes.
  void _syncTimeFor(WeatherCard card) {
    if (!WeatherCardValidator.isComplete(card)) return;
    if (_lastSyncedTimestamp == card.timestamp) return;

    _lastSyncedTimestamp = card.timestamp;
    _followCurrentTime = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _refreshTimeIndices(card, scrollToHour: true);
    });
  }

  /// Recomputes [timeNow] and [dayNow] from the city's timezone-aware clock.
  void _refreshTimeIndices(WeatherCard card, {required bool scrollToHour}) {
    if (!_followCurrentTime) return;

    final time = card.time;
    final timeDaily = card.timeDaily;
    if (time == null || timeDaily == null || card.timezone == null) return;

    final clock = LocationClock.fromWeatherCard(
      card,
      settingsClockSkewSeconds: ref.read(settingsProvider).clockSkewSeconds,
    );
    final indices = TimeIndexHelper.currentIndices(
      hourly: time,
      daily: timeDaily,
      clock: clock,
    );
    if (indices.hour == timeNow && indices.day == dayNow) return;

    setState(() {
      timeNow = indices.hour;
      dayNow = indices.day;
    });

    if (!scrollToHour) return;
    Future.delayed(const Duration(milliseconds: 30), () {
      if (itemScrollController.isAttached) {
        itemScrollController.scrollTo(
          index: timeNow,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  /// Whether [hour]/[day] match the city's current local forecast slot.
  bool _isCurrentTimeSlot(WeatherCard card, int hour, int day) {
    final time = card.time;
    final timeDaily = card.timeDaily;
    if (time == null ||
        time.isEmpty ||
        timeDaily == null ||
        timeDaily.isEmpty ||
        card.timezone == null) {
      return false;
    }

    return TimeIndexHelper.isCurrentTimeSlot(
      hourly: time,
      daily: timeDaily,
      clock: LocationClock.fromWeatherCard(
        card,
        settingsClockSkewSeconds: ref.read(settingsProvider).clockSkewSeconds,
      ),
      hourIndex: hour,
      dayIndex: day,
    );
  }

  /// Resolves the card from the cities list, optional [card] fallback, or main weather.
  WeatherCard? _resolveCard(CitiesState cities) {
    if (widget.cardId != null) {
      final fromList = cities.cardById(widget.cardId!);
      if (fromList != null) return fromList;
    }
    final fallback = widget.card;
    if (fallback == null) return null;

    final main = ref.read(mainWeatherNotifierProvider);
    final loc = main.location;
    if (loc.lat != null &&
        loc.lon != null &&
        fallback.lat == loc.lat &&
        fallback.lon == loc.lon &&
        !main.isLoading) {
      return WeatherCard.fromMainAndLocation(main.mainWeather, loc);
    }
    return fallback;
  }

  /// Returns true when [card] is stored in the saved-cities list.
  bool _isPersistedCity(CitiesState cities, WeatherCard card) {
    if (widget.cardId != null && cities.cardById(widget.cardId!) != null) {
      return true;
    }
    for (final saved in cities.cards) {
      if (saved.id == card.id && card.id > 0) return true;
      if (saved.lat == card.lat &&
          saved.lon == card.lon &&
          card.lat != null &&
          card.lon != null) {
        return true;
      }
    }
    return false;
  }

  /// Builds the weather detail scaffold with refresh and edit actions.
  @override
  Widget build(BuildContext context) {
    final cities = ref.watch(citiesNotifierProvider);
    ref.watch(mainWeatherNotifierProvider);
    final card = _resolveCard(cities);

    // Missing id: spinner while loading, load error on failure, not-found otherwise.
    if (card == null) {
      return Scaffold(
        appBar: AppBar(leading: const AppBackButton()),
        body: Center(
          child: cities.isLoading
              ? const CircularProgressIndicator()
              : Text(
                  cities.loadError ? 'citiesLoadError'.tr : 'cityNotFound'.tr,
                ),
        ),
      );
    }

    _syncTimeFor(card);

    final persisted = _isPersistedCity(cities, card);

    return RefreshIndicator(
      onRefresh: () async {
        if (persisted) {
          await ref.read(citiesNotifierProvider.notifier).updateCard(card);
        } else {
          await ref.read(mainWeatherNotifierProvider.notifier).refresh();
        }
        if (mounted) {
          setState(() => _followCurrentTime = true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: const AppBackButton(),
          title: Text(
            formatLocationLabel(card.city, card.district),
            style: ThemeText.appBarTitle(Theme.of(context)),
          ),
          actions: [
            if (persisted)
              IconButton(
                onPressed: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    enableDrag: false,
                    builder: (_) => PlaceAction(edit: true, card: card),
                  );
                  if (mounted) setState(() {});
                },
                icon: const Icon(IconsaxPlusLinear.edit, size: 18),
              ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: WeatherDetailView(
              weatherCard: card,
              hourIndex: timeNow,
              dayIndex: dayNow,
              aqiStandard: ref.watch(settingsProvider).aqiStandard,
              itemScrollController: itemScrollController,
              onHourSelected: (h, d) => setState(() {
                timeNow = h;
                dayNow = d;
                _followCurrentTime = _isCurrentTimeSlot(card, h, d);
              }),
              showDailyTap: () => NavigationHelper.toDownToUp(
                context,
                () => DailyCardList(
                  weatherData: card,
                  dayIndex: dayNow,
                  hourIndex: timeNow,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
