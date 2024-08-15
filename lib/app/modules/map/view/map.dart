import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_cache/flutter_map_cache.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:rain/app/modules/cards/widgets/create_card_weather.dart';
import 'package:rain/secret_key.dart';

class MapWeather extends StatefulWidget {
  const MapWeather({super.key});

  @override
  State<MapWeather> createState() => _MapWeatherState();
}

class _MapWeatherState extends State<MapWeather> with TickerProviderStateMixin {
  late final _animatedMapController = AnimatedMapController(vsync: this);
  final weatherController = Get.put(WeatherController());
  bool isDarkMode = Get.theme.brightness == Brightness.dark;

  final Future<CacheStore> _cacheStoreFuture = _getCacheStore();

  static Future<CacheStore> _getCacheStore() async {
    final dir = await getTemporaryDirectory();
    return FileCacheStore('${dir.path}${Platform.pathSeparator}MapTiles');
  }

  @override
  Widget build(BuildContext context) {
    final mainLocation = weatherController.location;
    // final mainWeather = weatherController.mainWeather;
    // final weatherCard = WeatherCard.fromJson({}
    //   ..addAll(mainWeather.toJson())
    //   ..addAll(mainLocation.toJson()));

    Widget darkModeTilesContainerBuilder(
      BuildContext context,
      Widget tilesContainer,
    ) {
      return ColorFiltered(
        colorFilter: const ColorFilter.matrix(<double>[
          -0.2126, -0.7152, -0.0722, 0, 255, // Red channel
          -0.2126, -0.7152, -0.0722, 0, 255, // Green channel
          -0.2126, -0.7152, -0.0722, 0, 255, // Blue channel
          0, 0, 0, 1, 0, // Alpha channel
        ]),
        child: tilesContainer,
      );
    }

    Widget openStreetMapTileLayer(CacheStore cacheStore) {
      return TileLayer(
          urlTemplate:
              'https://api.mapbox.com/styles/v1/yoshimok/clzvnt6ae000s01qsh52veh8f/tiles/256/{z}/{x}/{y}@2x?access_token=$accessToken',
          userAgentPackageName: 'com.darkmoonight.rain',
          tileProvider: CachedTileProvider(
            store: cacheStore,
            maxStale: const Duration(days: 30),
          ));
    }

    return FutureBuilder<CacheStore>(
      future: _cacheStoreFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
              isDarkMode
                  ? darkModeTilesContainerBuilder(
                      context, openStreetMapTileLayer(cacheStore))
                  : openStreetMapTileLayer(cacheStore),
              RichAttributionWidget(
                animationConfig: const ScaleRAWA(),
                attributions: [
                  TextSourceAttribution(
                    'Mapbox contributors',
                    onTap: () => weatherController
                        .urlLauncher('https://www.mapbox.com/legal/tos'),
                  ),
                ],
              ),
              Obx(
                () {
                  var weatherCards = weatherController.weatherCards.toList();
                  return MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(mainLocation.lat!, mainLocation.lon!),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  context.theme.colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              IconsaxPlusBold.home,
                              color: context
                                  .theme.colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ),
                      ),
                      ...weatherCards.map(
                        (weatherCardList) => Marker(
                          width: 35,
                          height: 35,
                          point: LatLng(
                              weatherCardList.lat!, weatherCardList.lon!),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: context
                                    .theme.colorScheme.secondaryContainer,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                IconsaxPlusBold.location,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
              // Positioned(
              //   left: 0,
              //   right: 0,
              //   bottom: 0,
              //   child: GestureDetector(
              //     onTap: () => Get.to(
              //       () => InfoWeatherCard(
              //         weatherCard: weatherCard,
              //       ),
              //       transition: Transition.downToUp,
              //     ),
              //     child: WeatherCardContainer(
              //       time: mainWeather.time!,
              //       timeDaily: mainWeather.timeDaily!,
              //       timeDay: mainWeather.sunrise!,
              //       timeNight: mainWeather.sunset!,
              //       weather: mainWeather.weathercode!,
              //       degree: mainWeather.temperature2M!,
              //       district: mainLocation.district!,
              //       city: mainLocation.city!,
              //       timezone: mainWeather.timezone!,
              //     ),
              //   ),
              // )
            ],
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
