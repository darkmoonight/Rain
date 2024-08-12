import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_cache/flutter_map_cache.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';

class MapWeather extends StatefulWidget {
  const MapWeather({super.key});

  @override
  State<MapWeather> createState() => _MapWeatherState();
}

class _MapWeatherState extends State<MapWeather> with TickerProviderStateMixin {
  late final _animatedMapController = AnimatedMapController(vsync: this);
  final weatherController = Get.put(WeatherController());

  final Future<CacheStore> _cacheStoreFuture = _getCacheStore();

  static Future<CacheStore> _getCacheStore() async {
    final dir = await getTemporaryDirectory();
    return FileCacheStore('${dir.path}${Platform.pathSeparator}MapTiles');
  }

  @override
  Widget build(BuildContext context) {
    final mainLocation = weatherController.location;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
            ),
            children: [
              isDarkMode
                  ? darkModeTilesContainerBuilder(
                      context, openStreetMapTileLayer(cacheStore))
                  : openStreetMapTileLayer(cacheStore)
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
