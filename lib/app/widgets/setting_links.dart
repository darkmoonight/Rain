import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingLinks extends StatelessWidget {
  const SettingLinks({
    super.key,
    required this.icon,
    required this.text,
    required this.switcher,
    this.value,
    this.onPressed,
    this.onChange,
  });
  final Icon icon;
  final String text;
  final bool switcher;
  final bool? value;
  final Function()? onPressed;
  final Function(bool)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  icon,
                  const SizedBox(width: 15),
                  Text(text, style: context.theme.textTheme.titleMedium),
                ],
              ),
            ),
            switcher
                ? Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: value!,
                      onChanged: onChange,
                    ),
                  )
                : Icon(
                    Iconsax.arrow_right_3,
                    color: context.theme.iconTheme.color,
                  ),
          ],
        ),
      ),
    );
  }
}
