import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescWeather extends StatelessWidget {
  const DescWeather({
    super.key,
    required this.imageName,
    required this.value,
    required this.desc,
  });
  final String imageName;
  final String value;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageName,
            scale: 20,
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: context.theme.textTheme.labelLarge,
          ),
          Text(
            desc,
            style: context.theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
