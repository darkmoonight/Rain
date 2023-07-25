import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isar/isar.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/services/notification.dart';
import 'package:rain/app/widgets/status_weather.dart';
import 'package:rain/app/widgets/status_data.dart';
import 'package:rain/main.dart';
import 'package:timezone/standalone.dart' as tz;
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class LocationController extends GetxController {
  final isLoading = true.obs;
  final isSearch = true.obs;
  final _district = ''.obs;
  final _city = ''.obs;
  final _latitude = 0.0.obs;
  final _longitude = 0.0.obs;

  String get district => _district.value;
  String get city => _city.value;
  double get latitude => _latitude.value;
  double get longitude => _longitude.value;

  final _mainWeather = MainWeatherCache().obs;
  final _location = LocationCache().obs;
  final _weatherCard = WeatherCard().obs;

  final weatherCards = <WeatherCard>[].obs;

  MainWeatherCache get mainWeather => _mainWeather.value;
  LocationCache get location => _location.value;
  WeatherCard get weatherCard => _weatherCard.value;

  final hourOfDay = 0.obs;
  final dayOfNow = 0.obs;
  final ItemScrollController itemScrollController = ItemScrollController();
  final cacheExpiry = DateTime.now().subtract(const Duration(hours: 6));

  @override
  void onInit() {
    weatherCards.value = isar.weatherCards.where().sortByIndex().findAllSync();
    super.onInit();
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

  Future<void> setLocation() async {
    if (settings.location) {
      await getCurrentLocation();
    } else {
      if ((await isar.locationCaches.where().findAll()).isNotEmpty) {
        LocationCache locationCity =
            (await isar.locationCaches.where().findFirst())!;
        isSearch.value = false;
        await getLocation(locationCity.lat!, locationCity.lon!,
            locationCity.district!, locationCity.city!);
      }
    }
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
      _district.value = '${place.administrativeArea}';
      _city.value = '${place.locality}';

      _mainWeather.value =
          await WeatherAPI().getWeatherData(_latitude.value, _longitude.value);

      await writeCache();
      await readCache();
    } else if (!await isDeviceConnectedNotifier.value && serviceEnabled) {
      Get.snackbar(
        'no_inter'.tr,
        'on_inter'.tr,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        icon: const Icon(Iconsax.wifi),
        shouldIconPulse: true,
      );
      await readCache();
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
      await readCache();
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
      await readCache();
    }
  }

  Future<void> getLocation(double latitude, double longitude, String district,
      String locality) async {
    if (await isDeviceConnectedNotifier.value) {
      _latitude.value = latitude;
      _longitude.value = longitude;
      _district.value = district;
      _city.value = locality;

      _mainWeather.value =
          await WeatherAPI().getWeatherData(_latitude.value, _longitude.value);

      if (settings.notifications) {
        final List<PendingNotificationRequest> pendingNotificationRequests =
            await flutterLocalNotificationsPlugin.pendingNotificationRequests();
        if (pendingNotificationRequests.isEmpty) {
          notlification(_mainWeather.value);
        }
      }

      await writeCache();
      await readCache();
    } else {
      Get.snackbar(
        'no_inter'.tr,
        'on_inter'.tr,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        icon: const Icon(Iconsax.wifi),
        shouldIconPulse: true,
      );
      await readCache();
    }
  }

  Future<void> readCache() async {
    MainWeatherCache? mainWeatherCache;
    LocationCache? locationCache;

    while (mainWeatherCache == null || locationCache == null) {
      mainWeatherCache = await isar.mainWeatherCaches.where().findFirst();
      locationCache = await isar.locationCaches.where().findFirst();
    }

    _mainWeather.value = mainWeatherCache;
    _location.value = locationCache;

    hourOfDay.value =
        getTime(_mainWeather.value.time!, _mainWeather.value.timezone!);
    dayOfNow.value =
        getDay(_mainWeather.value.timeDaily!, _mainWeather.value.timezone!);

    isLoading.value = false;
    Future.delayed(const Duration(milliseconds: 30), () async {
      itemScrollController.scrollTo(
        index: hourOfDay.value,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  Future<void> writeCache() async {
    final locationCaches = LocationCache(
      lat: _latitude.value,
      lon: _longitude.value,
      city: _city.value,
      district: _district.value,
    );

    isar.writeTxn(() async {
      if ((await isar.mainWeatherCaches.where().findAll()).isEmpty) {
        await isar.mainWeatherCaches.put(_mainWeather.value);
      }

      if ((await isar.locationCaches.where().findAll()).isEmpty) {
        await isar.locationCaches.put(locationCaches);
      }
    });
  }

  Future<void> deleteCache() async {
    if (await isDeviceConnectedNotifier.value) {
      isar.writeTxn(() async {
        await isar.mainWeatherCaches
            .filter()
            .timestampLessThan(cacheExpiry)
            .deleteAll();
        if ((await isar.mainWeatherCaches.where().findAll()).isEmpty) {
          await flutterLocalNotificationsPlugin.cancelAll();
        }
      });
    }
  }

  Future<void> deleteAll(bool changeCity) async {
    if (await isDeviceConnectedNotifier.value) {
      isar.writeTxn(() async {
        await isar.mainWeatherCaches.where().deleteAll();
        if (settings.location || changeCity) {
          await isar.locationCaches.where().deleteAll();
        }
      });
    }
  }

  // Card Weather
  Future<void> addCardWeather(
      double latitude, double longitude, String city, String district) async {
    if (await isDeviceConnectedNotifier.value) {
      String tz = tzmap.latLngToTimezoneString(latitude, longitude);
      _weatherCard.value = await WeatherAPI()
          .getWeatherCard(latitude, longitude, city, district, tz);
      isar.writeTxn(() async {
        weatherCards.add(_weatherCard.value);
        await isar.weatherCards.put(_weatherCard.value);
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
  }

  Future<void> updateCacheCard(bool refresh) async {
    List<WeatherCard> weatherCard = refresh
        ? await isar.weatherCards.where().sortByIndex().findAll()
        : await isar.weatherCards
            .filter()
            .timestampLessThan(cacheExpiry)
            .sortByIndex()
            .findAll();

    if (await isDeviceConnectedNotifier.value && weatherCard.isNotEmpty) {
      isar.writeTxn(() async {
        for (var element in weatherCard) {
          _weatherCard.value = await WeatherAPI().getWeatherCard(element.lat,
              element.lon, element.city!, element.district!, element.timezone!);
          element.time = _weatherCard.value.time;
          element.temperature2M = _weatherCard.value.temperature2M;
          element.relativehumidity2M = _weatherCard.value.relativehumidity2M;
          element.apparentTemperature = _weatherCard.value.apparentTemperature;
          element.precipitation = _weatherCard.value.precipitation;
          element.rain = _weatherCard.value.rain;
          element.weathercode = _weatherCard.value.weathercode;
          element.surfacePressure = _weatherCard.value.surfacePressure;
          element.visibility = _weatherCard.value.visibility;
          element.evapotranspiration = _weatherCard.value.evapotranspiration;
          element.windspeed10M = _weatherCard.value.windspeed10M;
          element.winddirection10M = _weatherCard.value.winddirection10M;
          element.windgusts10M = _weatherCard.value.windgusts10M;
          element.timeDaily = _weatherCard.value.timeDaily;
          element.weathercodeDaily = _weatherCard.value.weathercodeDaily;
          element.temperature2MMax = _weatherCard.value.temperature2MMax;
          element.temperature2MMin = _weatherCard.value.temperature2MMin;
          element.apparentTemperatureMax =
              _weatherCard.value.apparentTemperatureMax;
          element.apparentTemperatureMin =
              _weatherCard.value.apparentTemperatureMin;
          element.sunrise = _weatherCard.value.sunrise;
          element.sunset = _weatherCard.value.sunset;
          element.precipitationSum = _weatherCard.value.precipitationSum;
          element.precipitationProbabilityMax =
              _weatherCard.value.precipitationProbabilityMax;
          element.windspeed10MMax = _weatherCard.value.windspeed10MMax;
          element.windgusts10MMax = _weatherCard.value.windgusts10MMax;
          element.uvIndexMax = _weatherCard.value.uvIndexMax;
          element.rainSum = _weatherCard.value.rainSum;
          element.winddirection10MDominant =
              _weatherCard.value.winddirection10MDominant;
          element.timestamp = DateTime.now();
          await isar.weatherCards.put(element);

          var newCard = element;
          int oldIdx = weatherCard.indexOf(element);
          weatherCards[oldIdx] = newCard;
          weatherCards.refresh();
        }
      });
    }
  }

  Future<void> updateCard(WeatherCard weatherCard) async {
    if (await isDeviceConnectedNotifier.value) {
      isar.writeTxn(() async {
        _weatherCard.value = await WeatherAPI().getWeatherCard(
          weatherCard.lat,
          weatherCard.lon,
          weatherCard.city!,
          weatherCard.district!,
          weatherCard.timezone!,
        );
        weatherCard.time = _weatherCard.value.time;
        weatherCard.temperature2M = _weatherCard.value.temperature2M;
        weatherCard.relativehumidity2M = _weatherCard.value.relativehumidity2M;
        weatherCard.apparentTemperature =
            _weatherCard.value.apparentTemperature;
        weatherCard.precipitation = _weatherCard.value.precipitation;
        weatherCard.rain = _weatherCard.value.rain;
        weatherCard.weathercode = _weatherCard.value.weathercode;
        weatherCard.surfacePressure = _weatherCard.value.surfacePressure;
        weatherCard.visibility = _weatherCard.value.visibility;
        weatherCard.evapotranspiration = _weatherCard.value.evapotranspiration;
        weatherCard.windspeed10M = _weatherCard.value.windspeed10M;
        weatherCard.winddirection10M = _weatherCard.value.winddirection10M;
        weatherCard.windgusts10M = _weatherCard.value.windgusts10M;
        weatherCard.timeDaily = _weatherCard.value.timeDaily;
        weatherCard.weathercodeDaily = _weatherCard.value.weathercodeDaily;
        weatherCard.temperature2MMax = _weatherCard.value.temperature2MMax;
        weatherCard.temperature2MMin = _weatherCard.value.temperature2MMin;
        weatherCard.apparentTemperatureMax =
            _weatherCard.value.apparentTemperatureMax;
        weatherCard.apparentTemperatureMin =
            _weatherCard.value.apparentTemperatureMin;
        weatherCard.sunrise = _weatherCard.value.sunrise;
        weatherCard.sunset = _weatherCard.value.sunset;
        weatherCard.precipitationSum = _weatherCard.value.precipitationSum;
        weatherCard.precipitationProbabilityMax =
            _weatherCard.value.precipitationProbabilityMax;
        weatherCard.windspeed10MMax = _weatherCard.value.windspeed10MMax;
        weatherCard.windgusts10MMax = _weatherCard.value.windgusts10MMax;
        weatherCard.uvIndexMax = _weatherCard.value.uvIndexMax;
        weatherCard.rainSum = _weatherCard.value.rainSum;
        weatherCard.winddirection10MDominant =
            _weatherCard.value.winddirection10MDominant;
        weatherCard.timestamp = DateTime.now();
        await isar.weatherCards.put(weatherCard);
      });
    }
  }

  Future<void> deleteCardWeather(WeatherCard weatherCard) async {
    await isar.writeTxn(() async {
      weatherCards.remove(weatherCard);
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

  int getDay(List<DateTime> time, String timezone) {
    int getDay = 0;
    for (var i = 0; i < time.length; i++) {
      if (tz.TZDateTime.now(tz.getLocation(timezone)).day == time[i].day) {
        getDay = i;
      }
    }
    return getDay;
  }

  void notlification(MainWeatherCache mainWeatherCache) {
    final weatherNotlification = mainWeatherCache.time
        ?.where((element) => DateTime.parse(element).isAfter(DateTime.now()))
        .toList();
    for (var i = 0; i < weatherNotlification!.length; i += timeRange) {
      if (DateTime.parse(mainWeatherCache.time![i]).isAfter(DateTime.now())) {
        NotificationShow().showNotification(
          UniqueKey().hashCode,
          '$city: ${mainWeatherCache.temperature2M![i]}°',
          '${StatusWeather().getText(mainWeatherCache.weathercode![i])} · ${StatusData().getTimeFormat(mainWeatherCache.time![i])}',
          DateTime.parse(mainWeatherCache.time![i]),
        );
      }
    }
  }
}
