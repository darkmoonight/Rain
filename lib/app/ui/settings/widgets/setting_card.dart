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
    this.dropdownChange,
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
  final ValueChanged<String?>? dropdownChange;
  final bool? value;
  final VoidCallback? onPressed;
  final ValueChanged<bool>? onChange;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 1,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onTap: onPressed,
        leading: icon,
        title: Text(
          text,
          style: context.textTheme.titleMedium,
          overflow: TextOverflow.visible,
        ),
        trailing: _buildTrailingWidget(context),
      ),
    );
  }

  Widget _buildTrailingWidget(BuildContext context) {
    if (switcher) {
      return _buildSwitchWidget();
    } else if (dropdown) {
      return _buildDropdownWidget();
    } else if (info) {
      return _buildInfoWidget();
    } else {
      return const Icon(IconsaxPlusLinear.arrow_right_3, size: 18);
    }
  }

  Widget _buildSwitchWidget() {
    return Transform.scale(
      scale: 0.8,
      child: Switch(value: value!, onChanged: onChange),
    );
  }

  Widget _buildDropdownWidget() {
    return DropdownButton<String>(
      icon: const Padding(
        padding: EdgeInsets.only(left: 7),
        child: Icon(IconsaxPlusLinear.arrow_down),
      ),
      iconSize: 15,
      alignment: AlignmentDirectional.centerEnd,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      underline: Container(),
      value: dropdownName,
      items: dropdownList!.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: dropdownChange,
    );
  }

  Widget _buildInfoWidget() {
    if (infoSettings) {
      return Wrap(
        children: [
          infoWidget!,
          const Icon(IconsaxPlusLinear.arrow_right_3, size: 18),
        ],
      );
    } else {
      return infoWidget!;
    }
  }
}
