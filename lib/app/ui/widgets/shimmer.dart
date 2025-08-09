import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmer extends StatelessWidget {
  const MyShimmer({super.key, required this.height, this.margin});

  final double height;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.theme.cardColor,
      highlightColor: context.theme.primaryColor,
      child: _buildShimmerCard(),
    );
  }

  Widget _buildShimmerCard() {
    return Card(
      margin: margin,
      child: SizedBox(height: height),
    );
  }
}
