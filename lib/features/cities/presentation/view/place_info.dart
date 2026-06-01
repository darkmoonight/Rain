import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/cities/presentation/widgets/place_action.dart';
import 'package:rain/features/weather/presentation/widgets/daily/daily_card_list.dart';
import 'package:rain/features/weather/presentation/widgets/weather_detail_view.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PlaceInfo extends ConsumerStatefulWidget {
  const PlaceInfo({super.key, required this.weatherCard});
  final WeatherCard weatherCard;

  @override
  ConsumerState<PlaceInfo> createState() => _PlaceInfoState();
}

class _PlaceInfoState extends ConsumerState<PlaceInfo> {
  late int timeNow;
  late int dayNow;
  final itemScrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    _syncTime();
  }

  void _syncTime() {
    final cities = ref.read(citiesNotifierProvider.notifier);
    timeNow = cities.getTime(
      widget.weatherCard.time!,
      widget.weatherCard.timezone!,
    );
    dayNow = cities.getDay(
      widget.weatherCard.timeDaily!,
      widget.weatherCard.timezone!,
    );
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
    final card = widget.weatherCard;
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(citiesNotifierProvider.notifier).updateCard(card);
        _syncTime();
        setState(() {});
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
            card.district!.isNotEmpty
                ? '${card.city}, ${card.district}'
                : '${card.city}',
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
                _syncTime();
                setState(() {});
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
