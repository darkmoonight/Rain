import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({
    super.key,
    required this.icon,
    required this.text,
    this.switcher = false,
    this.dropdown = false,
    this.info = false,
    this.infoSettings = false,
    this.elevation,
    this.dropdownName,
    this.dropdownList,
    this.dropdownCange,
    this.value,
    this.onPressed,
    this.onChange,
    this.infoWidget,
  });
  final Widget icon;
  final String text;
  final bool switcher;
  final bool dropdown;
  final bool info;
  final bool infoSettings;
  final Widget? infoWidget;
  final String? dropdownName;
  final List<String>? dropdownList;
  final Function(String?)? dropdownCange;
  final bool? value;
  final Function()? onPressed;
  final Function(bool)? onChange;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 1,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onTap: onPressed,
        leading: icon,
        title: Text(
          text,
          style: context.textTheme.titleMedium,
          overflow: TextOverflow.visible,
        ),
        trailing: switcher
            ? Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: value!,
                  onChanged: onChange,
                ),
              )
            : dropdown
                ? DropdownButton<String>(
                    icon: const Padding(
                      padding: EdgeInsets.only(left: 7),
                      child: Icon(IconsaxPlusLinear.arrow_down),
                    ),
                    iconSize: 15,
                    alignment: AlignmentDirectional.centerEnd,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                        ? Wrap(
                            children: [
                              infoWidget!,
                              const Icon(
                                IconsaxPlusLinear.arrow_right_3,
                                size: 18,
                              ),
                            ],
                          )
                        : infoWidget!
                    : const Icon(
                        IconsaxPlusLinear.arrow_right_3,
                        size: 18,
                      ),
      ),
    );
  }
}
