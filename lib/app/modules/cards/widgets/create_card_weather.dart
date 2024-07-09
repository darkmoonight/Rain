import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/api/city.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/widgets/text_form.dart';
import 'package:rain/main.dart';

class CreateWeatherCard extends StatefulWidget {
  const CreateWeatherCard({super.key});

  @override
  State<CreateWeatherCard> createState() => _CreateWeatherCardState();
}

class _CreateWeatherCardState extends State<CreateWeatherCard> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    const kTextFieldElevation = 4.0;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Iconsax.close_square,
                              size: 18,
                            ),
                          ),
                          Text(
                            'create'.tr,
                            style: context.textTheme.titleLarge?.copyWith(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          IconButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                textTrim(_controllerLat);
                                textTrim(_controllerLon);
                                textTrim(_controllerCity);
                                textTrim(_controllerDistrict);
                                setState(() => isLoading = true);
                                await weatherController.addCardWeather(
                                  double.parse(_controllerLat.text),
                                  double.parse(_controllerLon.text),
                                  _controllerCity.text,
                                  _controllerDistrict.text,
                                );
                                setState(() => isLoading = false);
                                Get.back();
                              }
                            },
                            icon: const Icon(
                              Iconsax.tick_square,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RawAutocomplete<Result>(
                      focusNode: _focusNode,
                      textEditingController: _controller,
                      fieldViewBuilder: (BuildContext context,
                          TextEditingController fieldTextEditingController,
                          FocusNode fieldFocusNode,
                          VoidCallback onFieldSubmitted) {
                        return MyTextForm(
                          elevation: kTextFieldElevation,
                          labelText: 'search'.tr,
                          type: TextInputType.text,
                          icon: const Icon(Iconsax.global_search),
                          controller: _controller,
                          margin:
                              const EdgeInsets.only(left: 10, right: 10, top: 10),
                          focusNode: _focusNode,
                        );
                      },
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<Result>.empty();
                        }
                        return WeatherAPI()
                            .getCity(textEditingValue.text, locale);
                      },
                      onSelected: (Result selection) => fillController(selection),
                      displayStringForOption: (Result option) =>
                          '${option.name}, ${option.admin1}',
                      optionsViewBuilder: (BuildContext context,
                          AutocompleteOnSelected<Result> onSelected,
                          Iterable<Result> options) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              elevation: 4.0,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final Result option = options.elementAt(index);
                                  return InkWell(
                                    onTap: () => onSelected(option),
                                    child: ListTile(
                                      title: Text(
                                        '${option.name}, ${option.admin1}',
                                        style: context.textTheme.labelLarge,
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
                    MyTextForm(
                      elevation: kTextFieldElevation,
                      controller: _controllerLat,
                      labelText: 'lat'.tr,
                      type: TextInputType.number,
                      icon: const Icon(Iconsax.location),
                      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                      validator: (value) {
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
                      },
                    ),
                    MyTextForm(
                      elevation: kTextFieldElevation,
                      controller: _controllerLon,
                      labelText: 'lon'.tr,
                      type: TextInputType.number,
                      icon: const Icon(Iconsax.location),
                      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                      validator: (value) {
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
                      },
                    ),
                    MyTextForm(
                      elevation: kTextFieldElevation,
                      controller: _controllerCity,
                      labelText: 'city'.tr,
                      type: TextInputType.name,
                      icon: const Icon(Icons.location_city_rounded),
                      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'validateName'.tr;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
