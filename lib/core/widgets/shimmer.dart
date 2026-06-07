import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Placeholder card with shimmer animation while content loads.
class MyShimmer extends StatelessWidget {
  const MyShimmer({super.key, required this.height, this.margin});

  final double height;
  final EdgeInsets? margin;

  /// Builds the shimmer placeholder card with the configured [height].
  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: Theme.of(context).cardColor,
    highlightColor: Theme.of(context).primaryColor,
    child: _buildShimmerCard(),
  );

  /// Builds the empty card used as the shimmer skeleton.
  Widget _buildShimmerCard() => Card(
    margin: margin,
    child: SizedBox(height: height),
  );
}
