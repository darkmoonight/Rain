import 'package:flutter/material.dart';
import 'package:rain/core/theme/theme_text.dart';
import 'package:rain/core/widgets/app_back_button.dart';

/// App bar for settings sub-screens opened with [GoRouterNavigation.pushRouteUp].
class SettingsSecondaryAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SettingsSecondaryAppBar({super.key, required this.title});

  /// Already localized title text.
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    leading: const AppBackButton(),
    title: Text(title, style: ThemeText.appBarTitle(Theme.of(context))),
  );
}
