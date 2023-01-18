import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    required this.buttonName,
    required this.onTap,
    required this.bgColor,
    required this.textColor,
  });
  final String buttonName;
  final Function() onTap;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          buttonName,
          style: context.theme.textTheme.headline6?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
