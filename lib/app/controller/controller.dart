import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:home_widget/home_widget.dart';
import 'package:isar_community/isar.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;
import 'package:path_provider/path_provider.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/constants/app_constants.dart';
import 'package:rain/app/data/db.dart';
import 'package:rain/app/utils/notification.dart';
import 'package:rain/app/utils/show_snack_bar.dart';
import 'package:rain/app/ui/widgets/weather/status/status_data.dart';
import 'package:rain/app/ui/widgets/weather/status/status_weather.dart';
import 'package:rain/main.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/standalone.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:url_launcher/url_launcher.dart';
import 'package:workmanager/workmanager.dart';
import 'package:intl/intl.dart';

class WeatherController extends GetxController {
  final isLoading = true.obs;
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
  late final DateTime cacheExpiry;

  @override
  void onInit() async {
    cacheExpiry = DateTime.now().subtract(AppConstants.cacheExpiry);
    weatherCards.assignAll(
      await isar.weatherCards.where().sortByIndex().findAll(),
    );
    super.onInit();
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> setLocation() async {
    if (settings.location) {
      await getCurrentLocation();
    } else {
      final locationCity = await isar.locationCaches.where().findFirst();
      if (locationCity != null) {
        await getLocation(
          locationCity.lat!,
          locationCity.lon!,
          locationCity.district!,
          locationCity.city!,
        );
      }
    }
  }

  Future<void> getCurrentLocation() async {
    if (!(await isOnline.value)) {
      showSnackBar('no_inter'.tr);
      await readCache();
      return;
    }

    if (!await Geolocator.isLocationServiceEnabled()) {
      showSnackBar(
        'no_location'.tr,
        onPressed: () => Geolocator.openLocationSettings(),
      );
      await readCache();
      return;
    }

    if (await isar.mainWeatherCaches.where().isNotEmpty()) {
      await readCache();
      return;
    }

    try {
      final position = await _determinePosition();
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isEmpty) {
        showSnackBar('location_not_found'.tr);
        isLoading.value = false;
        return;
      }
      final place = placemarks[0];

      _latitude.value = position.latitude;
      _longitude.value = position.longitude;
      _district.value = place.administrativeArea ?? '';
      _city.value = place.locality ?? '';

      _mainWeather.value = await WeatherAPI().getWeatherData(
        _latitude.value,
        _longitude.value,
      );

      notificationCheck();
      await writeCache();
      if (Platform.isAndroid) {
        await Future.delayed(const Duration(milliseconds: 100));
        await updateWidget();
      }
      await readCache();
    } catch (e) {
      showSnackBar('error_occurred'.tr, isError: true);
      await readCache();
    }
  }

  Future<Map<String, dynamic>> getCurrentLocationSearch() async {
    if (!(await isOnline.value)) {
      showSnackBar('no_inter'.tr);
    }

    if (!await Geolocator.isLocationServiceEnabled()) {
      showSnackBar(
        'no_location'.tr,
        onPressed: () => Geolocator.openLocationSettings(),
      );
    }

    final position = await _determinePosition();
    final placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    final place = placemarks[0];

    return {
      'lat': position.latitude,
      'lon': position.longitude,
      'city': place.administrativeArea ?? '',
      'district': place.locality ?? '',
    };
  }

  Future<void> getLocation(
    double latitude,
    double longitude,
    String district,
    String locality,
  ) async {
    if (!(await isOnline.value)) {
      showSnackBar('no_inter'.tr);
      await readCache();
      return;
    }

    if (await isar.mainWeatherCaches.where().isNotEmpty()) {
      await readCache();
      return;
    }

    try {
      _latitude.value = latitude;
      _longitude.value = longitude;
      _district.value = district;
      _city.value = locality;

      _mainWeather.value = await WeatherAPI().getWeatherData(
        _latitude.value,
        _longitude.value,
      );

      notificationCheck();
      await writeCache();
      if (Platform.isAndroid) {
        await Future.delayed(const Duration(milliseconds: 100));
        await updateWidget();
      }
      await readCache();
    } catch (e) {
      showSnackBar('error_occurred'.tr, isError: true);
      await readCache();
    }
  }

  Future<void> readCache() async {
    MainWeatherCache? mainWeatherCache = await isar.mainWeatherCaches
        .where()
        .findFirst();
    LocationCache? locationCache = await isar.locationCaches
        .where()
        .findFirst();

    if (mainWeatherCache == null || locationCache == null) {
      isLoading.value = false;
      return;
    }

    _mainWeather.value = mainWeatherCache;
    _location.value = locationCache;

    hourOfDay.value = getTime(
      _mainWeather.value.time!,
      _mainWeather.value.timezone!,
    );
    dayOfNow.value = getDay(
      _mainWeather.value.timeDaily!,
      _mainWeather.value.timezone!,
    );

    if (Platform.isAndroid) {
      Workmanager().registerPeriodicTask(
        'widgetUpdate',
        'widgetBackgroundUpdate',
        frequency: const Duration(minutes: 15),
        existingWorkPolicy: ExistingPeriodicWorkPolicy.update,
      );
    }

    isLoading.value = false;

    Future.delayed(AppConstants.scrollToCurrentHourDelay, scrollToCurrentHour);
  }

  void scrollToCurrentHour({int retryCount = 0}) {
    if (itemScrollController.isAttached) {
      itemScrollController.scrollTo(
        index: hourOfDay.value,
        duration: AppConstants.scrollDuration,
        curve: Curves.easeInOutCubic,
      );
    } else if (retryCount < AppConstants.maxScrollRetries) {
      Future.delayed(
        AppConstants.scrollToRetryDelay,
        () => scrollToCurrentHour(retryCount: retryCount + 1),
      );
    }
  }

  Future<void> writeCache() async {
    final locationCaches = LocationCache(
      lat: _latitude.value,
      lon: _longitude.value,
      city: _city.value,
      district: _district.value,
    );

    await isar.writeTxn(() async {
      final hasLocation = await isar.locationCaches.where().isEmpty();
      await isar.mainWeatherCaches.put(_mainWeather.value);
      if (hasLocation) {
        await isar.locationCaches.put(locationCaches);
      }
    });
  }

  Future<void> deleteCache() async {
    if (!(await isOnline.value)) {
      return;
    }

    await isar.writeTxn(
      () => isar.mainWeatherCaches
          .filter()
          .timestampLessThan(cacheExpiry)
          .deleteAll(),
    );

    if (await isar.mainWeatherCaches.where().isEmpty()) {
      await flutterLocalNotificationsPlugin.cancelAll();
    }
  }

  Future<void> deleteAll(bool changeCity) async {
    if (!(await isOnline.value)) {
      return;
    }

    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    await flutterLocalNotificationsPlugin.cancelAll();

    await isar.writeTxn(() async {
      if (!settings.location) {
        await isar.mainWeatherCaches.where().deleteAll();
      }
      if (settings.location && serviceEnabled || changeCity) {
        await isar.mainWeatherCaches.where().deleteAll();
        await isar.locationCaches.where().deleteAll();
      }
    });
  }

  Future<void> addCardWeather(
    double latitude,
    double longitude,
    String city,
    String district,
  ) async {
    if (!(await isOnline.value)) {
      showSnackBar('no_inter'.tr);
      return;
    }

    final tz = tzmap.latLngToTimezoneString(latitude, longitude);
    _weatherCard.value = await WeatherAPI().getWeatherCard(
      latitude,
      longitude,
      city,
      district,
      tz,
    );
    isar.writeTxn(() async {
      weatherCards.add(_weatherCard.value);
      await isar.weatherCards.put(_weatherCard.value);
    });
  }

  Future<void> updateCardLocation(
    WeatherCard card,
    double latitude,
    double longitude,
    String city,
    String district,
  ) async {
    if (!(await isOnline.value)) {
      showSnackBar('no_inter'.tr);
      return;
    }

    final tz = tzmap.latLngToTimezoneString(latitude, longitude);
    final updatedCard = await WeatherAPI().getWeatherCard(
      latitude,
      longitude,
      city,
      district,
      tz,
    );

    await isar.writeTxn(() async {
      card.lat = latitude;
      card.lon = longitude;
      card.city = city;
      card.district = district;
      card.timezone = tz;

      _updateWeatherCard(card, updatedCard);
      await isar.weatherCards.put(card);
    });

    weatherCards.refresh();
  }

  Future<void> updateCacheCard(bool refresh) async {
    final weatherCard = refresh
        ? await isar.weatherCards.where().sortByIndex().findAll()
        : await isar.weatherCards
              .filter()
              .timestampLessThan(cacheExpiry)
              .sortByIndex()
              .findAll();

    if (!(await isOnline.value) || weatherCard.isEmpty) {
      return;
    }

    for (var oldCard in weatherCard) {
      final updatedCard = await WeatherAPI().getWeatherCard(
        oldCard.lat!,
        oldCard.lon!,
        oldCard.city!,
        oldCard.district!,
        oldCard.timezone!,
      );
      await isar.writeTxn(() async {
        _updateWeatherCard(oldCard, updatedCard);
        weatherCards.refresh();
      });
    }
  }

  Future<void> _updateWeatherCard(
    WeatherCard oldCard,
    WeatherCard updatedCard,
  ) async {
    oldCard
      ..time = updatedCard.time
      ..weathercode = updatedCard.weathercode
      ..temperature2M = updatedCard.temperature2M
      ..apparentTemperature = updatedCard.apparentTemperature
      ..relativehumidity2M = updatedCard.relativehumidity2M
      ..precipitation = updatedCard.precipitation
      ..rain = updatedCard.rain
      ..surfacePressure = updatedCard.surfacePressure
      ..visibility = updatedCard.visibility
      ..evapotranspiration = updatedCard.evapotranspiration
      ..windspeed10M = updatedCard.windspeed10M
      ..winddirection10M = updatedCard.winddirection10M
      ..windgusts10M = updatedCard.windgusts10M
      ..cloudcover = updatedCard.cloudcover
      ..uvIndex = updatedCard.uvIndex
      ..dewpoint2M = updatedCard.dewpoint2M
      ..precipitationProbability = updatedCard.precipitationProbability
      ..shortwaveRadiation = updatedCard.shortwaveRadiation
      ..timeDaily = updatedCard.timeDaily
      ..weathercodeDaily = updatedCard.weathercodeDaily
      ..temperature2MMax = updatedCard.temperature2MMax
      ..temperature2MMin = updatedCard.temperature2MMin
      ..apparentTemperatureMax = updatedCard.apparentTemperatureMax
      ..apparentTemperatureMin = updatedCard.apparentTemperatureMin
      ..sunrise = updatedCard.sunrise
      ..sunset = updatedCard.sunset
      ..precipitationSum = updatedCard.precipitationSum
      ..precipitationProbabilityMax = updatedCard.precipitationProbabilityMax
      ..windspeed10MMax = updatedCard.windspeed10MMax
      ..windgusts10MMax = updatedCard.windgusts10MMax
      ..uvIndexMax = updatedCard.uvIndexMax
      ..rainSum = updatedCard.rainSum
      ..winddirection10MDominant = updatedCard.winddirection10MDominant
      ..timestamp = DateTime.now();

    await isar.weatherCards.put(oldCard);
  }

  Future<void> updateCard(WeatherCard weatherCard) async {
    if (!(await isOnline.value)) {
      return;
    }

    final updatedCard = await WeatherAPI().getWeatherCard(
      weatherCard.lat!,
      weatherCard.lon!,
      weatherCard.city!,
      weatherCard.district!,
      weatherCard.timezone!,
    );

    await isar.writeTxn(() => _updateWeatherCard(weatherCard, updatedCard));
  }

  Future<void> deleteCardWeather(WeatherCard weatherCard) async {
    weatherCards.remove(weatherCard);
    await isar.writeTxn(() => isar.weatherCards.delete(weatherCard.id));
  }

  int getTime(List<String> time, String timezone) {
    final tzLocation = tz.getLocation(timezone);
    final tzNow = tz.TZDateTime.now(tzLocation);

    return time.indexWhere((t) {
      final dateTime = DateTime.parse(t);
      return tzNow.hour == dateTime.hour && tzNow.day == dateTime.day;
    });
  }

  int getDay(List<DateTime> time, String timezone) {
    final tzLocation = tz.getLocation(timezone);
    final tzNow = tz.TZDateTime.now(tzLocation);

    return time.indexWhere((t) => tzNow.day == t.day);
  }

  TimeOfDay parseTime(String? timeStr) {
    if (timeStr == null) {
      return const TimeOfDay(hour: 0, minute: 0);
    }
    if (timeStr.contains(' ')) {
      final isPM = timeStr.endsWith('PM');
      final timeParts = timeStr.split(' ')[0].split(':');
      int hour = int.parse(timeParts[0]);
      if (isPM) hour += 12;
      final minute = int.parse(timeParts[1]);
      return TimeOfDay(hour: hour % 24, minute: minute);
    } else {
      final parts = timeStr.split(':');
      return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    }
  }

  String timeTo24h(TimeOfDay time) =>
      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

  String formatTime(String? timeStr) {
    final time = parseTime(timeStr);
    final dateTime = DateTime(0, 0, 0, time.hour, time.minute);
    if (settings.timeformat == '12') {
      return DateFormat.jm(locale.languageCode).format(dateTime);
    } else {
      return DateFormat.Hm(locale.languageCode).format(dateTime);
    }
  }

  Future<String> getLocalImagePath(String icon) async {
    final directory = await getTemporaryDirectory();
    final imagePath = '${directory.path}/$icon';

    final data = await rootBundle.load('assets/images/$icon');
    final bytes = data.buffer.asUint8List();

    await File(imagePath).writeAsBytes(bytes);

    return imagePath;
  }

  void notification(MainWeatherCache mainWeatherCache) async {
    final now = DateTime.now();
    final startHour = parseTime(timeStart).hour;
    final endHour = parseTime(timeEnd).hour;

    for (var i = 0; i < mainWeatherCache.time!.length; i += timeRange) {
      final notificationTime = DateTime.parse(mainWeatherCache.time![i]);

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

  void notificationCheck() async {
    if (settings.notifications) {
      final pendingNotificationRequests = await flutterLocalNotificationsPlugin
          .pendingNotificationRequests();
      if (pendingNotificationRequests.isEmpty) {
        notification(_mainWeather.value);
      }
    }
  }

  Future<void> reorder(int oldIndex, int newIndex) async {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final element = weatherCards.removeAt(oldIndex);
    weatherCards.insert(newIndex, element);

    for (int i = 0; i < weatherCards.length; i++) {
      final item = weatherCards[i];
      item.index = i;
      await isar.writeTxn(() => isar.weatherCards.put(item));
    }
  }

  Future<bool> updateWidgetBackgroundColor(String color) async {
    settings.widgetBackgroundColor = color;
    await isar.writeTxn(() => isar.settings.put(settings));

    final results = await Future.wait<bool?>([
      HomeWidget.saveWidgetData('background_color', color),
      HomeWidget.updateWidget(androidName: androidWidgetName),
    ]);
    return !results.contains(false);
  }

  Future<bool> resetWidgetBackgroundColor() async {
    settings.widgetBackgroundColor = null;
    await isar.writeTxn(() => isar.settings.put(settings));

    final results = await Future.wait<bool?>([
      HomeWidget.saveWidgetData<String>('background_color', null),
      HomeWidget.updateWidget(androidName: androidWidgetName),
    ]);
    return !results.contains(false);
  }

  Future<bool> updateWidgetTextColor(String color) async {
    settings.widgetTextColor = color;
    await isar.writeTxn(() => isar.settings.put(settings));

    final results = await Future.wait<bool?>([
      HomeWidget.saveWidgetData('text_color', color),
      HomeWidget.updateWidget(androidName: androidWidgetName),
    ]);
    return !results.contains(false);
  }

  Future<bool> resetWidgetTextColor() async {
    settings.widgetTextColor = null;
    await isar.writeTxn(() => isar.settings.put(settings));

    final results = await Future.wait<bool?>([
      HomeWidget.saveWidgetData<String>('text_color', null),
      HomeWidget.updateWidget(androidName: androidWidgetName),
    ]);
    return !results.contains(false);
  }

  Future<bool> updateWidget() async {
    try {
      final TimezoneInfo timeZoneName = await FlutterTimezone.getLocalTimezone();
      tz.initializeTimeZones();
      tz.setLocalLocation(tz.getLocation(timeZoneName.identifier));

      final isarWidget = await Isar.open([
        SettingsSchema,
        MainWeatherCacheSchema,
        LocationCacheSchema,
        WeatherCardSchema,
      ], directory: (await getApplicationSupportDirectory()).path);

      final mainWeatherCache = await isarWidget.mainWeatherCaches
          .where()
          .findFirst();
      if (mainWeatherCache == null) return false;

      final hour = getTime(mainWeatherCache.time!, mainWeatherCache.timezone!);
      final day = getDay(mainWeatherCache.timeDaily!, mainWeatherCache.timezone!);

      final icon = StatusWeather().getImageNotification(
        mainWeatherCache.weathercode![hour],
        mainWeatherCache.time![hour],
        mainWeatherCache.sunrise![day],
        mainWeatherCache.sunset![day],
      );
      
      final imagePath = await getLocalImagePath(icon);
      final degree = '${mainWeatherCache.temperature2M?[hour].round()}°';

      final results = await Future.wait<bool?>([
        HomeWidget.saveWidgetData('weather_icon', imagePath),
        HomeWidget.saveWidgetData('weather_degree', degree),
        HomeWidget.updateWidget(androidName: androidWidgetName),
      ]);
      return !results.contains(false);
    } catch (e) {
      return false;
    }
  }

  void urlLauncher(String uri) async {
    final url = Uri.parse(uri);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
