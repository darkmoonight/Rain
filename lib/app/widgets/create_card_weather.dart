import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/api_key.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/widgets/text_form.dart';

class CreateWeatherCard extends StatefulWidget {
  const CreateWeatherCard({super.key});

  @override
  State<CreateWeatherCard> createState() => _CreateWeatherCardState();
}

class _CreateWeatherCardState extends State<CreateWeatherCard> {
  final locale = Get.locale;
  final formKey = GlobalKey<FormState>();
  final locationController = Get.put(LocationController());
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerLat = TextEditingController();
  final TextEditingController _controllerLon = TextEditingController();
  final TextEditingController _controllerCity = TextEditingController();
  final TextEditingController _controllerDistrict = TextEditingController();
  final TextEditingController _controllerTimezone = TextEditingController();

  textTrim(value) {
    value.text = value.text.trim();
    while (value.text.contains("  ")) {
      value.text = value.text.replaceAll("  ", " ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
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
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          textTrim(_controllerCity);
                          textTrim(_controllerDistrict);
                          locationController.addCardWeather(
                            double.parse(_controllerLat.text),
                            double.parse(_controllerLon.text),
                            _controllerCity.text,
                            _controllerDistrict.text,
                            _controllerTimezone.text,
                          );
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
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TypeAheadField(
                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    color: context.theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _controller,
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
                  ),
                  errorBuilder: (context, error) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      height: 45,
                      child: Center(
                        child: Text(
                          'enter_name'.tr,
                          style: context.theme.textTheme.bodyLarge,
                        ),
                      ),
                    );
                  },
                  noItemsFoundBuilder: (context) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      height: 45,
                      child: Center(
                        child: Text(
                          'notFound'.tr,
                          style: context.theme.textTheme.bodyLarge,
                        ),
                      ),
                    );
                  },
                  suggestionsCallback: (query) =>
                      WeatherAPI().getSuggestions(query, locale, apiKey),
                  itemBuilder: (context, suggestion) => ListTile(
                    title: Text(
                      suggestion['state'] == null
                          ? '${suggestion['city']}, ${suggestion['country']}'
                          : suggestion['city'] == null
                              ? '${suggestion['state']}, ${suggestion['country']}'
                              : '${suggestion['city']}, ${suggestion['state']}',
                      style: context.theme.textTheme.bodyLarge,
                    ),
                  ),
                  onSuggestionSelected: (suggestion) async {
                    _controllerLat.text = '${suggestion['lat']}';
                    _controllerLon.text = '${suggestion['lon']}';
                    _controllerCity.text =
                        suggestion['city'] ?? suggestion['state'];
                    _controllerDistrict.text =
                        suggestion['state'] ?? suggestion['country'];
                    _controllerTimezone.text = suggestion['timezone']['name'];
                    _controller.clear();
                    setState(() {});
                  },
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: MyTextForm(
                      controller: _controllerLat,
                      labelText: 'lat'.tr,
                      type: TextInputType.text,
                      icon: const Icon(Iconsax.location),
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      readOnly: true,
                    ),
                  ),
                  Flexible(
                    child: MyTextForm(
                      controller: _controllerLon,
                      labelText: 'lon'.tr,
                      type: TextInputType.text,
                      icon: const Icon(Iconsax.location),
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              MyTextForm(
                controller: _controllerCity,
                labelText: 'city'.tr,
                type: TextInputType.text,
                icon: const Icon(Icons.location_city_rounded),
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                readOnly: false,
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
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                readOnly: false,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
