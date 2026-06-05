import 'dart:io';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_cache/flutter_map_cache.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_cache_file_store/http_cache_file_store.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/utils/url_launcher_util.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/cities/presentation/view/place_info.dart';
import 'package:rain/features/cities/presentation/widgets/place_action.dart';
import 'package:rain/features/cities/presentation/widgets/weather_card_tile.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/core/widgets/text_form.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/core/utils/responsive_utils.dart';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage>
    with TickerProviderStateMixin {
  late final AnimatedMapController _animatedMapController =
      AnimatedMapController(vsync: this);

  final statusWeather = StatusWeather();
  final Future<CacheStore> _cacheStoreFuture = _getCacheStore();

  final GlobalKey<ExpandableFabState> _fabKey = GlobalKey<ExpandableFabState>();

  WeatherCard? _selectedWeatherCard;
  bool _isCardVisible = false;
  late final AnimationController _animationController;
  late final Animation<Offset> _offsetAnimation;
  static const _useTransformerId = 'useTransformerId';
  final bool _useTransformer = true;

  final _focusNode = FocusNode();
  late final TextEditingController _controllerSearch = TextEditingController();

  static Future<CacheStore> _getCacheStore() async {
    final dir = await getTemporaryDirectory();
    return FileCacheStore('${dir.path}${Platform.pathSeparator}MapTiles');
  }

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
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

  @override
  void dispose() {
    _animatedMapController.dispose();
    _controllerSearch.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _resetMapOrientation({LatLng? center, double? zoom}) =>
      _animatedMapController.animateTo(
        customId: _useTransformer ? _useTransformerId : null,
        dest: center,
        zoom: zoom,
        rotation: 0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

  void _onMarkerTap(WeatherCard weatherCard) {
    setState(() => _selectedWeatherCard = weatherCard);
    _animationController.forward();
    _isCardVisible = true;

    if (_fabKey.currentState?.isOpen == true) {
      _fabKey.currentState?.toggle();
    }
  }

  void _hideCard() {
    _animationController.reverse().then(
      (_) => setState(() {
        _isCardVisible = false;
        _selectedWeatherCard = null;
      }),
    );
    _focusNode.unfocus();
  }

  Widget _buildStyleMarkers(
    int weathercode,
    String time,
    String sunrise,
    String sunset,
    double temperature2M, {
    required StatusData statusData,
  }) => Card(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          statusWeather.getImageNow(weathercode, time, sunrise, sunset),
          scale: 18,
        ),
        const MaxGap(5),
        Text(
          statusData.getDegree(temperature2M),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );

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

  Marker _buildCardMarker(
    WeatherCard weatherCardList, {
    required StatusData statusData,
  }) {
    final hourOfDay = TimeIndexHelper.getTime(
      weatherCardList.time!,
      weatherCardList.timezone!,
    );
    final dayOfNow = TimeIndexHelper.getDay(
      weatherCardList.timeDaily!,
      weatherCardList.timezone!,
    );

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

  Widget _buildMapTileLayer(CacheStore cacheStore) => TileLayer(
    urlTemplate: AppConstants.mapTileUrlTemplate,
    userAgentPackageName: AppConstants.mapUserAgentPackageName,
    tileProvider: CachedTileProvider(
      store: cacheStore,
      maxStale: AppConstants.mapTileCacheDays,
    ),
  );

  Widget _buildWeatherCard() => _isCardVisible && _selectedWeatherCard != null
      ? SlideTransition(
          position: _offsetAnimation,
          child: GestureDetector(
            onTap: () => NavigationHelper.toDownToUp(
              context,
              () => PlaceInfo(cardId: _selectedWeatherCard!.id),
            ),
            child: WeatherCardTile(card: _selectedWeatherCard!),
          ),
        )
      : const SizedBox.shrink();

  Widget _buildSearchField() {
    final searchTextStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: ResponsiveUtils.getResponsiveFontSize(context, 13),
    );

    return RawAutocomplete<CitySearchResult>(
      focusNode: _focusNode,
      textEditingController: _controllerSearch,
      fieldViewBuilder:
          (
            BuildContext context,
            TextEditingController fieldTextEditingController,
            FocusNode fieldFocusNode,
            VoidCallback onFieldSubmitted,
          ) => MyTextForm(
            labelText: 'search'.tr,
            type: TextInputType.text,
            icon: const Icon(IconsaxPlusLinear.global_search, size: 20),
            variant: TextFieldVariant.card,
            controller: _controllerSearch,
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            focusNode: _focusNode,
            style: searchTextStyle,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            onChanged: (value) {},
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
          ),
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<CitySearchResult>.empty();
        }
        final locale = ref.read(localeProvider);
        return ref
            .read(weatherRemoteDatasourceProvider)
            .searchCities(textEditingValue.text, locale.languageCode);
      },
      onSelected: (CitySearchResult selection) {
        _animatedMapController.mapController.move(
          LatLng(selection.latitude!, selection.longitude!),
          14,
        );
        _controllerSearch.clear();
        _focusNode.unfocus();
      },
      displayStringForOption: (CitySearchResult option) =>
          '${option.name}, ${option.admin1}',
      optionsViewBuilder:
          (
            BuildContext context,
            AutocompleteOnSelected<CitySearchResult> onSelected,
            Iterable<CitySearchResult> options,
          ) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Align(
              alignment: Alignment.topCenter,
              child: Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 4,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final CitySearchResult option = options.elementAt(index);
                    return InkWell(
                      onTap: () => onSelected(option),
                      child: ListTile(
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        title: Text(
                          '${option.name}, ${option.admin1}',
                          style: searchTextStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(mainWeatherNotifierProvider);
    final settings = ref.watch(settingsProvider);
    final statusData = StatusData(settings: settings);
    final mainLocation = weatherState.location;
    final mainWeather = weatherState.mainWeather;
    final hourOfDay = weatherState.hourOfDay;
    final dayOfNow = weatherState.dayOfNow;

    if (weatherState.isLoading ||
        mainLocation.lat == null ||
        mainLocation.lon == null) {
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
                  initialZoom: 8,
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
                  if (Theme.of(context).brightness == Brightness.dark)
                    ColorFiltered(
                      colorFilter: const ColorFilter.matrix(<double>[
                        -0.2, -0.7, -0.08, 0, 255, // Red channel
                        -0.2, -0.7, -0.08, 0, 255, // Green channel
                        -0.2, -0.7, -0.08, 0, 255, // Blue channel
                        0, 0, 0, 1, 0, // Alpha channel
                      ]),
                      child: _buildMapTileLayer(cacheStore),
                    )
                  else
                    _buildMapTileLayer(cacheStore),
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
                        WeatherCard.fromJson({
                          ...mainWeather.toJson(),
                          ...mainLocation.toJson(),
                        }),
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
                          zoom: 8,
                        ),
                      ),
                      FloatingActionButton(
                        heroTag: null,
                        child: const Icon(IconsaxPlusLinear.search_zoom_out_1),
                        onPressed: () => _animatedMapController.animatedZoomOut(
                          customId: _useTransformer ? _useTransformerId : null,
                        ),
                      ),
                      FloatingActionButton(
                        heroTag: null,
                        child: const Icon(IconsaxPlusLinear.search_zoom_in),
                        onPressed: () => _animatedMapController.animatedZoomIn(
                          customId: _useTransformer ? _useTransformerId : null,
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
