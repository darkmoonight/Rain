import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingLinks extends StatelessWidget {
  const SettingLinks({
    super.key,
    required this.icon,
    required this.text,
    required this.switcher,
    required this.dropdown,
    this.dropdownName,
    this.dropdownList,
    this.dropdownCange,
    this.value,
    this.onPressed,
    this.onChange,
  });
  final Icon icon;
  final String text;
  final bool switcher;
  final bool dropdown;
  final String? dropdownName;
  final List<String>? dropdownList;
  final Function(String?)? dropdownCange;
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
                  Expanded(
                    child: Text(
                      text,
                      style: context.theme.textTheme.titleMedium,
                      overflow: TextOverflow.visible,
                    ),
                  ),
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
                : dropdown
                    ? DropdownButton<String>(
                        underline: Container(),
                        value: dropdownName,
                        items: dropdownList!
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: dropdownCange,
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
