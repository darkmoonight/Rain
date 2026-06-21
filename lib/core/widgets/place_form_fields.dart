import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/utils/place_form_validators.dart';
import 'package:rain/core/widgets/text_form.dart';
import 'package:rain/i18n/tr.dart';

/// Trims [controller] and collapses repeated spaces (geolocation form helper).
void trimPlaceController(TextEditingController controller) {
  controller.text = controller.text.trim();
  while (controller.text.contains('  ')) {
    controller.text = controller.text.replaceAll('  ', ' ');
  }
}

/// Shared latitude, longitude, city, and district fields for place forms.
class PlaceFormFields extends StatelessWidget {
  const PlaceFormFields({
    super.key,
    required this.latitudeController,
    required this.longitudeController,
    required this.cityController,
    required this.districtController,
    this.elevation = AppConstants.mapTextFieldElevation,
    this.horizontalPadding = AppConstants.cardPaddingHorizontal,
    this.fieldMargin,
    this.fieldSpacing = 0,
    this.iconColor,
    this.includeCoordinates = true,
    this.includeLabels = true,
    this.onLatitudeChanged,
    this.onLongitudeChanged,
    this.onCityChanged,
    this.onDistrictChanged,
  });

  final TextEditingController latitudeController;
  final TextEditingController longitudeController;
  final TextEditingController cityController;
  final TextEditingController districtController;
  final double elevation;
  final double horizontalPadding;
  final EdgeInsets? fieldMargin;
  final double fieldSpacing;
  final Color? iconColor;
  final bool includeCoordinates;
  final bool includeLabels;
  final ValueChanged<String>? onLatitudeChanged;
  final ValueChanged<String>? onLongitudeChanged;
  final ValueChanged<String>? onCityChanged;
  final ValueChanged<String>? onDistrictChanged;

  EdgeInsets get _defaultFieldMargin => EdgeInsets.only(
    left: horizontalPadding,
    right: horizontalPadding,
    top: horizontalPadding,
  );

  EdgeInsets get _margin => fieldMargin ?? _defaultFieldMargin;

  Icon _icon(IconData data) => Icon(data, color: iconColor);

  Widget _spaced(Widget child, {required bool addSpacing}) {
    if (!addSpacing || fieldSpacing <= 0) return child;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        SizedBox(height: fieldSpacing),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final fields = <Widget>[];

    if (includeCoordinates) {
      fields.add(
        MyTextForm(
          elevation: elevation,
          controller: latitudeController,
          labelText: 'lat'.tr,
          type: const TextInputType.numberWithOptions(
            signed: true,
            decimal: true,
          ),
          icon: _icon(IconsaxPlusLinear.location),
          margin: _margin,
          onChanged: onLatitudeChanged,
          validator: PlaceFormValidators.latitude,
        ),
      );
      fields.add(
        MyTextForm(
          elevation: elevation,
          controller: longitudeController,
          labelText: 'lon'.tr,
          type: const TextInputType.numberWithOptions(
            signed: true,
            decimal: true,
          ),
          icon: _icon(IconsaxPlusLinear.location),
          margin: _margin,
          onChanged: onLongitudeChanged,
          validator: PlaceFormValidators.longitude,
        ),
      );
    }

    if (includeLabels) {
      fields.add(
        MyTextForm(
          elevation: elevation,
          controller: cityController,
          labelText: 'city'.tr,
          type: TextInputType.name,
          icon: _icon(IconsaxPlusLinear.building_3),
          margin: _margin,
          onChanged: onCityChanged,
          validator: PlaceFormValidators.city,
        ),
      );
      fields.add(
        MyTextForm(
          elevation: elevation,
          controller: districtController,
          labelText: 'district'.tr,
          type: TextInputType.streetAddress,
          icon: _icon(IconsaxPlusLinear.global),
          margin: _margin,
          onChanged: onDistrictChanged,
          validator: PlaceFormValidators.district,
        ),
      );
    }

    return Column(
      children: [
        for (var i = 0; i < fields.length; i++)
          _spaced(fields[i], addSpacing: i < fields.length - 1),
      ],
    );
  }
}
