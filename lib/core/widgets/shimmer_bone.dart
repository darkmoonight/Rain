import 'package:flutter/material.dart';

/// Rectangular placeholder block used inside [MyShimmer.wrap] skeletons.
class ShimmerBone extends StatelessWidget {
  const ShimmerBone({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    this.borderRadius = 4,
  });

  final double width;
  final double height;
  final Color color;
  final double borderRadius;

  /// Muted fill color for shimmer placeholder shapes.
  static Color placeholderColor(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.08);

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
