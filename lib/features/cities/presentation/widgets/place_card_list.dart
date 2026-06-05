import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/cities/presentation/view/place_info.dart';
import 'package:rain/features/cities/presentation/widgets/place_card.dart';
import 'package:rain/core/widgets/confirmation_dialog.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:reorderables/reorderables.dart';

class PlaceCardList extends ConsumerWidget {
  const PlaceCardList({super.key, required this.searchCity});
  final String searchCity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cards = ref.watch(citiesNotifierProvider).cards;
    final filtered = cards.where((c) {
      if (searchCity.isEmpty) return true;
      final city = c.city?.toLowerCase() ?? '';
      final district = c.district?.toLowerCase() ?? '';
      return city.contains(searchCity) || district.contains(searchCity);
    }).toList();

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        ReorderableSliverList(
          delegate: ReorderableSliverChildBuilderDelegate(
            (context, index) => _DismissibleCard(card: filtered[index]),
            childCount: filtered.length,
          ),
          onReorder: searchCity.isEmpty
              ? (oldIndex, newIndex) => ref
                    .read(citiesNotifierProvider.notifier)
                    .reorder(oldIndex, newIndex)
              : (_, _) {},
        ),
      ],
    );
  }
}

class _DismissibleCard extends ConsumerWidget {
  const _DismissibleCard({required this.card});
  final WeatherCard card;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Dismissible(
    key: ValueKey(card.id),
    direction: DismissDirection.endToStart,
    background: Container(
      alignment: Alignment.centerRight,
      child: const Padding(
        padding: EdgeInsets.only(right: 15),
        child: Icon(IconsaxPlusLinear.trash_square, color: Colors.red),
      ),
    ),
    confirmDismiss: (_) => showDeleteConfirmation(
      context: context,
      title: 'deletedCardWeather',
      message: 'deletedCardWeatherQuery',
      onConfirm: () => NavigationHelper.back(context, result: true),
    ),
    onDismissed: (_) =>
        ref.read(citiesNotifierProvider.notifier).deleteCard(card),
    child: GestureDetector(
      onTap: () => NavigationHelper.toDownToUp(
        context,
        () => PlaceInfo(weatherCard: card),
      ),
      child: PlaceCard(
        time: card.time!,
        timeDaily: card.timeDaily!,
        timeDay: card.sunrise!,
        timeNight: card.sunset!,
        weather: card.weathercode!,
        degree: card.temperature2M!,
        district: card.district!,
        city: card.city!,
        timezone: card.timezone!,
      ),
    ),
  );
}
