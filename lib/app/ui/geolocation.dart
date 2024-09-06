import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:latlong2/latlong.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/api/city_api.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/ui/home.dart';
import 'package:rain/app/ui/widgets/button.dart';
import 'package:rain/app/ui/widgets/text_form.dart';
import 'package:rain/main.dart';

class SelectGeolocation extends StatefulWidget {
  const SelectGeolocation({
    super.key,
    required this.isStart,
  });
  final bool isStart;

  @override
  State<SelectGeolocation> createState() => _SelectGeolocationState();
}

class _SelectGeolocationState extends State<SelectGeolocation> {
  bool isLoading = false;
  final formKeySearch = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  final weatherController = Get.put(WeatherController());
  final _controller = TextEditingController();
  final _controllerLat = TextEditingController();
  final _controllerLon = TextEditingController();
  final _controllerCity = TextEditingController();
  final _controllerDistrict = TextEditingController();

  static const colorFilter = ColorFilter.matrix(<double>[
    -0.2, -0.7, -0.08, 0, 255, // Red channel
    -0.2, -0.7, -0.08, 0, 255, // Green channel
    -0.2, -0.7, -0.08, 0, 255, // Blue channel
    0, 0, 0, 1, 0, // Alpha channel
  ]);

  final bool _isDarkMode = Get.theme.brightness == Brightness.dark;

  final mapController = MapController();

  textTrim(value) {
    value.text = value.text.trim();
    while (value.text.contains('  ')) {
      value.text = value.text.replaceAll('  ', ' ');
    }
  }

  void fillController(selection) {
    _controllerLat.text = '${selection.latitude}';
    _controllerLon.text = '${selection.longitude}';
    _controllerCity.text = selection.name;
    _controllerDistrict.text = selection.admin1;
    _controller.clear();
    _focusNode.unfocus();
    setState(() {});
  }

  void fillControllerGeo(location) {
    _controllerLat.text = '${location['lat']}';
    _controllerLon.text = '${location['lon']}';
    _controllerCity.text = location['district'];
    _controllerDistrict.text = location['city'];
    setState(() {});
  }

  void fillMap(double latitude, double longitude) {
    _controllerLat.text = '$latitude';
    _controllerLon.text = '$longitude';
    setState(() {});
  }

  Widget _buildMapTileLayer() {
    return TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.darkmoonight.rain',
    );
  }

  @override
  Widget build(BuildContext context) {
    const kTextFieldElevation = 4.0;
    return Form(
      key: formKeySearch,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          leading: widget.isStart
              ? null
              : IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    IconsaxPlusLinear.arrow_left_3,
                    size: 20,
                  ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
          automaticallyImplyLeading: false,
          title: Text(
            'searchCity'.tr,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
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
                                      horizontal: 10),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    child: SizedBox(
                                      height: Get.size.height * 0.3,
                                      child: FlutterMap(
                                        mapController: mapController,
                                        options: MapOptions(
                                          backgroundColor:
                                              context.theme.colorScheme.surface,
                                          initialCenter: const LatLng(
                                            55.7522,
                                            37.6156,
                                          ),
                                          initialZoom: 3,
                                          interactionOptions:
                                              const InteractionOptions(
                                            flags: InteractiveFlag.all &
                                                ~InteractiveFlag.rotate,
                                          ),
                                          cameraConstraint:
                                              CameraConstraint.contain(
                                            bounds: LatLngBounds(
                                              const LatLng(-90, -180),
                                              const LatLng(90, 180),
                                            ),
                                          ),
                                          onLongPress: (tapPosition, point) =>
                                              fillMap(point.latitude,
                                                  point.longitude),
                                        ),
                                        children: [
                                          if (_isDarkMode)
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
                                                onTap: () => weatherController
                                                    .urlLauncher(
                                                        'https://openstreetmap.org/copyright'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 15, 10, 5),
                                  child: Text(
                                    'searchMethod'.tr,
                                    style: context.theme.textTheme.bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: RawAutocomplete<Result>(
                                        focusNode: _focusNode,
                                        textEditingController: _controller,
                                        fieldViewBuilder: (BuildContext context,
                                            TextEditingController
                                                fieldTextEditingController,
                                            FocusNode fieldFocusNode,
                                            VoidCallback onFieldSubmitted) {
                                          return MyTextForm(
                                            elevation: kTextFieldElevation,
                                            labelText: 'search'.tr,
                                            type: TextInputType.text,
                                            icon: const Icon(IconsaxPlusLinear
                                                .global_search),
                                            controller: _controller,
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10, top: 10),
                                            focusNode: _focusNode,
                                          );
                                        },
                                        optionsBuilder: (TextEditingValue
                                            textEditingValue) {
                                          if (textEditingValue.text.isEmpty) {
                                            return const Iterable<
                                                Result>.empty();
                                          }
                                          return WeatherAPI().getCity(
                                              textEditingValue.text, locale);
                                        },
                                        onSelected: (Result selection) =>
                                            fillController(selection),
                                        displayStringForOption: (Result
                                                option) =>
                                            '${option.name}, ${option.admin1}',
                                        optionsViewBuilder:
                                            (BuildContext context,
                                                AutocompleteOnSelected<Result>
                                                    onSelected,
                                                Iterable<Result> options) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 5,
                                            ),
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                elevation: 4.0,
                                                child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  itemCount: options.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    final Result option =
                                                        options
                                                            .elementAt(index);
                                                    return InkWell(
                                                      onTap: () =>
                                                          onSelected(option),
                                                      child: ListTile(
                                                        title: Text(
                                                          '${option.name}, ${option.admin1}',
                                                          style: context
                                                              .textTheme
                                                              .labelLarge,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Card(
                                      elevation: kTextFieldElevation,
                                      margin: const EdgeInsets.only(
                                        top: 10,
                                        right: 10,
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.all(2.5),
                                        child: IconButton(
                                          onPressed: () async {
                                            bool serviceEnabled =
                                                await Geolocator
                                                    .isLocationServiceEnabled();
                                            if (!serviceEnabled) {
                                              if (!context.mounted) return;
                                              await showAdaptiveDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog.adaptive(
                                                    title: Text(
                                                      'location'.tr,
                                                      style: context
                                                          .textTheme.titleLarge,
                                                    ),
                                                    content: Text(
                                                      'no_location'.tr,
                                                      style: context.textTheme
                                                          .titleMedium,
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Get.back(
                                                                result: false),
                                                        child: Text(
                                                          'cancel'.tr,
                                                          style: context
                                                              .textTheme
                                                              .titleMedium
                                                              ?.copyWith(
                                                            color: Colors
                                                                .blueAccent,
                                                          ),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          Geolocator
                                                              .openLocationSettings();
                                                          Get.back(
                                                              result: true);
                                                        },
                                                        child: Text(
                                                          'settings'.tr,
                                                          style: context
                                                              .textTheme
                                                              .titleMedium
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .green),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              return;
                                            }
                                            setState(() => isLoading = true);
                                            final location =
                                                await weatherController
                                                    .getCurrentLocationSearch();
                                            fillControllerGeo(location);
                                            setState(() => isLoading = false);
                                          },
                                          icon: const Icon(
                                            IconsaxPlusLinear.location,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                MyTextForm(
                                  elevation: kTextFieldElevation,
                                  controller: _controllerLat,
                                  labelText: 'lat'.tr,
                                  type: TextInputType.number,
                                  icon: const Icon(IconsaxPlusLinear.location),
                                  margin: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 10,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'validateValue'.tr;
                                    }
                                    double? numericValue =
                                        double.tryParse(value);
                                    if (numericValue == null) {
                                      return 'validateNumber'.tr;
                                    }
                                    if (numericValue < -90 ||
                                        numericValue > 90) {
                                      return 'validate90'.tr;
                                    }
                                    return null;
                                  },
                                ),
                                MyTextForm(
                                  elevation: kTextFieldElevation,
                                  controller: _controllerLon,
                                  labelText: 'lon'.tr,
                                  type: TextInputType.number,
                                  icon: const Icon(IconsaxPlusLinear.location),
                                  margin: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 10,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'validateValue'.tr;
                                    }
                                    double? numericValue =
                                        double.tryParse(value);
                                    if (numericValue == null) {
                                      return 'validateNumber'.tr;
                                    }
                                    if (numericValue < -180 ||
                                        numericValue > 180) {
                                      return 'validate180'.tr;
                                    }
                                    return null;
                                  },
                                ),
                                MyTextForm(
                                  elevation: kTextFieldElevation,
                                  controller: _controllerCity,
                                  labelText: 'city'.tr,
                                  type: TextInputType.name,
                                  icon:
                                      const Icon(IconsaxPlusLinear.building_3),
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'validateName'.tr;
                                    }
                                    return null;
                                  },
                                ),
                                MyTextForm(
                                  elevation: kTextFieldElevation,
                                  controller: _controllerDistrict,
                                  labelText: 'district'.tr,
                                  type: TextInputType.streetAddress,
                                  icon: const Icon(IconsaxPlusLinear.global),
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
                                ),
                                const Gap(20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: MyTextButton(
                      buttonName: 'done'.tr,
                      onPressed: () async {
                        if (formKeySearch.currentState!.validate()) {
                          textTrim(_controllerLat);
                          textTrim(_controllerLon);
                          textTrim(_controllerCity);
                          textTrim(_controllerDistrict);
                          try {
                            await weatherController.deleteAll(true);
                            await weatherController.getLocation(
                              double.parse(_controllerLat.text),
                              double.parse(_controllerLon.text),
                              _controllerDistrict.text,
                              _controllerCity.text,
                            );
                            widget.isStart
                                ? Get.off(() => const HomePage(),
                                    transition: Transition.downToUp)
                                : Get.back();
                          } catch (error) {
                            Future.error(error);
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
              if (isLoading)
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
