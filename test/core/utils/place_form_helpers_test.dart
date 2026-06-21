import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/place_form_helpers.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';

void main() {
  group('fillPlaceControllers', () {
    test('fills latitude, longitude, city, district, and clears search', () {
      const selection = CitySearchResult(
        name: 'Paris',
        admin1: 'Île-de-France',
        latitude: 48.85,
        longitude: 2.35,
      );

      final latitude = TextEditingController();
      final longitude = TextEditingController();
      final city = TextEditingController();
      final district = TextEditingController();
      final search = TextEditingController(text: 'Par');
      final focusNode = FocusNode();

      addTearDown(latitude.dispose);
      addTearDown(longitude.dispose);
      addTearDown(city.dispose);
      addTearDown(district.dispose);
      addTearDown(search.dispose);
      addTearDown(focusNode.dispose);

      fillPlaceControllers(
        selection: selection,
        latitude: latitude,
        longitude: longitude,
        city: city,
        district: district,
        search: search,
        focusNode: focusNode,
      );

      expect(latitude.text, '48.85');
      expect(longitude.text, '2.35');
      expect(city.text, 'Paris');
      expect(district.text, 'Île-de-France');
      expect(search.text, isEmpty);
      expect(focusNode.hasFocus, isFalse);
    });
  });
}
