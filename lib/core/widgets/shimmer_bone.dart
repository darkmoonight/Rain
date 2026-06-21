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

  /// Opaque mask for [Shimmer.fromColors]; gradient paints the visible tone.
  static Color placeholderColor(BuildContext context) => Colors.white;

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
