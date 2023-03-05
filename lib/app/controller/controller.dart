import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isar/isar.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/api/daily.dart';
import 'package:rain/app/api/hourly.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/main.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class LocationController extends GetxController {
  final isLoading = true.obs;
  final _country = ''.obs;
  final _city = ''.obs;
  final _latitude = 0.0.obs;
  final _longitude = 0.0.obs;

  final _hourly = Hourly().obs;
  final _daily = Daily().obs;

  final _hourlyCache = HourlyCache().obs;
  final _dailyCache = DailyCache().obs;
  final _locationCache = LocationCache().obs;

  String get country => _country.value;
  String get city => _city.value;
  double get latitude => _latitude.value;
  double get longitude => _longitude.value;

  Hourly get hourly => _hourly.value;
  Daily get daily => _daily.value;

  HourlyCache get hourlyCache => _hourlyCache.value;
  DailyCache get dailyCache => _dailyCache.value;
  LocationCache get locationCache => _locationCache.value;

  final hourOfDay = DateTime.now().hour.obs;
  final ItemScrollController itemScrollController = ItemScrollController();

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

      writeCache();

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

  void readCache() async {
    _hourlyCache.value = (await isar.hourlyCaches.where().findFirst())!;
    _dailyCache.value = (await isar.dailyCaches.where().findFirst())!;
  }

  void writeCache() async {
    int cacheDuration = 24;
    final now = DateTime.now();
    final cacheExpiry = now.subtract(Duration(hours: cacheDuration));

    final weatherHourly = HourlyCache(
      time: _hourly.value.time!,
      temperature2M: _hourly.value.temperature2M!,
      relativehumidity2M: _hourly.value.relativehumidity2M!,
      apparentTemperature: _hourly.value.apparentTemperature!,
      precipitation: _hourly.value.precipitation!,
      rain: _hourly.value.rain!,
      weathercode: _hourly.value.weathercode!,
      surfacePressure: _hourly.value.surfacePressure!,
      visibility: _hourly.value.visibility!,
      evapotranspiration: _hourly.value.evapotranspiration!,
      windspeed10M: _hourly.value.windspeed10M!,
      winddirection10M: _hourly.value.winddirection10M!,
      timestamp: DateTime.now(),
    );

    final weatherDaily = DailyCache(
      time: _daily.value.time!,
      weathercode: _daily.value.weathercode!,
      temperature2MMax: _daily.value.temperature2MMax!,
      temperature2MMin: _daily.value.temperature2MMin!,
      timestamp: DateTime.now(),
    );

    final locationCaches = LocationCache(
      lat: _latitude.value,
      lon: _longitude.value,
      city: _city.value,
      country: _country.value,
      timestamp: DateTime.now(),
    );

    isar.writeTxn(() async {
      if ((await isar.hourlyCaches.where().findAll()).isEmpty) {
        await isar.hourlyCaches.put(weatherHourly);
      } else {
        await isar.hourlyCaches
            .filter()
            .timestampLessThan(cacheExpiry)
            .deleteFirst();
        if ((await isar.hourlyCaches.where().findAll()).isEmpty) {
          await isar.hourlyCaches.put(weatherHourly);
        }
      }

      if ((await isar.dailyCaches.where().findAll()).isEmpty) {
        await isar.dailyCaches.put(weatherDaily);
      } else {
        await isar.dailyCaches
            .filter()
            .timestampLessThan(cacheExpiry)
            .deleteFirst();
        if ((await isar.dailyCaches.where().findAll()).isEmpty) {
          await isar.dailyCaches.put(weatherDaily);
        }
      }

      if ((await isar.locationCaches.where().findAll()).isEmpty) {
        await isar.locationCaches.put(locationCaches);
      } else {
        await isar.locationCaches
            .filter()
            .timestampLessThan(cacheExpiry)
            .deleteFirst();
        if ((await isar.locationCaches.where().findAll()).isEmpty) {
          await isar.locationCaches.put(locationCaches);
        }
      }
    });
  }
}
