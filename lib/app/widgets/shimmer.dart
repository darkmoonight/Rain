import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmer extends StatelessWidget {
  const MyShimmer({
    super.key,
    required this.hight,
    this.edgeInsetsMargin,
    this.edgeInsetsPadding,
  });
  final double hight;
  final EdgeInsets? edgeInsetsMargin;
  final EdgeInsets? edgeInsetsPadding;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.theme.colorScheme.primaryContainer,
      highlightColor: context.theme.unselectedWidgetColor,
      child: Container(
        height: hight,
        margin: edgeInsetsMargin,
        padding: edgeInsetsPadding,
        decoration: BoxDecoration(
            color: context.theme.colorScheme.primaryContainer,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
}
