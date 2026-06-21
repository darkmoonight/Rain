import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/i18n/tr.dart';

/// Shared latitude, longitude, city, and district validators for place forms.
class PlaceFormValidators {
  PlaceFormValidators._();

  /// Validates that [value] is a latitude between -90 and 90.
  static String? latitude(String? value) {
    if (value == null || value.isEmpty) {
      return 'validateValue'.tr;
    }
    final numericValue = double.tryParse(value);
    if (numericValue == null) {
      return 'validateNumber'.tr;
    }
    if (numericValue < AppConstants.minLatitude ||
        numericValue > AppConstants.maxLatitude) {
      return 'validate90'.tr;
    }
    return null;
  }

  /// Validates that [value] is a longitude between -180 and 180.
  static String? longitude(String? value) {
    if (value == null || value.isEmpty) {
      return 'validateValue'.tr;
    }
    final numericValue = double.tryParse(value);
    if (numericValue == null) {
      return 'validateNumber'.tr;
    }
    if (numericValue < AppConstants.minLongitude ||
        numericValue > AppConstants.maxLongitude) {
      return 'validate180'.tr;
    }
    return null;
  }

  /// Validates that [value] is a non-empty city name.
  static String? city(String? value) {
    if (value == null || value.isEmpty) {
      return 'validateName'.tr;
    }
    return null;
  }

  /// Validates that [value] is a non-empty district or region name.
  static String? district(String? value) {
    if (value == null || value.isEmpty) {
      return 'validateName'.tr;
    }
    return null;
  }
}
