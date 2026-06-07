import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/core/widgets/confirmation_dialog.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/cities/domain/weather_card_validator.dart';
import 'package:rain/features/cities/presentation/view/place_info.dart';
import 'package:rain/features/cities/presentation/widgets/weather_card_tile.dart';
import 'package:reorderables/reorderables.dart';

/// Reorderable list of saved city cards with swipe-to-delete.
class PlaceCardList extends ConsumerWidget {
  const PlaceCardList({super.key, required this.searchCity});
  final String searchCity;

  /// Builds a filtered, reorderable sliver list of [WeatherCard] tiles.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cards = ref
        .watch(citiesNotifierProvider)
        .cards
        .where((card) => WeatherCardValidator.matchesSearch(card, searchCity))
        .toList();

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        ReorderableSliverList(
          delegate: ReorderableSliverChildBuilderDelegate(
            (context, index) => _DismissibleCard(card: cards[index]),
            childCount: cards.length,
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

// --- DismissibleCard ---

/// Swipeable wrapper that navigates to detail or deletes a city card.
class _DismissibleCard extends ConsumerWidget {
  const _DismissibleCard({required this.card});
  final WeatherCard card;

  /// Builds a [Dismissible] tile that opens [PlaceInfo] or confirms deletion.
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
        () => PlaceInfo(cardId: card.id),
      ),
      child: WeatherCardTile(card: card),
    ),
  );
}
