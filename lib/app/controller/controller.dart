import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isar/isar.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/main.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class LocationController extends GetxController {
  final isLoading = true.obs;
  final _country = ''.obs;
  final _city = ''.obs;
  final _latitude = 0.0.obs;
  final _longitude = 0.0.obs;

  String get country => _country.value;
  String get city => _city.value;
  double get latitude => _latitude.value;
  double get longitude => _longitude.value;

  final _hourly = HourlyCache().obs;
  final _daily = DailyCache().obs;
  final _location = LocationCache().obs;

  HourlyCache get hourly => _hourly.value;
  DailyCache get daily => _daily.value;
  LocationCache get location => _location.value;

  final hourOfDay = DateTime.now().hour.obs;
  final ItemScrollController itemScrollController = ItemScrollController();
  final cacheExpiry = DateTime.now().subtract(const Duration(hours: 12));

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (await isDeviceConnectedNotifier.value && serviceEnabled) {
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

      writeCache();
      readCache();
    } else if (await isDeviceConnectedNotifier.value == false &&
        serviceEnabled) {
      Get.snackbar(
        'no_inter'.tr,
        'on_inter'.tr,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        icon: const Icon(Iconsax.wifi),
        shouldIconPulse: true,
      );
      readCache();
    } else if (await isDeviceConnectedNotifier.value && !serviceEnabled) {
      Get.snackbar(
        'location'.tr,
        'no_location'.tr,
        mainButton: TextButton(
          onPressed: () => Geolocator.openLocationSettings(),
          child: Text(
            'settings'.tr,
          ),
        ),
        icon: const Icon(Iconsax.location_slash),
        shouldIconPulse: true,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      );
      readCache();
    } else if (await isDeviceConnectedNotifier.value == false &&
        !serviceEnabled) {
      Get.snackbar(
        'no_inter'.tr,
        'on_inter'.tr,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        icon: const Icon(Iconsax.wifi),
        shouldIconPulse: true,
      );
      Get.snackbar(
        'location'.tr,
        'no_location'.tr,
        mainButton: TextButton(
          onPressed: () => Geolocator.openLocationSettings(),
          child: Text(
            'settings'.tr,
          ),
        ),
        icon: const Icon(Iconsax.location_slash),
        shouldIconPulse: true,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      );
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

  void readCache() async {
    HourlyCache? hourlyCache;
    DailyCache? dailyCache;
    LocationCache? locationCache;

    while (hourlyCache == null || dailyCache == null || locationCache == null) {
      hourlyCache = await isar.hourlyCaches.where().findFirst();
      dailyCache = await isar.dailyCaches.where().findFirst();
      locationCache = await isar.locationCaches.where().findFirst();
    }

    _hourly.value = hourlyCache;
    _daily.value = dailyCache;
    _location.value = locationCache;
    isLoading.value = false;
    Future.delayed(const Duration(milliseconds: 30), () async {
      itemScrollController.scrollTo(
        index: hourOfDay.value,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  void writeCache() async {
    final locationCaches = LocationCache(
      lat: _latitude.value,
      lon: _longitude.value,
      city: _city.value,
      country: _country.value,
      timestamp: DateTime.now(),
    );

    isar.writeTxn(() async {
      if ((await isar.hourlyCaches.where().findAll()).isEmpty) {
        await isar.hourlyCaches.put(_hourly.value);
      }

      if ((await isar.dailyCaches.where().findAll()).isEmpty) {
        await isar.dailyCaches.put(_daily.value);
      }

      if ((await isar.locationCaches.where().findAll()).isEmpty) {
        await isar.locationCaches.put(locationCaches);
      }
    });
  }

  void deleteCache() async {
    if (await isDeviceConnectedNotifier.value) {
      isar.writeTxn(() async {
        await isar.hourlyCaches
            .filter()
            .timestampLessThan(cacheExpiry)
            .deleteFirst();
        await isar.dailyCaches
            .filter()
            .timestampLessThan(cacheExpiry)
            .deleteFirst();
        await isar.locationCaches
            .filter()
            .timestampLessThan(cacheExpiry)
            .deleteFirst();
      });
    }
  }
}
