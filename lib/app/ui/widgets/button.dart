import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    this.height = 50.0,
  });

  final String buttonName;
  final VoidCallback? onPressed;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        style: _buildButtonStyle(context),
        onPressed: onPressed,
        child: Text(buttonName, style: context.textTheme.titleMedium),
      ),
    );
  }

  ButtonStyle _buildButtonStyle(BuildContext context) {
    return ButtonStyle(
      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
      backgroundColor: WidgetStatePropertyAll(
        context.theme.colorScheme.secondaryContainer.withAlpha(80),
      ),
    );
  }
}
