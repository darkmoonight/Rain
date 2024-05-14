import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/api/city.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/modules/home.dart';
import 'package:rain/app/widgets/button.dart';
import 'package:rain/app/widgets/text_form.dart';
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
                    Iconsax.arrow_left_1,
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
                                Image.asset(
                                  'assets/icons/Search.png',
                                  scale: 7,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                            icon: const Icon(
                                                Iconsax.global_search),
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
                                            Iconsax.location,
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
                                  icon: const Icon(Iconsax.location),
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
                                  icon: const Icon(Iconsax.location),
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
                                  icon: const Icon(Icons.location_city_rounded),
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
                                  icon: const Icon(Iconsax.global),
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
                                ),
                                const SizedBox(height: 20),
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
