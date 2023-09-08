import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/services/notification.dart';
import 'package:rain/app/services/utils.dart';
import 'package:rain/app/widgets/status/status_weather.dart';
import 'package:rain/app/widgets/status/status_data.dart';
import 'package:rain/main.dart';
import 'package:timezone/standalone.dart' as tz;
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class WeatherController extends GetxController {
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
  final itemScrollController = ItemScrollController();
  final cacheExpiry = DateTime.now().subtract(const Duration(hours: 6));

  @override
  void onInit() {
    weatherCards
        .assignAll(isar.weatherCards.where().sortByIndex().findAllSync());
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

    if (isOnline && serviceEnabled) {
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
    } else if (!isOnline && serviceEnabled) {
      showSnackBar(content: 'no_inter'.tr);
      await readCache();
    } else if (isOnline && !serviceEnabled) {
      showSnackBar(
          content: 'no_location'.tr,
          onPressed: () => Geolocator.openLocationSettings());
      await readCache();
    } else if (!isOnline && !serviceEnabled) {
      showSnackBar(content: 'no_inter'.tr);
      showSnackBar(
          content: 'no_location'.tr,
          onPressed: () => Geolocator.openLocationSettings());
      await readCache();
    }
  }

  Future<void> getLocation(double latitude, double longitude, String district,
      String locality) async {
    if (isOnline) {
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
      showSnackBar(content: 'no_inter'.tr);
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
    if (isOnline) {
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
    if (isOnline) {
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
    if (isOnline) {
      String tz = tzmap.latLngToTimezoneString(latitude, longitude);
      _weatherCard.value = await WeatherAPI()
          .getWeatherCard(latitude, longitude, city, district, tz);
      isar.writeTxn(() async {
        weatherCards.add(_weatherCard.value);
        await isar.weatherCards.put(_weatherCard.value);
      });
    } else {
      showSnackBar(content: 'no_inter'.tr);
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

    if (isOnline && weatherCard.isNotEmpty) {
      isar.writeTxn(() async {
        for (var oldCard in weatherCard) {
          var updatedCard = await WeatherAPI().getWeatherCard(oldCard.lat,
              oldCard.lon, oldCard.city!, oldCard.district!, oldCard.timezone!);
          oldCard
            ..time = updatedCard.time
            ..temperature2M = updatedCard.temperature2M
            ..relativehumidity2M = updatedCard.relativehumidity2M
            ..apparentTemperature = updatedCard.apparentTemperature
            ..precipitation = updatedCard.precipitation
            ..rain = updatedCard.rain
            ..weathercode = updatedCard.weathercode
            ..surfacePressure = updatedCard.surfacePressure
            ..visibility = updatedCard.visibility
            ..evapotranspiration = updatedCard.evapotranspiration
            ..windspeed10M = updatedCard.windspeed10M
            ..winddirection10M = updatedCard.winddirection10M
            ..windgusts10M = updatedCard.windgusts10M
            ..timeDaily = updatedCard.timeDaily
            ..weathercodeDaily = updatedCard.weathercodeDaily
            ..temperature2MMax = updatedCard.temperature2MMax
            ..temperature2MMin = updatedCard.temperature2MMin
            ..apparentTemperatureMax = updatedCard.apparentTemperatureMax
            ..apparentTemperatureMin = updatedCard.apparentTemperatureMin
            ..sunrise = updatedCard.sunrise
            ..sunset = updatedCard.sunset
            ..precipitationSum = updatedCard.precipitationSum
            ..precipitationProbabilityMax =
                updatedCard.precipitationProbabilityMax
            ..windspeed10MMax = updatedCard.windspeed10MMax
            ..windgusts10MMax = updatedCard.windgusts10MMax
            ..uvIndexMax = updatedCard.uvIndexMax
            ..rainSum = updatedCard.rainSum
            ..winddirection10MDominant = updatedCard.winddirection10MDominant
            ..timestamp = DateTime.now();

          await isar.weatherCards.put(oldCard);

          var newCard = oldCard;
          int oldIdx = weatherCard.indexOf(oldCard);
          weatherCards[oldIdx] = newCard;
          weatherCards.refresh();
        }
      });
    }
  }

  Future<void> updateCard(WeatherCard weatherCard) async {
    if (isOnline) {
      final updatedCard = await WeatherAPI().getWeatherCard(
        weatherCard.lat,
        weatherCard.lon,
        weatherCard.city!,
        weatherCard.district!,
        weatherCard.timezone!,
      );

      isar.writeTxn(() async {
        weatherCard
          ..time = updatedCard.time
          ..temperature2M = updatedCard.temperature2M
          ..relativehumidity2M = updatedCard.relativehumidity2M
          ..apparentTemperature = updatedCard.apparentTemperature
          ..precipitation = updatedCard.precipitation
          ..rain = updatedCard.rain
          ..weathercode = updatedCard.weathercode
          ..surfacePressure = updatedCard.surfacePressure
          ..visibility = updatedCard.visibility
          ..evapotranspiration = updatedCard.evapotranspiration
          ..windspeed10M = updatedCard.windspeed10M
          ..winddirection10M = updatedCard.winddirection10M
          ..windgusts10M = updatedCard.windgusts10M
          ..timeDaily = updatedCard.timeDaily
          ..weathercodeDaily = updatedCard.weathercodeDaily
          ..temperature2MMax = updatedCard.temperature2MMax
          ..temperature2MMin = updatedCard.temperature2MMin
          ..apparentTemperatureMax = updatedCard.apparentTemperatureMax
          ..apparentTemperatureMin = updatedCard.apparentTemperatureMin
          ..sunrise = updatedCard.sunrise
          ..sunset = updatedCard.sunset
          ..precipitationSum = updatedCard.precipitationSum
          ..precipitationProbabilityMax =
              updatedCard.precipitationProbabilityMax
          ..windspeed10MMax = updatedCard.windspeed10MMax
          ..windgusts10MMax = updatedCard.windgusts10MMax
          ..uvIndexMax = updatedCard.uvIndexMax
          ..rainSum = updatedCard.rainSum
          ..winddirection10MDominant = updatedCard.winddirection10MDominant
          ..timestamp = DateTime.now();

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

  TimeOfDay timeConvert(String normTime) {
    int hh = 0;
    if (normTime.endsWith('PM')) hh = 12;
    normTime = normTime.split(' ')[0];
    return TimeOfDay(
      hour: hh + int.parse(normTime.split(":")[0]) % 24,
      minute: int.parse(normTime.split(":")[1]) % 60,
    );
  }

  Future<String> getLocalImagePath(String icon) async {
    final directory = await getTemporaryDirectory();
    final imagePath = '${directory.path}/$icon';

    final ByteData data = await rootBundle.load('assets/images/$icon');
    final List<int> bytes = data.buffer.asUint8List();

    await File(imagePath).writeAsBytes(bytes);

    return imagePath;
  }

  void notlification(MainWeatherCache mainWeatherCache) async {
    DateTime now = DateTime.now();
    int startHour = timeConvert(timeStart).hour;
    int endHour = timeConvert(timeEnd).hour;

    for (var i = 0; i < mainWeatherCache.time!.length; i += timeRange) {
      DateTime notificationTime = DateTime.parse(mainWeatherCache.time![i]);

      if (notificationTime.isAfter(now) &&
          notificationTime.hour >= startHour &&
          notificationTime.hour <= endHour) {
        for (var j = 0; j < mainWeatherCache.timeDaily!.length; j++) {
          if (mainWeatherCache.timeDaily![j].day == notificationTime.day) {
            NotificationShow().showNotification(
              UniqueKey().hashCode,
              '$city: ${mainWeatherCache.temperature2M![i]}°',
              '${StatusWeather().getText(mainWeatherCache.weathercode![i])} · ${StatusData().getTimeFormat(mainWeatherCache.time![i])}',
              notificationTime,
              StatusWeather().getImageNotification(
                mainWeatherCache.weathercode![i],
                mainWeatherCache.time![i],
                mainWeatherCache.sunrise![j],
                mainWeatherCache.sunset![j],
              ),
            );
          }
        }
      }
    }
  }

  void reorder(oldIndex, newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final element = weatherCards.removeAt(oldIndex);
    weatherCards.insert(newIndex, element);

    for (int i = 0; i < weatherCards.length; i++) {
      final item = weatherCards[i];
      item.index = i;
      isar.writeTxn(() async => await isar.weatherCards.put(item));
    }
  }
}
