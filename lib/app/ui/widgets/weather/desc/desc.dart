import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class DescWeather extends StatefulWidget {
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
  State<DescWeather> createState() => _DescWeatherState();
}

class _DescWeatherState extends State<DescWeather> {
  bool hide = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return GestureDetector(
      onTap: _toggleDescriptionVisibility,
      child: Tooltip(
        message: widget.message,
        child: SizedBox(
          height: 90,
          width: 100,
          child: _buildContent(textTheme),
        ),
      ),
    );
  }

  void _toggleDescriptionVisibility() {
    setState(() => hide = !hide);
  }

  Widget _buildContent(TextTheme textTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(widget.imageName, scale: 20),
        const Gap(5),
        Text(
          widget.value,
          style: textTheme.labelLarge,
          overflow: TextOverflow.ellipsis,
        ),
        Expanded(
          child: Text(
            widget.desc,
            style: textTheme.bodySmall,
            overflow: hide ? TextOverflow.ellipsis : TextOverflow.visible,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
