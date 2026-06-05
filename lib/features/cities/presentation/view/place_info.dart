import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/di/providers.dart';
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

class PlaceInfo extends ConsumerStatefulWidget {
  const PlaceInfo({super.key, required this.cardId});
  final int cardId;

  @override
  ConsumerState<PlaceInfo> createState() => _PlaceInfoState();
}

class _PlaceInfoState extends ConsumerState<PlaceInfo> {
  late int timeNow;
  late int dayNow;
  DateTime? _lastSyncedTimestamp;
  final itemScrollController = ItemScrollController();

  void _syncTimeFor(WeatherCard card) {
    if (!WeatherCardValidator.isComplete(card)) return;
    if (_lastSyncedTimestamp == card.timestamp) return;
    _lastSyncedTimestamp = card.timestamp;

    final time = card.time;
    final timeDaily = card.timeDaily;
    final timezone = card.timezone;
    if (time == null || timeDaily == null || timezone == null) return;

    timeNow = TimeIndexHelper.getTime(time, timezone);
    dayNow = TimeIndexHelper.getDay(timeDaily, timezone);

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

  @override
  Widget build(BuildContext context) {
    final cities = ref.watch(citiesNotifierProvider);
    final card = cities.cardById(widget.cardId);

    if (card == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => NavigationHelper.back(context),
            icon: const Icon(IconsaxPlusLinear.arrow_left_3, size: 20),
          ),
        ),
        body: Center(
          child: cities.isLoading
              ? const CircularProgressIndicator()
              : Text('citiesLoadError'.tr),
        ),
      );
    }

    _syncTimeFor(card);

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(citiesNotifierProvider.notifier).updateCard(card);
        if (mounted) setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => NavigationHelper.back(context),
            icon: const Icon(IconsaxPlusLinear.arrow_left_3, size: 20),
          ),
          title: Text(
            formatLocationLabel(card.city, card.district),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          actions: [
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
              itemScrollController: itemScrollController,
              onHourSelected: (h, d) => setState(() {
                timeNow = h;
                dayNow = d;
              }),
              showDailyTap: () => NavigationHelper.toDownToUp(
                context,
                () => DailyCardList(weatherData: card),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
