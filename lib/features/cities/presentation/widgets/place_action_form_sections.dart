import 'package:material_ui/material_ui.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/utils/responsive_utils.dart';
import 'package:rain/core/widgets/city_search_field.dart';
import 'package:rain/core/widgets/place_form_fields.dart';
import 'package:rain/core/widgets/text_form.dart';
import 'package:rain/domain/entities/city_search_result.dart';
import 'package:rain/features/cities/presentation/widgets/place_action_editing_controller.dart';
import 'package:rain/i18n/tr.dart';

/// Search + coordinate/city fields used inside [PlaceAction].
class PlaceActionFormSections extends StatelessWidget {
  const PlaceActionFormSections({
    super.key,
    required this.padding,
    required this.textFieldElevation,
    required this.searchController,
    required this.focusNode,
    required this.latController,
    required this.lonController,
    required this.cityController,
    required this.districtController,
    required this.editingController,
    required this.onCitySelected,
  });

  final double padding;
  final double textFieldElevation;
  final TextEditingController searchController;
  final FocusNode focusNode;
  final TextEditingController latController;
  final TextEditingController lonController;
  final TextEditingController cityController;
  final TextEditingController districtController;
  final PlaceActionEditingController editingController;
  final void Function(CitySearchResult selection) onCitySelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SearchSection(
          padding: padding,
          textFieldElevation: textFieldElevation,
          searchController: searchController,
          focusNode: focusNode,
          onCitySelected: onCitySelected,
        ),
        SizedBox(height: padding * 1.5),
        _PlaceFieldsSection(
          padding: padding,
          textFieldElevation: textFieldElevation,
          latController: latController,
          lonController: lonController,
          cityController: cityController,
          districtController: districtController,
          editingController: editingController,
        ),
        SizedBox(height: padding * 2),
      ],
    );
  }
}

class _SearchSection extends StatelessWidget {
  const _SearchSection({
    required this.padding,
    required this.textFieldElevation,
    required this.searchController,
    required this.focusNode,
    required this.onCitySelected,
  });

  final double padding;
  final double textFieldElevation;
  final TextEditingController searchController;
  final FocusNode focusNode;
  final void Function(CitySearchResult selection) onCitySelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlaceActionSectionHeader(
          title: 'search'.tr,
          icon: IconsaxPlusBold.global_search,
        ),
        SizedBox(height: padding),
        CitySearchAutocomplete(
          controller: searchController,
          focusNode: focusNode,
          fieldViewBuilder:
              (context, fieldController, fieldFocusNode, onFieldSubmitted) =>
                  MyTextForm(
                    elevation: textFieldElevation,
                    labelText: 'searchCity'.tr,
                    type: TextInputType.text,
                    icon: Icon(
                      IconsaxPlusLinear.global_search,
                      color: colorScheme.primary,
                    ),
                    controller: searchController,
                    focusNode: focusNode,
                    margin: EdgeInsets.zero,
                  ),
          optionsStyle: CitySearchOptionsStyle.paddedCard,
          optionsMaxHeight: 250,
          onSelected: onCitySelected,
        ),
      ],
    );
  }
}

class _PlaceFieldsSection extends StatelessWidget {
  const _PlaceFieldsSection({
    required this.padding,
    required this.textFieldElevation,
    required this.latController,
    required this.lonController,
    required this.cityController,
    required this.districtController,
    required this.editingController,
  });

  final double padding;
  final double textFieldElevation;
  final TextEditingController latController;
  final TextEditingController lonController;
  final TextEditingController cityController;
  final TextEditingController districtController;
  final PlaceActionEditingController editingController;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlaceActionSectionHeader(
          title: 'location'.tr,
          icon: IconsaxPlusBold.location,
        ),
        SizedBox(height: padding),
        PlaceFormFields(
          latitudeController: latController,
          longitudeController: lonController,
          cityController: cityController,
          districtController: districtController,
          elevation: textFieldElevation,
          fieldMargin: EdgeInsets.zero,
          fieldSpacing: padding,
          iconColor: colorScheme.primary,
          includeLabels: false,
          onLatitudeChanged: (value) => editingController.lat.value = value,
          onLongitudeChanged: (value) => editingController.lon.value = value,
        ),
        SizedBox(height: padding * 1.5),
        PlaceFormFields(
          latitudeController: latController,
          longitudeController: lonController,
          cityController: cityController,
          districtController: districtController,
          elevation: textFieldElevation,
          fieldMargin: EdgeInsets.zero,
          fieldSpacing: padding,
          iconColor: colorScheme.primary,
          includeCoordinates: false,
          onCityChanged: (value) => editingController.city.value = value,
          onDistrictChanged: (value) =>
              editingController.district.value = value,
        ),
      ],
    );
  }
}

/// Labeled section header with icon used by place-action form blocks.
class PlaceActionSectionHeader extends StatelessWidget {
  const PlaceActionSectionHeader({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(
          icon,
          size: AppConstants.iconSizeSmall + 2,
          color: colorScheme.primary,
        ),
        const SizedBox(width: AppConstants.spacingS),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
            fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
          ),
        ),
      ],
    );
  }
}
