import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rain/core/widgets/shimmer.dart';
import 'package:rain/core/widgets/shimmer_bone.dart';

/// Skeleton placeholder matching [PlaceCard] layout while city cards load.
class PlaceCardShimmer extends StatelessWidget {
  const PlaceCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final bone = ShimmerBone.placeholderColor(context);

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
                        ShimmerBone(width: 52, height: 22, color: bone),
                        const Gap(7),
                        ShimmerBone(width: 88, height: 18, color: bone),
                      ],
                    ),
                    const Gap(10),
                    ShimmerBone(width: 148, height: 18, color: bone),
                    const Gap(5),
                    ShimmerBone(width: 112, height: 16, color: bone),
                  ],
                ),
              ),
              ShimmerBone(width: 56, height: 56, color: bone, borderRadius: 8),
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

  @override
  Widget build(BuildContext context) => ListView.builder(
    padding: const EdgeInsets.only(top: 4),
    itemCount: count,
    itemBuilder: (_, _) => const PlaceCardShimmer(),
  );
}
