import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    required this.buttonName,
    required this.onTap,
  });
  final String buttonName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: TextButton(
          onPressed: onTap,
          child: Text(
            buttonName,
            style: context.textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
