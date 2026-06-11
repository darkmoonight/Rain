import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/utils/navigation_helper.dart';

/// Standard app-bar back control (no custom splash; see global theme).
class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
    onPressed: () => NavigationHelper.back(context),
    icon: const Icon(IconsaxPlusLinear.arrow_left_3, size: 20),
  );
}
