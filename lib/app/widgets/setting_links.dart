import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingLinks extends StatelessWidget {
  const SettingLinks({
    super.key,
    required this.icon,
    required this.text,
    this.switcher = false,
    this.dropdown = false,
    this.info = false,
    this.infoSettings = false,
    this.dropdownName,
    this.dropdownList,
    this.dropdownCange,
    this.value,
    this.onPressed,
    this.onChange,
    this.textInfo,
  });
  final Widget icon;
  final String text;
  final bool switcher;
  final bool dropdown;
  final bool info;
  final bool infoSettings;
  final String? textInfo;
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
                      style: context.textTheme.titleMedium,
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
                    : info
                        ? infoSettings
                            ? Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Text(
                                      textInfo!,
                                      style: context.textTheme.bodyMedium,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                  Icon(
                                    Iconsax.arrow_right_3,
                                    color: context.theme.iconTheme.color,
                                    size: 18,
                                  ),
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Text(
                                  textInfo!,
                                  style: context.textTheme.titleMedium,
                                  overflow: TextOverflow.visible,
                                ),
                              )
                        : Icon(
                            Iconsax.arrow_right_3,
                            color: context.theme.iconTheme.color,
                            size: 18,
                          ),
          ],
        ),
      ),
    );
  }
}
