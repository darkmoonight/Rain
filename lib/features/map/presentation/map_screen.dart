import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:latlong2/latlong.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/utils/responsive_utils.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/core/widgets/city_search_field.dart';
import 'package:rain/core/widgets/map_tiles.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/cities/presentation/view/place_info.dart';
import 'package:rain/features/cities/presentation/widgets/place_action.dart';
import 'package:rain/features/cities/presentation/widgets/weather_card_tile.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/core/utils/url_launcher_util.dart';

/// Interactive map showing the main location and saved city markers.
class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

/// Renders the weather map, markers, search, and selected-card overlay.
class _MapPageState extends ConsumerState<MapPage>
    with TickerProviderStateMixin {
  late final AnimatedMapController _animatedMapController =
      AnimatedMapController(vsync: this);

  late final Future<CacheStore> _cacheStoreFuture = openMapTilesCacheStore();

  final GlobalKey<ExpandableFabState> _fabKey = GlobalKey<ExpandableFabState>();

  WeatherCard? _selectedWeatherCard;
  bool _isCardVisible = false;
  late final AnimationController _animationController;
  late final Animation<Offset> _offsetAnimation;
  static const _useTransformerId = 'useTransformerId';

  final _focusNode = FocusNode();
  late final TextEditingController _controllerSearch = TextEditingController();

  /// Initializes slide animation for the selected weather card overlay.
  @override
  void initState() {
    _animationController = AnimationController(
      duration: AppConstants.animationDuration,
      vsync: this,
    );

    _offsetAnimation =
        Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
    super.initState();
  }

  /// Disposes map, search, and animation controllers.
  @override
  void dispose() {
    _animatedMapController.dispose();
    _controllerSearch.dispose();
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  /// Animates the map to [center] and [zoom] with north-up orientation.
  void _resetMapOrientation({LatLng? center, double? zoom}) =>
      _animatedMapController.animateTo(
        customId: _useTransformerId,
        dest: center,
        zoom: zoom,
        rotation: 0,
        duration: AppConstants.longAnimation,
        curve: Curves.easeInOut,
      );

  /// Shows the weather card overlay for the tapped [weatherCard] marker.
  void _onMarkerTap(WeatherCard weatherCard) {
    setState(() => _selectedWeatherCard = weatherCard);
    _animationController.forward();
    _isCardVisible = true;

    if (_fabKey.currentState?.isOpen == true) {
      _fabKey.currentState?.toggle();
    }
  }

  /// Hides the selected weather card overlay and clears search focus.
  void _hideCard() {
    _animationController.reverse().then(
      (_) => setState(() {
        _isCardVisible = false;
        _selectedWeatherCard = null;
      }),
    );
    _focusNode.unfocus();
  }

  /// Builds the weather icon and temperature label for a map marker.
  Widget _buildStyleMarkers(
    int weathercode,
    String time,
    String sunrise,
    String sunset,
    double temperature2M, {
    required StatusData statusData,
  }) {
    final statusWeather = ref.watch(statusWeatherProvider);
    return SizedBox(
      width: 100,
      height: 50,
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                statusWeather.getImageNow(weathercode, time, sunrise, sunset),
                scale: 18,
              ),
              const SizedBox(width: 5),
              Text(
                statusData.getDegree(temperature2M),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the primary-location [Marker] for [weatherCard].
  Marker _buildMainLocationMarker(
    WeatherCard weatherCard,
    int hourOfDay,
    int dayOfNow, {
    required StatusData statusData,
  }) => Marker(
    height: 50,
    width: 100,
    point: LatLng(weatherCard.lat!, weatherCard.lon!),
    child: GestureDetector(
      onTap: () => _onMarkerTap(weatherCard),
      child: _buildStyleMarkers(
        weatherCard.weathercode![hourOfDay],
        weatherCard.time![hourOfDay],
        weatherCard.sunrise![dayOfNow],
        weatherCard.sunset![dayOfNow],
        weatherCard.temperature2M![hourOfDay],
        statusData: statusData,
      ),
    ),
  );

  /// Builds a saved-city [Marker] for [weatherCardList].
  Marker _buildCardMarker(
    WeatherCard weatherCardList, {
    required StatusData statusData,
  }) {
    final clock = LocationClock.fromWeatherCard(
      weatherCardList,
      settingsClockSkewSeconds: statusData.settings.clockSkewSeconds,
    );
    final hourOfDay = TimeIndexHelper.getTime(weatherCardList.time!, clock);
    final dayOfNow = TimeIndexHelper.getDay(weatherCardList.timeDaily!, clock);

    return Marker(
      height: 50,
      width: 100,
      point: LatLng(weatherCardList.lat!, weatherCardList.lon!),
      child: GestureDetector(
        onTap: () => _onMarkerTap(weatherCardList),
        child: _buildStyleMarkers(
          weatherCardList.weathercode![hourOfDay],
          weatherCardList.time![hourOfDay],
          weatherCardList.sunrise![dayOfNow],
          weatherCardList.sunset![dayOfNow],
          weatherCardList.temperature2M![hourOfDay],
          statusData: statusData,
        ),
      ),
    );
  }

  /// Builds the cached OpenStreetMap [TileLayer] for the weather map.
  Widget _buildMapTileLayer(CacheStore cacheStore) =>
      buildRainMapTileLayer(cacheStore: cacheStore);

  /// Builds the sliding [WeatherCardTile] overlay for the selected marker.
  Widget _buildWeatherCard() => _isCardVisible && _selectedWeatherCard != null
      ? SlideTransition(
          position: _offsetAnimation,
          child: GestureDetector(
            onTap: () => NavigationHelper.toDownToUp(
              context,
              () => PlaceInfo(
                cardId: _selectedWeatherCard!.id,
                card: _selectedWeatherCard,
              ),
            ),
            child: WeatherCardTile(card: _selectedWeatherCard!),
          ),
        )
      : const SizedBox.shrink();

  /// City search field that pans the map to a selected result.
  Widget _buildSearchField() {
    final searchTextStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: ResponsiveUtils.getResponsiveFontSize(context, 13),
    );

    return CitySearchField(
      controller: _controllerSearch,
      focusNode: _focusNode,
      margin: const EdgeInsets.only(
        left: AppConstants.cardPaddingHorizontal,
        right: AppConstants.cardPaddingHorizontal,
        top: AppConstants.cardPaddingHorizontal,
      ),
      style: searchTextStyle,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      optionsStyle: CitySearchOptionsStyle.compact,
      optionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      onChanged: (_) => setState(() {}),
      iconButton: _controllerSearch.text.isNotEmpty
          ? IconButton(
              onPressed: () => _controllerSearch.clear(),
              icon: const Icon(
                IconsaxPlusLinear.close_circle,
                color: Colors.grey,
                size: 20,
              ),
            )
          : null,
      onSelected: (selection) {
        if (selection.latitude == null || selection.longitude == null) return;
        _animatedMapController.mapController.move(
          LatLng(selection.latitude!, selection.longitude!),
          AppConstants.mapSearchZoom,
        );
        _controllerSearch.clear();
        _focusNode.unfocus();
      },
    );
  }

  /// Builds the weather map with markers, FAB controls, and search overlay.
  @override
  Widget build(BuildContext context) {
    final (:isLoading, :location, :mainWeather, :hourOfDay, :dayOfNow) = ref
        .watch(
          mainWeatherNotifierProvider.select(
            (s) => (
              isLoading: s.isLoading,
              location: s.location,
              mainWeather: s.mainWeather,
              hourOfDay: s.hourOfDay,
              dayOfNow: s.dayOfNow,
            ),
          ),
        );
    final settings = ref.watch(settingsProvider);
    final statusData = StatusData(settings: settings);
    final mainLocation = location;

    if (isLoading || mainLocation.lat == null || mainLocation.lon == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final lat = mainLocation.lat!;
    final lon = mainLocation.lon!;

    return Scaffold(
      body: FutureBuilder<CacheStore>(
        future: _cacheStoreFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final cacheStore = snapshot.data!;

          return Stack(
            children: [
              FlutterMap(
                mapController: _animatedMapController.mapController,
                options: MapOptions(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  initialCenter: LatLng(lat, lon),
                  initialZoom: AppConstants.mapDefaultZoom,
                  interactionOptions: const InteractionOptions(
                    flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                  ),
                  cameraConstraint: CameraConstraint.contain(
                    bounds: LatLngBounds(
                      const LatLng(-90, -180),
                      const LatLng(90, 180),
                    ),
                  ),
                  onTap: (_, _) => _hideCard(),
                  onLongPress: (tapPosition, point) => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    enableDrag: false,
                    builder: (BuildContext context) => PlaceAction(
                      latitude: '${point.latitude}',
                      longitude: '${point.longitude}',
                      edit: false,
                    ),
                  ),
                ),
                children: [
                  buildRainMapDarkModeFilter(
                    isDark: Theme.of(context).brightness == Brightness.dark,
                    child: _buildMapTileLayer(cacheStore),
                  ),
                  RichAttributionWidget(
                    animationConfig: const ScaleRAWA(),
                    alignment: AttributionAlignment.bottomLeft,
                    attributions: [
                      TextSourceAttribution(
                        'OpenStreetMap contributors',
                        onTap: () =>
                            openUrl(AppConstants.openStreetMapCopyrightUrl),
                      ),
                    ],
                  ),
                  Consumer(
                    builder: (context, ref, _) {
                      final mainMarker = _buildMainLocationMarker(
                        WeatherCard.fromMainAndLocation(
                          mainWeather,
                          mainLocation,
                        ),
                        hourOfDay,
                        dayOfNow,
                        statusData: statusData,
                      );

                      final cardMarkers = ref
                          .watch(citiesNotifierProvider)
                          .cards
                          .map(
                            (weatherCardList) => _buildCardMarker(
                              weatherCardList,
                              statusData: statusData,
                            ),
                          )
                          .toList();

                      return MarkerLayer(markers: [mainMarker, ...cardMarkers]);
                    },
                  ),
                  ExpandableFab(
                    key: _fabKey,
                    pos: ExpandableFabPos.right,
                    type: ExpandableFabType.up,
                    distance: 70,
                    openButtonBuilder: RotateFloatingActionButtonBuilder(
                      child: const Icon(IconsaxPlusLinear.menu),
                      fabSize: ExpandableFabSize.regular,
                    ),
                    closeButtonBuilder: DefaultFloatingActionButtonBuilder(
                      child: const Icon(Icons.close),
                      fabSize: ExpandableFabSize.regular,
                    ),
                    children: [
                      FloatingActionButton(
                        heroTag: null,
                        child: const Icon(IconsaxPlusLinear.home_2),
                        onPressed: () => _resetMapOrientation(
                          center: LatLng(lat, lon),
                          zoom: AppConstants.mapDefaultZoom,
                        ),
                      ),
                      FloatingActionButton(
                        heroTag: null,
                        child: const Icon(IconsaxPlusLinear.search_zoom_out_1),
                        onPressed: () => _animatedMapController.animatedZoomOut(
                          customId: _useTransformerId,
                        ),
                      ),
                      FloatingActionButton(
                        heroTag: null,
                        child: const Icon(IconsaxPlusLinear.search_zoom_in),
                        onPressed: () => _animatedMapController.animatedZoomIn(
                          customId: _useTransformerId,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: _buildWeatherCard(),
                  ),
                ],
              ),
              _buildSearchField(),
            ],
          );
        },
      ),
      floatingActionButtonLocation: ExpandableFab.location,
    );
  }
}
