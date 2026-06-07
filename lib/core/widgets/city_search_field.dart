import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/core/widgets/text_form.dart';

/// Autocomplete text field for searching and selecting cities.
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

  /// Creates the state for [CitySearchField].
  @override
  ConsumerState<CitySearchField> createState() => _CitySearchFieldState();
}

/// State for [CitySearchField] managing controllers and autocomplete options.
class _CitySearchFieldState extends ConsumerState<CitySearchField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  /// Initializes the text controller and focus node, creating them if needed.
  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  /// Disposes locally created controllers and focus nodes.
  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  /// Builds the city search autocomplete field and dropdown options.
  @override
  Widget build(BuildContext context) {
    final labelLarge = Theme.of(context).textTheme.labelLarge;
    final locale = ref.watch(localeProvider);

    return RawAutocomplete<CitySearchResult>(
      focusNode: _focusNode,
      textEditingController: _controller,
      fieldViewBuilder:
          (
            BuildContext context,
            TextEditingController fieldController,
            FocusNode fieldFocusNode,
            VoidCallback onFieldSubmitted,
          ) => MyTextForm(
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
          ),
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<CitySearchResult>.empty();
        }
        return ref
            .read(weatherRemoteDatasourceProvider)
            .searchCities(textEditingValue.text, locale.languageCode);
      },
      onSelected: widget.onSelected,
      displayStringForOption: (CitySearchResult option) =>
          '${option.name}, ${option.admin1}',
      optionsViewBuilder:
          (
            BuildContext context,
            AutocompleteOnSelected<CitySearchResult> onSelected,
            Iterable<CitySearchResult> options,
          ) => _buildOptionsView(context, onSelected, options, labelLarge),
    );
  }

  /// Builds the scrollable list of city search results.
  Widget _buildOptionsView(
    BuildContext context,
    AutocompleteOnSelected<CitySearchResult> onSelected,
    Iterable<CitySearchResult> options,
    TextStyle? labelLarge,
  ) => Align(
    alignment: Alignment.topLeft,
    child: Material(
      elevation: 4,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 200),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: options.length,
          itemBuilder: (context, index) {
            final option = options.elementAt(index);
            return ListTile(
              title: Text(
                '${option.name}, ${option.admin1}',
                style: labelLarge,
              ),
              onTap: () => onSelected(option),
            );
          },
        ),
      ),
    ),
  );
}
