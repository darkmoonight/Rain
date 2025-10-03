import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/app/api/api.dart';
import 'package:rain/app/api/city_api.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/data/db.dart';
import 'package:rain/app/ui/widgets/button.dart';
import 'package:rain/app/ui/widgets/text_form.dart';
import 'package:rain/main.dart';

class PlaceAction extends StatefulWidget {
  const PlaceAction({
    super.key,
    this.latitude,
    this.longitude,
    required this.edit,
    this.card,
  });

  final String? latitude;
  final String? longitude;
  final bool edit;
  final WeatherCard? card;

  @override
  State<PlaceAction> createState() => _PlaceActionState();
}

class _PlaceActionState extends State<PlaceAction>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  final weatherController = Get.put(WeatherController());

  static const kTextFieldElevation = 4.0;

  late TextEditingController _controller;
  late TextEditingController _controllerLat;
  late TextEditingController _controllerLon;
  late TextEditingController _controllerCity;
  late TextEditingController _controllerDistrict;

  late AnimationController _animationController;
  late Animation<double> _animation;

  late final _EditingController controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controllerLat = TextEditingController(text: widget.latitude);
    _controllerLon = TextEditingController(text: widget.longitude);
    _controllerCity = TextEditingController();
    _controllerDistrict = TextEditingController();

    if (widget.edit) {
      _initializeEditMode();
    }

    controller = _EditingController(
      _controllerLat.text,
      _controllerLon.text,
      _controllerCity.text,
      _controllerDistrict.text,
    );

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  void _initializeEditMode() {
    _controllerLat.text = widget.card!.lat.toString();
    _controllerLon.text = widget.card!.lon.toString();
    _controllerCity.text = widget.card!.city!;
    _controllerDistrict.text = widget.card!.district!;
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    _controllerLat.dispose();
    _controllerLon.dispose();
    _controllerCity.dispose();
    _controllerDistrict.dispose();
    controller.dispose();
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

    controller.lat.value = _controllerLat.text;
    controller.lon.value = _controllerLon.text;
    controller.city.value = _controllerCity.text;
    controller.district.value = _controllerDistrict.text;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (controller.canCompose.value) {
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
                    _buildTitleText(),
                    _buildSearchField(),
                    _buildLatitudeField(),
                    _buildLongitudeField(),
                    _buildCityField(),
                    _buildDistrictField(),
                    _buildSubmitButton(),
                  ],
                ),
              ),
              if (isLoading) const Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleText() {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 7),
      child: Text(
        widget.edit ? 'edit'.tr : 'create'.tr,
        style: context.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSearchField() {
    return RawAutocomplete<Result>(
      focusNode: _focusNode,
      textEditingController: _controller,
      fieldViewBuilder:
          (
            BuildContext context,
            TextEditingController fieldTextEditingController,
            FocusNode fieldFocusNode,
            VoidCallback onFieldSubmitted,
          ) {
            return MyTextForm(
              elevation: kTextFieldElevation,
              labelText: 'search'.tr,
              type: TextInputType.text,
              icon: const Icon(IconsaxPlusLinear.global_search),
              controller: _controller,
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              focusNode: _focusNode,
            );
          },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<Result>.empty();
        }
        return WeatherAPI().getCity(textEditingValue.text, locale);
      },
      onSelected: (Result selection) => fillController(selection),
      displayStringForOption: (Result option) =>
          '${option.name}, ${option.admin1}',
      optionsViewBuilder:
          (
            BuildContext context,
            AutocompleteOnSelected<Result> onSelected,
            Iterable<Result> options,
          ) {
            return _buildOptionsView(context, onSelected, options);
          },
    );
  }

  Widget _buildOptionsView(
    BuildContext context,
    AutocompleteOnSelected<Result> onSelected,
    Iterable<Result> options,
  ) {
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
  }

  Widget _buildLatitudeField() {
    return MyTextForm(
      elevation: kTextFieldElevation,
      controller: _controllerLat,
      labelText: 'lat'.tr,
      type: TextInputType.number,
      icon: const Icon(IconsaxPlusLinear.location),
      onChanged: (value) {
        controller.lat.value = value;
        setState(() {});
      },
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      validator: (value) => _validateLatitude(value),
    );
  }

  Widget _buildLongitudeField() {
    return MyTextForm(
      elevation: kTextFieldElevation,
      controller: _controllerLon,
      labelText: 'lon'.tr,
      type: TextInputType.number,
      icon: const Icon(IconsaxPlusLinear.location),
      onChanged: (value) {
        controller.lon.value = value;
        setState(() {});
      },
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      validator: (value) => _validateLongitude(value),
    );
  }

  Widget _buildCityField() {
    return MyTextForm(
      elevation: kTextFieldElevation,
      controller: _controllerCity,
      labelText: 'city'.tr,
      type: TextInputType.name,
      icon: const Icon(IconsaxPlusLinear.building_3),
      onChanged: (value) {
        controller.city.value = value;
        setState(() {});
      },
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      validator: (value) => _validateCity(value),
    );
  }

  Widget _buildDistrictField() {
    return MyTextForm(
      elevation: kTextFieldElevation,
      controller: _controllerDistrict,
      labelText: 'district'.tr,
      type: TextInputType.streetAddress,
      icon: const Icon(IconsaxPlusLinear.global),
      onChanged: (value) {
        controller.district.value = value;
        setState(() {});
      },
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      validator: (value) => _validateDistrict(value),
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SizeTransition(
        sizeFactor: _animation,
        axisAlignment: -1.0,
        child: MyTextButton(
          buttonName: 'done'.tr,
          onPressed: controller.canCompose.value ? _handleSubmit : null,
        ),
      ),
    );
  }

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

  String? _validateDistrict(String? value) {
    if (value == null || value.isEmpty) {
      return 'validateName'.tr;
    }
    return null;
  }

  Future<void> _handleSubmit() async {
    if (formKey.currentState!.validate()) {
      textTrim(_controllerLat);
      textTrim(_controllerLon);
      textTrim(_controllerCity);
      textTrim(_controllerDistrict);

      setState(() => isLoading = true);
      if (widget.edit) {
        await weatherController.updateCardLocation(
          widget.card!,
          double.parse(_controllerLat.text),
          double.parse(_controllerLon.text),
          _controllerCity.text,
          _controllerDistrict.text,
        );
      } else {
        await weatherController.addCardWeather(
          double.parse(_controllerLat.text),
          double.parse(_controllerLon.text),
          _controllerCity.text,
          _controllerDistrict.text,
        );
      }
      setState(() => isLoading = false);
      Get.back();
    }
  }
}

class _EditingController extends ChangeNotifier {
  _EditingController(
    this.initialLat,
    this.initialLon,
    this.initialCity,
    this.initialDistrict,
  ) {
    lat.value = initialLat;
    lon.value = initialLon;
    city.value = initialCity;
    district.value = initialDistrict;

    lat.addListener(_updateCanCompose);
    lon.addListener(_updateCanCompose);
    city.addListener(_updateCanCompose);
    district.addListener(_updateCanCompose);
  }

  final String? initialLat;
  final String? initialLon;
  final String? initialCity;
  final String? initialDistrict;

  final lat = ValueNotifier<String?>(null);
  final lon = ValueNotifier<String?>(null);
  final city = ValueNotifier<String?>(null);
  final district = ValueNotifier<String?>(null);

  final _canCompose = ValueNotifier(false);
  ValueListenable<bool> get canCompose => _canCompose;

  void _updateCanCompose() {
    final hasChanges =
        (lat.value != initialLat) ||
        (lon.value != initialLon) ||
        (city.value != initialCity) ||
        (district.value != initialDistrict);

    final isComplete =
        (lat.value?.isNotEmpty ?? false) &&
        (lon.value?.isNotEmpty ?? false) &&
        (city.value?.isNotEmpty ?? false) &&
        (district.value?.isNotEmpty ?? false);

    _canCompose.value = hasChanges && isComplete;
  }

  @override
  void dispose() {
    lat.removeListener(_updateCanCompose);
    lon.removeListener(_updateCanCompose);
    city.removeListener(_updateCanCompose);
    district.removeListener(_updateCanCompose);
    super.dispose();
  }
}
