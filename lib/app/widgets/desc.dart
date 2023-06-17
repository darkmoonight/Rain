import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescWeather extends StatelessWidget {
  const DescWeather({
    super.key,
    required this.imageName,
    required this.value,
    required this.desc,
    this.message = '',
  });
  final String imageName;
  final String value;
  final String desc;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: SizedBox(
        height: 75,
        width: 100,
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
            Expanded(
              child: Text(
                desc,
                style: context.theme.textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
