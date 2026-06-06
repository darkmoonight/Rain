import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/utils/location_label.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/cities/presentation/widgets/place_card.dart';
import 'package:rain/i18n/tr.dart';

/// Renders a saved card as [PlaceCard] or a retry placeholder when incomplete.
class WeatherCardTile extends ConsumerWidget {
  const WeatherCardTile({super.key, required this.card});

  final WeatherCard card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placeCard = PlaceCard.tryFromWeatherCard(card);
    if (placeCard != null) return placeCard;
    return InvalidWeatherCard(card: card);
  }
}

/// Fallback tile shown when a saved card lacks complete forecast data.
class InvalidWeatherCard extends ConsumerWidget {
  const InvalidWeatherCard({super.key, required this.card});

  final WeatherCard card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final label = formatLocationLabel(card.city, card.district);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label.isEmpty ? 'city'.tr : label,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'citiesLoadError'.tr,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () =>
                  ref.read(citiesNotifierProvider.notifier).updateCard(card),
              icon: const Icon(IconsaxPlusLinear.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
