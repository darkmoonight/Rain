import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/core/widgets/text_form.dart';
import 'package:rain/i18n/tr.dart';

/// Layout preset for the city search suggestion dropdown.
enum CitySearchOptionsStyle {
  /// Default list capped at 200px height.
  standard,

  /// Padded card with rounded corners (geolocation screen).
  paddedCard,

  /// Compact rows for map overlay.
  compact,

  /// Fixed 250px width (home app-bar search).
  fixedWidth,
}

/// Formats a [CitySearchResult] for display in the field and dropdown.
String citySearchResultLabel(CitySearchResult option) =>
    '${option.name}, ${option.admin1}';

/// Shared [RawAutocomplete] for Open-Meteo city search.
class CitySearchAutocomplete extends ConsumerStatefulWidget {
  const CitySearchAutocomplete({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onSelected,
    this.fieldViewBuilder,
    this.optionsViewBuilder,
    this.optionsStyle = CitySearchOptionsStyle.standard,
    this.optionsPadding,
    this.optionsWidth,
    this.optionsMaxHeight,
    this.optionsTextStyle,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(CitySearchResult) onSelected;
  final Widget Function(
    BuildContext context,
    TextEditingController fieldController,
    FocusNode fieldFocusNode,
    VoidCallback onFieldSubmitted,
  )?
  fieldViewBuilder;
  final Widget Function(
    BuildContext context,
    AutocompleteOnSelected<CitySearchResult> onSelected,
    Iterable<CitySearchResult> options,
  )?
  optionsViewBuilder;
  final CitySearchOptionsStyle optionsStyle;
  final EdgeInsets? optionsPadding;
  final double? optionsWidth;
  final double? optionsMaxHeight;
  final TextStyle? optionsTextStyle;

  @override
  ConsumerState<CitySearchAutocomplete> createState() =>
      _CitySearchAutocompleteState();
}

class _CitySearchAutocompleteState
    extends ConsumerState<CitySearchAutocomplete> {
  @override
  Widget build(BuildContext context) {
    final labelLarge = Theme.of(context).textTheme.labelLarge;

    Future<Iterable<CitySearchResult>> searchCities(
      TextEditingValue value,
    ) async {
      final query = value.text;
      if (query.isEmpty) {
        return const Iterable<CitySearchResult>.empty();
      }

      await Future<void>.delayed(AppConstants.debounceDelay);
      if (!mounted || widget.controller.text != query) {
        return const Iterable<CitySearchResult>.empty();
      }

      final locale = ref.read(localeProvider);
      try {
        return await ref
            .read(weatherRemoteDatasourceProvider)
            .searchCities(query, locale.languageCode);
      } catch (_) {
        return const Iterable<CitySearchResult>.empty();
      }
    }

    return RawAutocomplete<CitySearchResult>(
      focusNode: widget.focusNode,
      textEditingController: widget.controller,
      fieldViewBuilder:
          widget.fieldViewBuilder ??
          (context, fieldController, fieldFocusNode, onFieldSubmitted) =>
              MyTextForm(
                labelText: 'search'.tr,
                type: TextInputType.text,
                icon: const Icon(IconsaxPlusLinear.global_search, size: 20),
                controller: widget.controller,
                focusNode: widget.focusNode,
                margin: EdgeInsets.zero,
              ),
      optionsBuilder: searchCities,
      onSelected: widget.onSelected,
      displayStringForOption: citySearchResultLabel,
      optionsViewBuilder:
          widget.optionsViewBuilder ??
          (context, onSelected, options) => buildCitySearchOptionsView(
            context: context,
            onSelected: onSelected,
            options: options,
            style: widget.optionsStyle,
            padding: widget.optionsPadding,
            width: widget.optionsWidth,
            maxHeight: widget.optionsMaxHeight,
            textStyle: widget.optionsTextStyle ?? labelLarge,
          ),
    );
  }
}

/// Builds the dropdown list for [CitySearchAutocomplete].
Widget buildCitySearchOptionsView({
  required BuildContext context,
  required AutocompleteOnSelected<CitySearchResult> onSelected,
  required Iterable<CitySearchResult> options,
  CitySearchOptionsStyle style = CitySearchOptionsStyle.standard,
  EdgeInsets? padding,
  double? width,
  double? maxHeight,
  TextStyle? textStyle,
}) {
  final list = ListView.builder(
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    itemCount: options.length,
    itemBuilder: (context, index) {
      final option = options.elementAt(index);
      final title = Text(citySearchResultLabel(option), style: textStyle);
      return switch (style) {
        CitySearchOptionsStyle.compact => InkWell(
          onTap: () => onSelected(option),
          child: ListTile(
            dense: true,
            visualDensity: VisualDensity.compact,
            title: title,
          ),
        ),
        CitySearchOptionsStyle.paddedCard => InkWell(
          onTap: () => onSelected(option),
          child: ListTile(title: title),
        ),
        _ => ListTile(title: title, onTap: () => onSelected(option)),
      };
    },
  );

  final borderRadius = switch (style) {
    CitySearchOptionsStyle.paddedCard => BorderRadius.circular(
      AppConstants.borderRadiusXLarge,
    ),
    CitySearchOptionsStyle.fixedWidth || CitySearchOptionsStyle.compact =>
      BorderRadius.circular(AppConstants.mapBorderRadius),
    CitySearchOptionsStyle.standard => null,
  };

  final effectiveMaxHeight = maxHeight ?? 200.0;
  Widget constrainedList =
      style == CitySearchOptionsStyle.standard || maxHeight != null
      ? ConstrainedBox(
          constraints: BoxConstraints(maxHeight: effectiveMaxHeight),
          child: list,
        )
      : list;

  Widget material = Material(
    elevation: AppConstants.cardElevation,
    borderRadius: borderRadius,
    child: width != null
        ? SizedBox(width: width, child: constrainedList)
        : constrainedList,
  );

  if (padding != null) {
    material = Padding(padding: padding, child: material);
  }

  return Align(
    alignment: style == CitySearchOptionsStyle.paddedCard
        ? Alignment.topCenter
        : Alignment.topLeft,
    child: material,
  );
}

/// Card-style city search field used on map and city forms.
class CitySearchField extends ConsumerStatefulWidget {
  const CitySearchField({
    super.key,
    required this.onSelected,
    this.controller,
    this.focusNode,
    this.variant = TextFieldVariant.card,
    this.margin = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    this.elevation,
    this.icon,
    this.labelText,
    this.onChanged,
    this.iconButton,
    this.optionsStyle = CitySearchOptionsStyle.standard,
    this.optionsPadding,
    this.optionsMaxHeight,
    this.style,
    this.contentPadding,
  });

  final void Function(CitySearchResult) onSelected;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextFieldVariant variant;
  final EdgeInsets margin;
  final double? elevation;
  final Icon? icon;
  final String? labelText;
  final void Function(String)? onChanged;
  final Widget? iconButton;
  final CitySearchOptionsStyle optionsStyle;
  final EdgeInsets? optionsPadding;
  final double? optionsMaxHeight;
  final TextStyle? style;
  final EdgeInsets? contentPadding;

  @override
  ConsumerState<CitySearchField> createState() => _CitySearchFieldState();
}

class _CitySearchFieldState extends ConsumerState<CitySearchField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  late final bool _ownsController;
  late final bool _ownsFocusNode;

  @override
  void initState() {
    super.initState();
    _ownsController = widget.controller == null;
    _ownsFocusNode = widget.focusNode == null;
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (_ownsController) _controller.dispose();
    if (_ownsFocusNode) _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CitySearchAutocomplete(
      controller: _controller,
      focusNode: _focusNode,
      onSelected: widget.onSelected,
      optionsStyle: widget.optionsStyle,
      optionsPadding: widget.optionsPadding,
      optionsMaxHeight: widget.optionsMaxHeight,
      optionsTextStyle: widget.style,
      fieldViewBuilder: (context, _, _, _) => MyTextForm(
        labelText: widget.labelText ?? 'search'.tr,
        type: TextInputType.text,
        icon:
            widget.icon ??
            const Icon(IconsaxPlusLinear.global_search, size: 20),
        variant: widget.variant,
        controller: _controller,
        margin: widget.margin,
        elevation: widget.elevation,
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        iconButton: widget.iconButton,
        style: widget.style,
        contentPadding: widget.contentPadding,
      ),
    );
  }
}
