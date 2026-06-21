import 'package:flutter/material.dart';
import 'package:rain/features/settings/presentation/widgets/settings_tile.dart';

/// [SettingsTile] with a scaled [Switch] trailing control.
class SettingsSwitchTile extends StatelessWidget {
  const SettingsSwitchTile({
    super.key,
    required this.leading,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final Widget leading;

  /// i18n key for the title.
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      leading: leading,
      title: title,
      trailing: Transform.scale(
        scale: 0.8,
        child: Switch(value: value, onChanged: onChanged),
      ),
    );
  }
}
