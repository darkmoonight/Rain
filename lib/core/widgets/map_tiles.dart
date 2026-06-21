import 'dart:io';

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cache/flutter_map_cache.dart';
import 'package:http_cache_file_store/http_cache_file_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/core/constants/app_constants.dart';

/// Opens the on-disk cache store used for OpenStreetMap tiles.
Future<FileCacheStore> openMapTilesCacheStore() async {
  final dir = await getTemporaryDirectory();
  return FileCacheStore(
    '${dir.path}${Platform.pathSeparator}${AppConstants.mapTilesCacheDir}',
  );
}

/// Builds the standard OpenStreetMap [TileLayer] for Rain map screens.
TileLayer buildRainMapTileLayer({CacheStore? cacheStore}) => TileLayer(
  urlTemplate: AppConstants.mapTileUrlTemplate,
  userAgentPackageName: AppConstants.mapUserAgentPackageName,
  tileProvider: cacheStore == null
      ? null
      : CachedTileProvider(
          store: cacheStore,
          maxStale: AppConstants.mapTileCacheDays,
        ),
);

/// Wraps [child] with the shared dark-mode color filter when [isDark] is true.
Widget buildRainMapDarkModeFilter({
  required bool isDark,
  required Widget child,
}) {
  if (!isDark) return child;
  return ColorFiltered(
    colorFilter: ColorFilter.matrix(AppConstants.mapDarkColorFilterMatrix),
    child: child,
  );
}
