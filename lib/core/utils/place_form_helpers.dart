import 'package:flutter/material.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';

/// Fills place form controllers from a [CitySearchResult] selection.
void fillPlaceControllers({
  required CitySearchResult selection,
  required TextEditingController latitude,
  required TextEditingController longitude,
  required TextEditingController city,
  required TextEditingController district,
  TextEditingController? search,
  FocusNode? focusNode,
}) {
  latitude.text = '${selection.latitude}';
  longitude.text = '${selection.longitude}';
  city.text = selection.name ?? '';
  district.text = selection.admin1 ?? '';
  search?.clear();
  focusNode?.unfocus();
}
