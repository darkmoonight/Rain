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
  final _administrativeArea = ''.obs;
  final _city = ''.obs;
  final _latitude = 0.0.obs;
  final _longitude = 0.0.obs;

  String get administrativeArea => _administrativeArea.value;
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

  DateTime alignDateTime(DateTime dt, Duration alignment,
      [bool roundUp = false]) {
    assert(alignment >= Duration.zero);
    if (alignment == Duration.zero) return dt;
    final correction = Duration(
        days: 0,
        hours: alignment.inDays > 0
            ? dt.hour
            : alignment.inHours > 0
                ? dt.hour % alignment.inHours
                : 0,
        minutes: alignment.inHours > 0
            ? dt.minute
            : alignment.inMinutes > 0
                ? dt.minute % alignment.inMinutes
                : 0,
        seconds: alignment.inMinutes > 0
            ? dt.second
            : alignment.inSeconds > 0
                ? dt.second % alignment.inSeconds
                : 0,
        milliseconds: alignment.inSeconds > 0
            ? dt.millisecond
            : alignment.inMilliseconds > 0
                ? dt.millisecond % alignment.inMilliseconds
                : 0,
        microseconds: alignment.inMilliseconds > 0 ? dt.microsecond : 0);
    if (correction == Duration.zero) return dt;
    final corrected = dt.subtract(correction);
    final result = roundUp ? corrected.add(alignment) : corrected;
    return result;
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (await isDeviceConnectedNotifier.value && serviceEnabled) {
      Position position = await determinePosition();

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];

      _latitude.value = position.latitude;
      _longitude.value = position.longitude;
      _administrativeArea.value = '${place.administrativeArea}';
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

  Future<void> getLocation(
      latitude, longitude, administrativeArea, locality) async {
    if (await isDeviceConnectedNotifier.value) {
      _latitude.value = latitude;
      _longitude.value = longitude;
      _administrativeArea.value = '$administrativeArea';
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
    for (var i = 0; i < _hourly.value.time!.length; i++) {
      if (alignDateTime(DateTime.now(), const Duration(hours: 1), false)
          .isAtSameMomentAs(DateTime.parse(_hourly.value.time![i]))) {
        hourOfDay.value = i;
      }
    }
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
      administrativeArea: _administrativeArea.value,
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
        if (location.lat != _latitude.value &&
            location.lon != _longitude.value) {
          await isar.locationCaches.where().deleteAll();
        }
      });
    }
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

  Stream<List<WeatherCard>> getWeatherCard() async* {
    yield* isar.weatherCards.where().watch(fireImmediately: true);
  }

  Future<void> deleteCardWeather(WeatherCard weatherCard) async {
    await isar.writeTxn(() async {
      await isar.weatherCards.delete(weatherCard.id);
    });
  }
}
