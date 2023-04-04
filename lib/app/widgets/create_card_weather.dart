import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/api_key.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/api/city.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/widgets/text_form.dart';

class CreateWeatherCard extends StatefulWidget {
  const CreateWeatherCard({super.key});

  @override
  State<CreateWeatherCard> createState() => _CreateWeatherCardState();
}

class _CreateWeatherCardState extends State<CreateWeatherCard> {
  final locale = Get.locale;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final locationController = Get.put(LocationController());
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controllerLat = TextEditingController();
  final TextEditingController _controllerLon = TextEditingController();
  final TextEditingController _controllerCity = TextEditingController();
  final TextEditingController _controllerDistrict = TextEditingController();

  textTrim(value) {
    value.text = value.text.trim();
    while (value.text.contains("  ")) {
      value.text = value.text.replaceAll("  ", " ");
    }
  }

  void fillController(suggestion) {
    _controllerLat.text = '${suggestion.lat.toStringAsFixed(4)}';
    _controllerLon.text = '${suggestion.lon.toStringAsFixed(4)}';
    _controllerCity.text = suggestion.city ?? suggestion.state;
    _controllerDistrict.text = suggestion.state ?? suggestion.country;
    _controller.clear();
    _focusNode.unfocus();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
                    padding: const EdgeInsets.only(top: 10, left: 5, right: 10),
                    child: Row(
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: context.theme.iconTheme.color,
                                  size: 20,
                                ),
                              ),
                              Text(
                                'create'.tr,
                                style: context.theme.textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              textTrim(_controllerLat);
                              textTrim(_controllerLon);
                              textTrim(_controllerCity);
                              textTrim(_controllerDistrict);
                              setState(() => isLoading = true);
                              await locationController.addCardWeather(
                                double.parse(_controllerLat.text),
                                double.parse(_controllerLon.text),
                                _controllerCity.text,
                                _controllerDistrict.text,
                              );
                              setState(() => isLoading = false);
                              Get.back();
                            }
                          },
                          icon: Icon(
                            Icons.save_rounded,
                            color: context.theme.iconTheme.color,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: RawAutocomplete<Result>(
                      focusNode: _focusNode,
                      textEditingController: _controller,
                      fieldViewBuilder: (BuildContext context,
                          TextEditingController fieldTextEditingController,
                          FocusNode fieldFocusNode,
                          VoidCallback onFieldSubmitted) {
                        return TextField(
                          controller: _controller,
                          focusNode: _focusNode,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.global_search),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: context.theme.disabledColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: context.theme.disabledColor,
                              ),
                            ),
                            labelText: 'search'.tr,
                          ),
                        );
                      },
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<Result>.empty();
                        }
                        return WeatherAPI().getSuggestions(
                            textEditingValue.text, locale, apiKey);
                      },
                      onSelected: (Result selection) =>
                          fillController(selection),
                      displayStringForOption: (Result option) =>
                          option.state == null
                              ? '${option.city}, ${option.country}'
                              : option.city == null
                                  ? '${option.state}, ${option.country}'
                                  : '${option.city}, ${option.state}',
                      optionsViewBuilder: (BuildContext context,
                          AutocompleteOnSelected<Result> onSelected,
                          Iterable<Result> options) {
                        return Align(
                          alignment: Alignment.topCenter,
                          child: Material(
                            color: context.theme.colorScheme.primaryContainer,
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
                                      option.state == null
                                          ? '${option.city}, ${option.country}'
                                          : option.city == null
                                              ? '${option.state}, ${option.country}'
                                              : '${option.city}, ${option.state}',
                                      style: context.theme.textTheme.bodyLarge,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  MyTextForm(
                    controller: _controllerLat,
                    labelText: 'lat'.tr,
                    type: TextInputType.text,
                    icon: const Icon(Iconsax.location),
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                    controller: _controllerLon,
                    labelText: 'lon'.tr,
                    type: TextInputType.text,
                    icon: const Icon(Iconsax.location),
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                    controller: _controllerCity,
                    labelText: 'city'.tr,
                    type: TextInputType.text,
                    icon: const Icon(Icons.location_city_rounded),
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'validateName'.tr;
                      }
                      return null;
                    },
                  ),
                  MyTextForm(
                    controller: _controllerDistrict,
                    labelText: 'district'.tr,
                    type: TextInputType.text,
                    icon: const Icon(Iconsax.global),
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
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
    );
  }
}
