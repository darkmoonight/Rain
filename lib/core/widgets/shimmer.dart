import 'package:flutter/material.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/widgets/shimmer_bone.dart';
import 'package:shimmer/shimmer.dart';

/// Placeholder card with shimmer animation while content loads.
class MyShimmer extends StatelessWidget {
  const MyShimmer({super.key, required this.height, this.margin});

  final double height;
  final EdgeInsets? margin;

  /// Opaque mask color for shimmer shapes; the gradient supplies visible tones.
  static Color shimmerMaskColor(BuildContext context) => Colors.white;

  /// Muted skeleton fill that contrasts with the app background.
  static Color placeholderFillColor(BuildContext context) =>
      shimmerMaskColor(context);

  /// Shimmer gradient endpoints tuned for light, dark, and AMOLED themes.
  static (Color base, Color highlight) shimmerGradientColors(
    BuildContext context,
  ) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (isDark) {
      return (
        onSurface.withValues(alpha: 0.14),
        onSurface.withValues(alpha: 0.35),
      );
    }
    return (
      onSurface.withValues(alpha: 0.06),
      onSurface.withValues(alpha: 0.18),
    );
  }

  /// Wraps [child] with the app shimmer colors.
  static Widget wrap(BuildContext context, Widget child) {
    final (base, highlight) = shimmerGradientColors(context);
    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      child: child,
    );
  }

  /// Builds the shimmer placeholder card with the configured [height].
  @override
  Widget build(BuildContext context) =>
      wrap(context, _buildPlaceholder(context));

  /// Visible block used as the shimmer skeleton (not the page background).
  Widget _buildPlaceholder(BuildContext context) => Container(
    margin: margin,
    height: height,
    width: double.infinity,
    decoration: BoxDecoration(
      color: shimmerMaskColor(context),
      borderRadius: BorderRadius.circular(AppConstants.borderRadiusXLarge),
    ),
  );
}

/// Full-width loading skeleton for the main weather tab.
class MainWeatherLoadingShimmer extends StatelessWidget {
  const MainWeatherLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final bone = ShimmerBone.placeholderColor(context);
    return MyShimmer.wrap(
      context,
      ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          _bone(context, bone, 200),
          _bone(
            context,
            bone,
            130,
            margin: const EdgeInsets.symmetric(vertical: 15),
          ),
          _bone(context, bone, 90, margin: const EdgeInsets.only(bottom: 15)),
          _bone(context, bone, 400, margin: const EdgeInsets.only(bottom: 15)),
          _bone(context, bone, 450, margin: const EdgeInsets.only(bottom: 15)),
        ],
      ),
    );
  }

  Widget _bone(
    BuildContext context,
    Color bone,
    double height, {
    EdgeInsets? margin,
  }) => Padding(
    padding: margin ?? EdgeInsets.zero,
    child: ShimmerBone(
      width: double.infinity,
      height: height,
      color: bone,
      borderRadius: AppConstants.borderRadiusXLarge,
    ),
  );
}
