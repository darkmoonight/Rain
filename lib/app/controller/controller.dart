import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isar/isar.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/main.dart';
import 'package:timezone/standalone.dart' as tz;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class LocationController extends GetxController {
  final isLoading = true.obs;
  final _district = ''.obs;
  final _city = ''.obs;
  final _latitude = 0.0.obs;
  final _longitude = 0.0.obs;

  String get district => _district.value;
  String get city => _city.value;
  double get latitude => _latitude.value;
  double get longitude => _longitude.value;

  final _hourly = HourlyCache().obs;
  final _daily = DailyCache().obs;
  final _location = LocationCache().obs;
  final _weatherCard = WeatherCard().obs;

  HourlyCache get hourly => _hourly.value;
  DailyCache get daily => _daily.value;
  LocationCache get location => _location.value;
  WeatherCard get weatherCard => _weatherCard.value;

  final hourOfDay = 0.obs;
  final ItemScrollController itemScrollController = ItemScrollController();
  final cacheExpiry = DateTime.now().subtract(const Duration(hours: 6));

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (await isDeviceConnectedNotifier.value && serviceEnabled) {
      Position position = await determinePosition();

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];

      _latitude.value = position.latitude;
      _longitude.value = position.longitude;
      _district.value = '${place.administrativeArea}';
      _city.value = '${place.locality}';

      _hourly.value =
          await WeatherAPI().getWeatherData(_latitude.value, _longitude.value);
      _daily.value =
          await WeatherAPI().getWeather7Data(_latitude.value, _longitude.value);

      writeCache();
      readCache();
    } else if (!await isDeviceConnectedNotifier.value && serviceEnabled) {
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
    } else if (!await isDeviceConnectedNotifier.value && !serviceEnabled) {
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
      readCache();
    }
  }

  Future<void> getLocation(latitude, longitude, district, locality) async {
    if (await isDeviceConnectedNotifier.value) {
      _latitude.value = latitude;
      _longitude.value = longitude;
      _district.value = '$district';
      _city.value = '$locality';

      _hourly.value =
          await WeatherAPI().getWeatherData(_latitude.value, _longitude.value);
      _daily.value =
          await WeatherAPI().getWeather7Data(_latitude.value, _longitude.value);

      writeCache();
      readCache();
    } else if (!await isDeviceConnectedNotifier.value) {
      Get.snackbar(
        'no_inter'.tr,
        'on_inter'.tr,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        icon: const Icon(Iconsax.wifi),
        shouldIconPulse: true,
      );
      readCache();
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

    hourOfDay.value = getTime(_hourly.value.time!, _hourly.value.timezone!);

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
      district: _district.value,
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
            .deleteAll();
        await isar.dailyCaches
            .filter()
            .timestampLessThan(cacheExpiry)
            .deleteAll();
      });
    }
  }

  Future<void> deleteAll() async {
    if (await isDeviceConnectedNotifier.value) {
      isar.writeTxn(() async {
        await isar.hourlyCaches.where().deleteAll();
        await isar.dailyCaches.where().deleteAll();
        await isar.locationCaches.where().deleteAll();
      });
    }
  }

  // Card Weather
  Stream<List<WeatherCard>> getWeatherCard() async* {
    yield* isar.weatherCards.where().watch(fireImmediately: true);
  }

  Future<void> addCardWeather(double latitude, double longitude, String city,
      String district, String timezone) async {
    if (await isDeviceConnectedNotifier.value) {
      _weatherCard.value = await WeatherAPI()
          .getWeatherCard(latitude, longitude, city, district, timezone);

      isar.writeTxn(() async {
        await isar.weatherCards.put(_weatherCard.value);
      });
    } else if (!await isDeviceConnectedNotifier.value) {
      Get.snackbar(
        'no_inter'.tr,
        'on_inter'.tr,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        icon: const Icon(Iconsax.wifi),
        shouldIconPulse: true,
      );
    }
  }

  Future<void> updateCacheCard(bool refresh) async {
    List<WeatherCard> weatherCard = refresh
        ? await isar.weatherCards.where().findAll()
        : await isar.weatherCards
            .filter()
            .timestampLessThan(cacheExpiry)
            .findAll();

    if (await isDeviceConnectedNotifier.value && weatherCard.isNotEmpty) {
      isar.writeTxn(() async {
        for (var element in weatherCard) {
          _weatherCard.value = await WeatherAPI().getWeatherCard(element.lat,
              element.lon, element.city!, element.district!, element.timezone!);
          element.time = _weatherCard.value.time;
          element.temperature2M = _weatherCard.value.temperature2M;
          element.weathercode = _weatherCard.value.weathercode;
          element.timestamp = DateTime.now();
          await isar.weatherCards.put(element);
        }
      });
    }
  }

  Future<void> deleteCardWeather(WeatherCard weatherCard) async {
    await isar.writeTxn(() async {
      await isar.weatherCards.delete(weatherCard.id);
    });
  }

  int getTime(List<String> time, String timezone) {
    int getTime = 0;
    for (var i = 0; i < time.length; i++) {
      if (tz.TZDateTime.now(tz.getLocation(timezone)).hour ==
              DateTime.parse(time[i]).hour &&
          tz.TZDateTime.now(tz.getLocation(timezone)).day ==
              DateTime.parse(time[i]).day) {
        getTime = i;
      }
    }
    return getTime;
  }
}
