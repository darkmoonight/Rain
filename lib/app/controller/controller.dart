import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/api/weather_7days.dart';
import 'package:rain/app/api/weather_day.dart';
import 'package:rain/main.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class LocationController extends GetxController {
  final isLoading = true.obs;
  final _country = ''.obs;
  final _city = ''.obs;
  final _latitude = 0.0.obs;
  final _longitude = 0.0.obs;

  final hourOfDay = DateTime.now().hour.obs;
  final ItemScrollController itemScrollController = ItemScrollController();

  final _hourly = Hourly().obs;
  final _daily = Daily().obs;

  String get country => _country.value;
  String get city => _city.value;
  double get latitude => _latitude.value;
  double get longitude => _longitude.value;
  Hourly get hourly => _hourly.value;
  Daily get daily => _daily.value;

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (await isDeviceConnectedNotifier.value) {
      Position position = await determinePosition();

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];

      _latitude.value = position.latitude;
      _longitude.value = position.longitude;
      _country.value = '${place.country}';
      _city.value = '${place.locality}';

      _hourly.value =
          await WeatherAPI().getWeatherData(_latitude.value, _longitude.value);
      _daily.value =
          await WeatherAPI().getWeather7Data(_latitude.value, _longitude.value);

      isLoading.value = false;

      Future.delayed(const Duration(milliseconds: 30), () async {
        itemScrollController.scrollTo(
          index: hourOfDay.value,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutCubic,
        );
      });
    } else {
      Get.snackbar(
        'no_inter'.tr,
        'on_inter'.tr,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        icon: const Icon(Iconsax.wifi),
        shouldIconPulse: true,
      );
    }
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
  }

  Future<Position> determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
