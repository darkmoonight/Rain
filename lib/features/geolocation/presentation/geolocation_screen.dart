import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:latlong2/latlong.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/navigation/app_routes.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/utils/url_launcher_util.dart';
import 'package:go_router/go_router.dart';
import 'package:rain/core/widgets/button.dart';
import 'package:rain/core/widgets/confirmation_dialog.dart';
import 'package:rain/core/widgets/text_form.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/core/utils/show_snack_bar.dart';

class SelectGeolocation extends ConsumerStatefulWidget {
  const SelectGeolocation({super.key, required this.isStart});
  final bool isStart;

  @override
  ConsumerState<SelectGeolocation> createState() => _SelectGeolocationState();
}

class _SelectGeolocationState extends ConsumerState<SelectGeolocation> {
  bool isLoading = false;
  final formKeySearch = GlobalKey<FormState>();
  final _focusNode = FocusNode();

  final _controller = TextEditingController();
  final _controllerLat = TextEditingController();
  final _controllerLon = TextEditingController();
  final _controllerCity = TextEditingController();
  final _controllerDistrict = TextEditingController();

  static final colorFilter = ColorFilter.matrix(
    AppConstants.mapDarkColorFilterMatrix,
  );

  final mapController = MapController();

  void textTrim(TextEditingController value) {
    value.text = value.text.trim();
    while (value.text.contains('  ')) {
      value.text = value.text.replaceAll('  ', ' ');
    }
  }

  void fillController(CitySearchResult selection) {
    _controllerLat.text = '${selection.latitude}';
    _controllerLon.text = '${selection.longitude}';
    _controllerCity.text = selection.name ?? '';
    _controllerDistrict.text = selection.admin1 ?? '';
    _controller.clear();
    _focusNode.unfocus();
  }

  void fillControllerGeo(Map<String, dynamic> location) {
    _controllerLat.text = '${location['lat']}';
    _controllerLon.text = '${location['lon']}';
    _controllerCity.text = location['city'] ?? '';
    _controllerDistrict.text = location['district'] ?? '';
  }

  void fillMap(double latitude, double longitude) {
    _controllerLat.text = '$latitude';
    _controllerLon.text = '$longitude';
  }

  Widget _buildMapTileLayer() => TileLayer(
    urlTemplate: AppConstants.mapTileUrlTemplate,
    userAgentPackageName: AppConstants.mapUserAgentPackageName,
  );

  Widget _buildMap() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.3,
        child: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            backgroundColor: Theme.of(context).colorScheme.surface,
            initialCenter: const LatLng(55.7522, 37.6156),
            initialZoom: 3,
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
            if (isDark)
              ColorFiltered(
                colorFilter: colorFilter,
                child: _buildMapTileLayer(),
              )
            else
              _buildMapTileLayer(),
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

  Widget _buildSearchField() => RawAutocomplete<CitySearchResult>(
    focusNode: _focusNode,
    textEditingController: _controller,
    fieldViewBuilder:
        (
          BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted,
        ) => MyTextForm(
          elevation: AppConstants.mapTextFieldElevation,
          labelText: 'search'.tr,
          type: TextInputType.text,
          icon: const Icon(IconsaxPlusLinear.global_search),
          controller: _controller,
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          focusNode: _focusNode,
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
    onSelected: (CitySearchResult selection) => fillController(selection),
    displayStringForOption: (CitySearchResult option) =>
        '${option.name}, ${option.admin1}',
    optionsViewBuilder:
        (
          BuildContext context,
          AutocompleteOnSelected<CitySearchResult> onSelected,
          Iterable<CitySearchResult> options,
        ) => _buildOptionsView(context, onSelected, options),
  );

  Widget _buildOptionsView(
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
                title: Text(
                  '${option.name}, ${option.admin1}',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            );
          },
        ),
      ),
    ),
  );

  Widget _buildLocationButton() => Card(
    elevation: AppConstants.mapTextFieldElevation,
    margin: const EdgeInsets.only(top: 10, right: 10),
    child: Container(
      margin: const EdgeInsets.all(2.5),
      child: IconButton(
        onPressed: _handleLocationButtonPress,
        icon: const Icon(IconsaxPlusLinear.location),
      ),
    ),
  );

  Future<void> _handleLocationButtonPress() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
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
            .getCurrentLocation();
        if (!mounted) return;
        NavigationHelper.back(context);
        return;
      }
      final place = await ref.read(locationServiceProvider).getCurrentPlace();
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

  Future<void> _showLocationDialog() async {
    await showConfirmationDialog(
      context: context,
      title: 'location'.tr,
      message: 'no_location'.tr,
      icon: IconsaxPlusBold.location,
      confirmText: 'settings'.tr,
      onConfirm: () => Geolocator.openLocationSettings(),
    );
  }

  Widget _buildLatitudeField() => MyTextForm(
    elevation: AppConstants.mapTextFieldElevation,
    controller: _controllerLat,
    labelText: 'lat'.tr,
    type: TextInputType.number,
    icon: const Icon(IconsaxPlusLinear.location),
    margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
    validator: (value) => _validateLatitude(value),
  );

  Widget _buildLongitudeField() => MyTextForm(
    elevation: AppConstants.mapTextFieldElevation,
    controller: _controllerLon,
    labelText: 'lon'.tr,
    type: TextInputType.number,
    icon: const Icon(IconsaxPlusLinear.location),
    margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
    validator: (value) => _validateLongitude(value),
  );

  Widget _buildCityField() => MyTextForm(
    elevation: AppConstants.mapTextFieldElevation,
    controller: _controllerCity,
    labelText: 'city'.tr,
    type: TextInputType.name,
    icon: const Icon(IconsaxPlusLinear.building_3),
    margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
    validator: (value) => _validateCity(value),
  );

  Widget _buildDistrictField() => MyTextForm(
    elevation: AppConstants.mapTextFieldElevation,
    controller: _controllerDistrict,
    labelText: 'district'.tr,
    type: TextInputType.streetAddress,
    icon: const Icon(IconsaxPlusLinear.global),
    margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
  );

  Widget _buildSubmitButton() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    child: MyTextButton(text: 'done'.tr, onPressed: _handleSubmit),
  );

  String? _validateLatitude(String? value) {
    if (value == null || value.isEmpty) {
      return 'validateValue'.tr;
    }
    double? numericValue = double.tryParse(value);
    if (numericValue == null) {
      return 'validateNumber'.tr;
    }
    if (numericValue < -90 || numericValue > 90) {
      return 'validate90'.tr;
    }
    return null;
  }

  String? _validateLongitude(String? value) {
    if (value == null || value.isEmpty) {
      return 'validateValue'.tr;
    }
    double? numericValue = double.tryParse(value);
    if (numericValue == null) {
      return 'validateNumber'.tr;
    }
    if (numericValue < -180 || numericValue > 180) {
      return 'validate180'.tr;
    }
    return null;
  }

  String? _validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'validateName'.tr;
    }
    return null;
  }

  Future<void> _handleSubmit() async {
    if (formKeySearch.currentState!.validate()) {
      textTrim(_controllerLat);
      textTrim(_controllerLon);
      textTrim(_controllerCity);
      textTrim(_controllerDistrict);
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
      }
    }
  }

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
                              _buildLatitudeField(),
                              _buildLongitudeField(),
                              _buildCityField(),
                              _buildDistrictField(),
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

  AppBar _buildAppBar() => AppBar(
    centerTitle: true,
    leading: widget.isStart
        ? null
        : IconButton(
            onPressed: () => NavigationHelper.back(context),
            icon: const Icon(IconsaxPlusLinear.arrow_left_3, size: 20),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
    automaticallyImplyLeading: false,
    title: Text(
      'searchCity'.tr,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
  );
}
