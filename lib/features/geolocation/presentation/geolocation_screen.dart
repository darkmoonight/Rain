import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:latlong2/latlong.dart';
import 'package:rain/core/utils/place_form_helpers.dart';
import 'package:rain/core/widgets/city_search_field.dart';
import 'package:rain/core/widgets/map_tiles.dart';
import 'package:rain/core/widgets/place_form_fields.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/navigation/app_routes.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/utils/url_launcher_util.dart';
import 'package:go_router/go_router.dart';
import 'package:rain/core/theme/theme_text.dart';
import 'package:rain/core/widgets/app_back_button.dart';
import 'package:rain/core/widgets/button.dart';
import 'package:rain/core/widgets/confirmation_dialog.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/core/utils/show_snack_bar.dart';

/// Onboarding or in-app screen for choosing the primary weather location.
class SelectGeolocation extends ConsumerStatefulWidget {
  const SelectGeolocation({super.key, required this.isStart});

  /// Whether the screen is shown during first-run onboarding ([true]) or in-app ([false]).
  final bool isStart;

  @override
  ConsumerState<SelectGeolocation> createState() => _SelectGeolocationState();
}

/// Form, map, and search UI for selecting or editing the primary location.
class _SelectGeolocationState extends ConsumerState<SelectGeolocation> {
  bool isLoading = false;
  bool _isSubmitting = false;
  final formKeySearch = GlobalKey<FormState>();
  final _focusNode = FocusNode();

  final _controller = TextEditingController();
  final _controllerLat = TextEditingController();
  final _controllerLon = TextEditingController();
  final _controllerCity = TextEditingController();
  final _controllerDistrict = TextEditingController();

  final mapController = MapController();

  /// Fills coordinate and label fields from a [CitySearchResult].
  void fillController(CitySearchResult selection) {
    fillPlaceControllers(
      selection: selection,
      latitude: _controllerLat,
      longitude: _controllerLon,
      city: _controllerCity,
      district: _controllerDistrict,
      search: _controller,
      focusNode: _focusNode,
    );
  }

  /// Fills coordinate and label fields from a geolocation [location] map.
  void fillControllerGeo(Map<String, dynamic> location) {
    _controllerLat.text = '${location['lat']}';
    _controllerLon.text = '${location['lon']}';
    _controllerCity.text = location['city'] ?? '';
    _controllerDistrict.text = location['district'] ?? '';
  }

  /// Updates latitude and longitude fields from map coordinates.
  void fillMap(double latitude, double longitude) {
    _controllerLat.text = '$latitude';
    _controllerLon.text = '$longitude';
  }

  /// Builds the interactive [FlutterMap] with dark-mode tile filtering.
  Widget _buildMap() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppConstants.mapBorderRadius),
      ),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * AppConstants.mapHeight,
        child: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            backgroundColor: Theme.of(context).colorScheme.surface,
            initialCenter: const LatLng(
              AppConstants.mapInitialCenterLat,
              AppConstants.mapInitialCenterLon,
            ),
            initialZoom: AppConstants.mapInitialZoom,
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
            ),
            cameraConstraint: CameraConstraint.contain(
              bounds: LatLngBounds(
                const LatLng(-90, -180),
                const LatLng(90, 180),
              ),
            ),
            onLongPress: (tapPosition, point) =>
                fillMap(point.latitude, point.longitude),
          ),
          children: [
            buildRainMapDarkModeFilter(
              isDark: isDark,
              child: buildRainMapTileLayer(),
            ),
            RichAttributionWidget(
              animationConfig: const ScaleRAWA(),
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () => openUrl(AppConstants.openStreetMapCopyrightUrl),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the city search field.
  Widget _buildSearchField() => CitySearchField(
    controller: _controller,
    focusNode: _focusNode,
    elevation: AppConstants.mapTextFieldElevation,
    icon: const Icon(IconsaxPlusLinear.global_search),
    margin: const EdgeInsets.only(
      left: AppConstants.cardPaddingHorizontal,
      right: AppConstants.cardPaddingHorizontal,
      top: AppConstants.cardPaddingHorizontal,
    ),
    optionsStyle: CitySearchOptionsStyle.paddedCard,
    optionsPadding: const EdgeInsets.symmetric(
      horizontal: AppConstants.cardPaddingHorizontal,
      vertical: AppConstants.cardPaddingVertical,
    ),
    onSelected: fillController,
  );

  /// Builds the current-location [IconButton] beside the search field.
  Widget _buildLocationButton() => Card(
    elevation: AppConstants.mapTextFieldElevation,
    margin: const EdgeInsets.only(
      top: AppConstants.cardPaddingHorizontal,
      right: AppConstants.cardPaddingHorizontal,
    ),
    child: Container(
      margin: const EdgeInsets.all(2.5),
      child: IconButton(
        onPressed: _handleLocationButtonPress,
        icon: const Icon(IconsaxPlusLinear.location),
      ),
    ),
  );

  /// Resolves device location or refreshes the main weather location.
  Future<void> _handleLocationButtonPress() async {
    final serviceEnabled = await ref
        .read(locationServiceProvider)
        .isServiceEnabled();
    if (!serviceEnabled) {
      if (!context.mounted) return;
      await _showLocationDialog();
      return;
    }
    setState(() => isLoading = true);
    try {
      if (ref.read(settingsProvider).location && !widget.isStart) {
        await ref
            .read(mainWeatherNotifierProvider.notifier)
            .getCurrentLocation(forceLoading: true);
        if (!mounted) return;
        NavigationHelper.back(context);
        return;
      }
      final place = await ref
          .read(locationServiceProvider)
          .getCurrentPlace(
            resolveLabels: (lat, lon) => ref
                .read(weatherRemoteDatasourceProvider)
                .reverseGeocode(
                  lat,
                  lon,
                  languageCode: ref.read(localeProvider).languageCode,
                ),
          );
      if (place == null) {
        if (mounted) showSnackBar('location_not_found'.tr, isError: true);
        return;
      }
      fillControllerGeo({
        'lat': place.lat,
        'lon': place.lon,
        'city': place.city,
        'district': place.district,
      });
    } catch (_) {
      if (mounted) showSnackBar('no_location'.tr, isError: true);
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  /// Shows a dialog prompting the user to enable location services.
  Future<void> _showLocationDialog() async {
    await showConfirmationDialog(
      context: context,
      title: 'location',
      message: 'no_location',
      icon: IconsaxPlusBold.location,
      confirmText: 'settings'.tr,
      onConfirm: () => ref.read(locationServiceProvider).openLocationSettings(),
    );
  }

  /// Builds the submit [MyTextButton] that saves the selected location.
  Widget _buildSubmitButton() => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: AppConstants.cardPaddingHorizontal,
      vertical: AppConstants.spacingS,
    ),
    child: MyTextButton(
      text: 'done'.tr,
      isLoading: _isSubmitting,
      onPressed: _handleSubmit,
    ),
  );

  /// Validates the form and persists the chosen location as primary weather.
  Future<void> _handleSubmit() async {
    if (_isSubmitting) return;
    if (!formKeySearch.currentState!.validate()) return;

    trimPlaceController(_controllerLat);
    trimPlaceController(_controllerLon);
    trimPlaceController(_controllerCity);
    trimPlaceController(_controllerDistrict);
    setState(() => _isSubmitting = true);
    try {
      await ref.read(mainWeatherNotifierProvider.notifier).deleteAll(true);
      await ref
          .read(mainWeatherNotifierProvider.notifier)
          .getLocation(
            double.parse(_controllerLat.text),
            double.parse(_controllerLon.text),
            _controllerDistrict.text,
            _controllerCity.text,
          );
      if (!mounted) return;
      if (widget.isStart) {
        context.go(AppRoutes.home);
      } else {
        NavigationHelper.back(context);
      }
    } catch (error) {
      if (mounted) {
        showSnackBar('error_occurred'.tr, isError: true);
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  /// Builds the location picker scaffold with map, fields, and loading overlay.
  @override
  Widget build(BuildContext context) => Form(
    key: formKeySearch,
    child: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: _buildMap(),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  10,
                                  15,
                                  10,
                                  5,
                                ),
                                child: Text(
                                  'searchMethod'.tr,
                                  style: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Row(
                                children: [
                                  Flexible(child: _buildSearchField()),
                                  _buildLocationButton(),
                                ],
                              ),
                              PlaceFormFields(
                                latitudeController: _controllerLat,
                                longitudeController: _controllerLon,
                                cityController: _controllerCity,
                                districtController: _controllerDistrict,
                              ),
                              const Gap(20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildSubmitButton(),
              ],
            ),
            if (isLoading)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                child: const Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    ),
  );

  /// Builds the app bar with optional back navigation for in-app entry.
  AppBar _buildAppBar() => AppBar(
    centerTitle: true,
    leading: widget.isStart ? null : const AppBackButton(),
    automaticallyImplyLeading: false,
    title: Text(
      'searchCity'.tr,
      style: ThemeText.appBarTitle(Theme.of(context)),
    ),
  );
}
