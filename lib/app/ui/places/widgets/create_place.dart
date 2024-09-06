import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/api/city_api.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/ui/widgets/button.dart';
import 'package:rain/app/ui/widgets/text_form.dart';
import 'package:rain/main.dart';

class CreatePlace extends StatefulWidget {
  const CreatePlace({
    super.key,
    this.latitude,
    this.longitude,
  });
  final String? latitude;
  final String? longitude;

  @override
  State<CreatePlace> createState() => _CreatePlaceState();
}

class _CreatePlaceState extends State<CreatePlace>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  final weatherController = Get.put(WeatherController());
  late final TextEditingController _controller = TextEditingController();
  late TextEditingController _controllerLat = TextEditingController();
  late TextEditingController _controllerLon = TextEditingController();
  late final TextEditingController _controllerCity = TextEditingController();
  late final TextEditingController _controllerDistrict =
      TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    if (widget.latitude != null && widget.longitude != null) {
      _controllerLat = TextEditingController(text: widget.latitude);
      _controllerLon = TextEditingController(text: widget.longitude);
    }
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    _controllerLat.dispose();
    _controllerLon.dispose();
    _controllerCity.dispose();
    _controllerDistrict.dispose();
    super.dispose();
  }

  void textTrim(TextEditingController value) {
    value.text = value.text.trim();
    while (value.text.contains('  ')) {
      value.text = value.text.replaceAll('  ', ' ');
    }
  }

  void fillController(Result selection) {
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
    bool showButton = _controllerLon.text.isNotEmpty &&
        _controllerLat.text.isNotEmpty &&
        _controllerCity.text.isNotEmpty &&
        _controllerDistrict.text.isNotEmpty;

    if (showButton) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

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
                      padding: const EdgeInsets.only(top: 14, bottom: 7),
                      child: Text(
                        'create'.tr,
                        style: context.textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
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
                          icon: const Icon(IconsaxPlusLinear.global_search),
                          controller: _controller,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
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
                      onSelected: (Result selection) =>
                          fillController(selection),
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
                                  final Result option =
                                      options.elementAt(index);
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
                      icon: const Icon(IconsaxPlusLinear.location),
                      onChanged: (value) => setState(() {}),
                      margin:
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
                      elevation: kTextFieldElevation,
                      controller: _controllerLon,
                      labelText: 'lon'.tr,
                      type: TextInputType.number,
                      icon: const Icon(IconsaxPlusLinear.location),
                      onChanged: (value) => setState(() {}),
                      margin:
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
                      elevation: kTextFieldElevation,
                      controller: _controllerCity,
                      labelText: 'city'.tr,
                      type: TextInputType.name,
                      icon: const Icon(IconsaxPlusLinear.building_3),
                      onChanged: (value) => setState(() {}),
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                      onChanged: (value) => setState(() {}),
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'validateName'.tr;
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SizeTransition(
                        sizeFactor: _animation,
                        axisAlignment: -1.0,
                        child: MyTextButton(
                          buttonName: 'done'.tr,
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
                        ),
                      ),
                    ),
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
