import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/widgets/shimmer.dart';
import 'package:rain/core/widgets/shimmer_bone.dart';
import 'package:rain/features/settings/presentation/widgets/settings_card_shape.dart';

/// Skeleton for [AppLicensePage] while package licenses load.
class AppLicensePageShimmer extends StatelessWidget {
  const AppLicensePageShimmer({super.key});

  static const _packageTileHeight = 48.0;
  static const _dividerHeight = 1.0;

  static int _tileCountForHeight(double height) {
    if (height <= _packageTileHeight) return 1;

    var count = 1;
    var used = _packageTileHeight;
    while (used + _dividerHeight + _packageTileHeight <= height) {
      count++;
      used += _dividerHeight + _packageTileHeight;
    }
    return count;
  }

  static double _tilesHeight(int tileCount) {
    if (tileCount <= 0) return 0;
    return tileCount * _packageTileHeight + (tileCount - 1) * _dividerHeight;
  }

  @override
  Widget build(BuildContext context) {
    final bone = ShimmerBone.placeholderColor(context);
    final dividerColor = SettingsCardShape.settingsDividerColor(
      Theme.of(context).colorScheme,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacingL,
        vertical: AppConstants.spacingM,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppConstants.spacingL),
            child: MyShimmer.wrap(
              context,
              Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(AppConstants.spacingXL),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ShimmerBone(
                            width: 64,
                            height: 64,
                            color: bone,
                            borderRadius: AppConstants.borderRadiusLarge,
                          ),
                          const Gap(AppConstants.spacingL),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShimmerBone(width: 72, height: 22, color: bone),
                                const Gap(AppConstants.spacingS),
                                ShimmerBone(
                                  width: 56,
                                  height: 20,
                                  color: bone,
                                  borderRadius: AppConstants.borderRadiusSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gap(AppConstants.spacingL),
                      ShimmerBone(
                        width: double.infinity,
                        height: 14,
                        color: bone,
                      ),
                      const Gap(AppConstants.spacingS),
                      ShimmerBone(width: 220, height: 14, color: bone),
                      const Gap(AppConstants.spacingS),
                      Row(
                        children: [
                          ShimmerBone(
                            width: AppConstants.iconSizeSmall,
                            height: AppConstants.iconSizeSmall,
                            color: bone,
                            borderRadius: AppConstants.borderRadiusSmall,
                          ),
                          const Gap(AppConstants.spacingXS),
                          ShimmerBone(width: 96, height: 14, color: bone),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppConstants.spacingL,
              bottom: AppConstants.spacingM,
            ),
            child: MyShimmer.wrap(
              context,
              Row(
                children: [
                  ShimmerBone(
                    width: 20,
                    height: 20,
                    color: bone,
                    borderRadius: AppConstants.borderRadiusSmall,
                  ),
                  const Gap(AppConstants.spacingS),
                  ShimmerBone(width: 120, height: 16, color: bone),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyShimmer.wrap(
              context,
              Card(
                margin: EdgeInsets.zero,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final tileCount = _tileCountForHeight(
                      constraints.maxHeight,
                    );
                    final usedHeight = _tilesHeight(tileCount);
                    final remainder = constraints.maxHeight - usedHeight;

                    return Column(
                      children: [
                        for (var i = 0; i < tileCount; i++) ...[
                          _PackageTileShimmer(bone: bone),
                          if (i < tileCount - 1)
                            Divider(height: 1, color: dividerColor),
                        ],
                        if (remainder > 0)
                          SizedBox(
                            height: remainder,
                            width: double.infinity,
                            child: ShimmerBone(
                              width: double.infinity,
                              height: remainder,
                              color: bone,
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PackageTileShimmer extends StatelessWidget {
  const _PackageTileShimmer({required this.bone});

  final Color bone;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppLicensePageShimmer._packageTileHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.spacingL),
        child: Row(
          children: [
            ShimmerBone(
              width: AppConstants.iconSizeLarge,
              height: AppConstants.iconSizeLarge,
              color: bone,
              borderRadius: AppConstants.borderRadiusSmall,
            ),
            const Gap(AppConstants.spacingL),
            Expanded(
              child: ShimmerBone(
                width: double.infinity,
                height: 16,
                color: bone,
              ),
            ),
            const Gap(AppConstants.spacingS),
            ShimmerBone(width: 20, height: 16, color: bone),
            const Gap(AppConstants.spacingS),
            ShimmerBone(
              width: 20,
              height: 20,
              color: bone,
              borderRadius: AppConstants.borderRadiusSmall,
            ),
          ],
        ),
      ),
    );
  }
}
