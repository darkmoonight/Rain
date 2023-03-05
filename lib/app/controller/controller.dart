import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isar/isar.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/api/weather_7days.dart';
import 'package:rain/app/api/weather_day.dart';
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

  final _hourlyCache = WeatherDayCache().obs;
  final _dailyCache = Weather7DayCache().obs;
  final _locationCache = LocationCache().obs;

  String get country => _country.value;
  String get city => _city.value;
  double get latitude => _latitude.value;
  double get longitude => _longitude.value;

  Hourly get hourly => _hourly.value;
  Daily get daily => _daily.value;

  WeatherDayCache get hourlyCache => _hourlyCache.value;
  Weather7DayCache get dailyCache => _dailyCache.value;
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

      final weatherDayCaches = WeatherDayCache(
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

      final weather7DayCaches = Weather7DayCache(
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

      writeCache(weatherDayCaches, weather7DayCaches, locationCaches);

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

  void writeCache(WeatherDayCache weatherDayCaches,
      Weather7DayCache weather7DayCaches, LocationCache locationCaches) async {
    int cacheDuration = 24;
    final now = DateTime.now();
    final cacheExpiry = now.subtract(Duration(hours: cacheDuration));

    isar.writeTxn(() async {
      if ((await isar.weatherDayCaches.where().findAll()).isEmpty) {
        await isar.weatherDayCaches.put(weatherDayCaches);
      } else {
        await isar.weatherDayCaches
            .filter()
            .timestampLessThan(cacheExpiry)
            .deleteFirst();
        if ((await isar.weatherDayCaches.where().findAll()).isEmpty) {
          await isar.weatherDayCaches.put(weatherDayCaches);
        }
      }

      if ((await isar.weather7DayCaches.where().findAll()).isEmpty) {
        await isar.weather7DayCaches.put(weather7DayCaches);
      } else {
        await isar.weather7DayCaches
            .filter()
            .timestampLessThan(cacheExpiry)
            .deleteFirst();
        if ((await isar.weather7DayCaches.where().findAll()).isEmpty) {
          await isar.weather7DayCaches.put(weather7DayCaches);
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
