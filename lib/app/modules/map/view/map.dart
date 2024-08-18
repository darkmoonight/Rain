import 'dart:io';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_cache/flutter_map_cache.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/modules/cards/view/info_weather_card.dart';
import 'package:rain/app/modules/cards/widgets/create_card_weather.dart';
import 'package:rain/app/modules/cards/widgets/weather_card_container.dart';
import 'package:rain/app/widgets/status/status_weather.dart';

class MapWeather extends StatefulWidget {
  const MapWeather({super.key});

  @override
  State<MapWeather> createState() => _MapWeatherState();
}

class _MapWeatherState extends State<MapWeather> with TickerProviderStateMixin {
  late final AnimatedMapController _animatedMapController =
      AnimatedMapController(vsync: this);
  final weatherController = Get.put(WeatherController());
  final statusWeather = StatusWeather();
  final Future<CacheStore> _cacheStoreFuture = _getCacheStore();

  final bool _isDarkMode = Get.theme.brightness == Brightness.dark;
  WeatherCard? _selectedWeatherCard;
  bool _isCardVisible = false;
  double _cardBottomPosition = -200;

  static Future<CacheStore> _getCacheStore() async {
    final dir = await getTemporaryDirectory();
    return FileCacheStore('${dir.path}${Platform.pathSeparator}MapTiles');
  }

  void _onMarkerTap(WeatherCard weatherCard) {
    setState(() {
      _selectedWeatherCard = weatherCard;
      _cardBottomPosition = 0;
      _isCardVisible = true;
    });
  }

  void _hideCard() {
    setState(() {
      _cardBottomPosition = -200;
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _isCardVisible = false;
      });
    });
  }

  Marker _buildMainLocationMarker(
      WeatherCard weatherCard, int hourOfDay, int dayOfNow) {
    return Marker(
      height: 40,
      width: 40,
      point: LatLng(weatherCard.lat!, weatherCard.lon!),
      child: GestureDetector(
        onTap: () => _onMarkerTap(weatherCard),
        child: Container(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.onSecondary,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            statusWeather.getImageNow(
              weatherCard.weathercode![hourOfDay],
              weatherCard.time![hourOfDay],
              weatherCard.sunrise![dayOfNow],
              weatherCard.sunset![dayOfNow],
            ),
            scale: 15,
          ),
        ),
      ),
    );
  }

  Marker _buildCardMarker(WeatherCard weatherCardList) {
    return Marker(
      height: 40,
      width: 40,
      point: LatLng(weatherCardList.lat!, weatherCardList.lon!),
      child: GestureDetector(
        onTap: () => _onMarkerTap(weatherCardList),
        child: Container(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.onSecondary,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            statusWeather.getImageNow(
              weatherCardList.weathercode![weatherController.getTime(
                  weatherCardList.time!, weatherCardList.timezone!)],
              weatherCardList.time![weatherController.getTime(
                  weatherCardList.time!, weatherCardList.timezone!)],
              weatherCardList.sunrise![weatherController.getDay(
                  weatherCardList.timeDaily!, weatherCardList.timezone!)],
              weatherCardList.sunset![weatherController.getDay(
                  weatherCardList.timeDaily!, weatherCardList.timezone!)],
            ),
            scale: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildMapTileLayer(CacheStore cacheStore) {
    return TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.darkmoonight.rain',
      tileProvider: CachedTileProvider(
        store: cacheStore,
        maxStale: const Duration(days: 30),
      ),
    );
  }

  Widget _buildWeatherCard() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      left: 0,
      right: 0,
      bottom: _cardBottomPosition,
      child: AnimatedOpacity(
        opacity: _isCardVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: _isCardVisible
            ? GestureDetector(
                onTap: () => Get.to(
                  () => InfoWeatherCard(weatherCard: _selectedWeatherCard!),
                  transition: Transition.downToUp,
                ),
                child: WeatherCardContainer(
                  time: _selectedWeatherCard!.time!,
                  timeDaily: _selectedWeatherCard!.timeDaily!,
                  timeDay: _selectedWeatherCard!.sunrise!,
                  timeNight: _selectedWeatherCard!.sunset!,
                  weather: _selectedWeatherCard!.weathercode!,
                  degree: _selectedWeatherCard!.temperature2M!,
                  district: _selectedWeatherCard!.district!,
                  city: _selectedWeatherCard!.city!,
                  timezone: _selectedWeatherCard!.timezone!,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mainLocation = weatherController.location;
    final mainWeather = weatherController.mainWeather;

    final hourOfDay = weatherController.hourOfDay.value;
    final dayOfNow = weatherController.dayOfNow.value;

    return FutureBuilder<CacheStore>(
      future: _cacheStoreFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        final cacheStore = snapshot.data!;

        return FlutterMap(
          mapController: _animatedMapController.mapController,
          options: MapOptions(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            initialCenter: LatLng(mainLocation.lat!, mainLocation.lon!),
            initialZoom: 12,
            cameraConstraint: CameraConstraint.contain(
              bounds: LatLngBounds(
                const LatLng(-90, -180),
                const LatLng(90, 180),
              ),
            ),
            onTap: (_, __) => _hideCard(),
            onLongPress: (tapPosition, point) => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              enableDrag: false,
              builder: (BuildContext context) => CreateWeatherCard(
                latitude: '${point.latitude}',
                longitude: '${point.longitude}',
              ),
            ),
          ),
          children: [
            if (_isDarkMode)
              ColorFiltered(
                colorFilter: const ColorFilter.matrix(<double>[
                  -0.2126, -0.7152, -0.0722, 0, 255, // Red channel
                  -0.2126, -0.7152, -0.0722, 0, 255, // Green channel
                  -0.2126, -0.7152, -0.0722, 0, 255, // Blue channel
                  0, 0, 0, 1, 0, // Alpha channel
                ]),
                child: _buildMapTileLayer(cacheStore),
              )
            else
              _buildMapTileLayer(cacheStore),
            RichAttributionWidget(
              animationConfig: const ScaleRAWA(),
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () => weatherController
                      .urlLauncher('https://openstreetmap.org/copyright'),
                ),
              ],
            ),
            Obx(() {
              final mainMarker = _buildMainLocationMarker(
                WeatherCard.fromJson({
                  ...mainWeather.toJson(),
                  ...mainLocation.toJson(),
                }),
                hourOfDay,
                dayOfNow,
              );

              final cardMarkers = weatherController.weatherCards
                  .map((weatherCardList) => _buildCardMarker(weatherCardList))
                  .toList();

              return MarkerLayer(
                markers: [mainMarker, ...cardMarkers],
              );
            }),
            _buildWeatherCard(),
          ],
        );
      },
    );
  }
}
