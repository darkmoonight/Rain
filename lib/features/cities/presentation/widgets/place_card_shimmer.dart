import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rain/core/widgets/shimmer.dart';

/// Skeleton placeholder matching [PlaceCard] layout while city cards load.
class PlaceCardShimmer extends StatelessWidget {
  const PlaceCardShimmer({super.key});

  /// Builds the shimmer skeleton card.
  @override
  Widget build(BuildContext context) {
    final bone = Theme.of(
      context,
    ).colorScheme.onSurface.withValues(alpha: 0.08);

    return MyShimmer.wrap(
      context,
      Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _Bone(width: 52, height: 22, color: bone),
                        const Gap(7),
                        _Bone(width: 88, height: 18, color: bone),
                      ],
                    ),
                    const Gap(10),
                    _Bone(width: 148, height: 18, color: bone),
                    const Gap(5),
                    _Bone(width: 112, height: 16, color: bone),
                  ],
                ),
              ),
              _Bone(width: 56, height: 56, color: bone, borderRadius: 8),
            ],
          ),
        ),
      ),
    );
  }
}

/// Scrollable list of [PlaceCardShimmer] rows for the initial cities load.
class PlaceCardsLoadingView extends StatelessWidget {
  const PlaceCardsLoadingView({super.key, this.count = 4});

  final int count;

  /// Builds a vertical list of shimmer city-card placeholders.
  @override
  Widget build(BuildContext context) => ListView.builder(
    padding: const EdgeInsets.only(top: 4),
    itemCount: count,
    itemBuilder: (_, _) => const PlaceCardShimmer(),
  );
}

class _Bone extends StatelessWidget {
  const _Bone({
    required this.width,
    required this.height,
    required this.color,
    this.borderRadius = 4,
  });

  final double width;
  final double height;
  final Color color;
  final double borderRadius;

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
  );
}
