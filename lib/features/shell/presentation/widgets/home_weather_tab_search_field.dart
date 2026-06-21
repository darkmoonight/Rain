import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/widgets/city_search_field.dart';
import 'package:rain/i18n/tr.dart';

/// Inline city search field shown in the weather tab app bar.
class HomeWeatherTabSearchField extends ConsumerWidget {
  const HomeWeatherTabSearchField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onClose,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CitySearchAutocomplete(
      controller: controller,
      focusNode: focusNode,
      optionsStyle: CitySearchOptionsStyle.fixedWidth,
      optionsWidth: 250,
      onSelected: (selection) async {
        if (selection.latitude == null || selection.longitude == null) return;
        await ref.read(mainWeatherNotifierProvider.notifier).deleteAll(true);
        await ref
            .read(mainWeatherNotifierProvider.notifier)
            .getLocation(
              selection.latitude!,
              selection.longitude!,
              selection.admin1 ?? '',
              selection.name ?? '',
            );
        onClose();
      },
      fieldViewBuilder: (context, _, _, _) => TextField(
        controller: controller,
        focusNode: focusNode,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          hintText: 'search'.tr,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
