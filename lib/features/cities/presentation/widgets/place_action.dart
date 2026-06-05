import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/core/widgets/confirmation_dialog.dart';
import 'package:rain/core/widgets/text_form.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/core/utils/responsive_utils.dart';

class PlaceAction extends ConsumerStatefulWidget {
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
  ConsumerState<PlaceAction> createState() => _PlaceActionState();
}

class _PlaceActionState extends ConsumerState<PlaceAction>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();

  bool _isSaving = false;

  static const kTextFieldElevation = 0.0;

  late final TextEditingController _searchController;
  late final TextEditingController _latController;
  late final TextEditingController _lonController;
  late final TextEditingController _cityController;
  late final TextEditingController _districtController;

  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  late final _EditingController _editingController;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeEditMode();
    _initAnimations();
    _setupEditingController();
  }

  void _initializeControllers() {
    _searchController = TextEditingController();
    _latController = TextEditingController(text: widget.latitude);
    _lonController = TextEditingController(text: widget.longitude);
    _cityController = TextEditingController();
    _districtController = TextEditingController();
  }

  void _initializeEditMode() {
    if (widget.edit && widget.card != null) {
      _latController.text = '${widget.card!.lat}';
      _lonController.text = '${widget.card!.lon}';
      _cityController.text = widget.card!.city ?? '';
      _districtController.text = widget.card!.district ?? '';
    }
  }

  void _initAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: AppConstants.shortAnimation,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  void _setupEditingController() {
    _editingController = _EditingController(
      _latController.text,
      _lonController.text,
      _cityController.text,
      _districtController.text,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _latController.dispose();
    _lonController.dispose();
    _cityController.dispose();
    _districtController.dispose();
    _focusNode.dispose();
    _editingController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _onPopInvoked(bool didPop, dynamic result) async {
    if (didPop) return;

    if (!_editingController.canCompose.value) {
      NavigationHelper.back(context);
      return;
    }

    final shouldPop = await showConfirmationDialog(
      context: context,
      title: 'unsavedChanges'.tr,
      message: 'discardChanges'.tr,
      icon: IconsaxPlusBold.warning_2,
      confirmText: 'discard'.tr,
      isDestructive: true,
    );

    if (shouldPop == true && mounted) {
      NavigationHelper.back(context);
    }
  }

  Future<void> _onSavePressed() async {
    if (!_formKey.currentState!.validate()) return;

    _latController.text = _latController.text.trim();
    _lonController.text = _lonController.text.trim();
    _cityController.text = _cityController.text.trim();
    _districtController.text = _districtController.text.trim();

    setState(() => _isSaving = true);
    await _handleSubmit();
    if (mounted) setState(() => _isSaving = false);
  }

  void fillController(CitySearchResult selection) {
    _latController.text = '${selection.latitude}';
    _lonController.text = '${selection.longitude}';
    _cityController.text = selection.name ?? '';
    _districtController.text = selection.admin1 ?? '';
    _searchController.clear();
    _focusNode.unfocus();

    _editingController.lat.value = _latController.text;
    _editingController.lon.value = _lonController.text;
    _editingController.city.value = _cityController.text;
    _editingController.district.value = _districtController.text;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final padding = ResponsiveUtils.getResponsivePadding(context);
    final isMobile = ResponsiveUtils.isMobile(context);
    final colorScheme = Theme.of(context).colorScheme;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvoked,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: isMobile ? double.infinity : AppConstants.maxModalWidth,
          maxHeight:
              MediaQuery.of(context).size.height * (isMobile ? 0.95 : 0.90),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDragHandle(colorScheme, isMobile),
            _buildHeader(colorScheme, padding),
            Divider(
              height: 1,
              thickness: 1,
              color: colorScheme.outlineVariant.withValues(alpha: 0.5),
            ),
            Flexible(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: _buildForm(context, padding),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDragHandle(ColorScheme colorScheme, bool isMobile) {
    if (!isMobile) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(
        top: AppConstants.spacingM,
        bottom: AppConstants.spacingS,
      ),
      width: 32,
      height: 4,
      decoration: BoxDecoration(
        color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildHeader(ColorScheme colorScheme, double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padding * 1.5,
        vertical: padding,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppConstants.spacingS + 2),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(
                AppConstants.borderRadiusMedium,
              ),
            ),
            child: Icon(
              widget.edit ? IconsaxPlusBold.edit : IconsaxPlusBold.location_add,
              size: AppConstants.iconSizeLarge,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          SizedBox(width: padding * 1.2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.edit ? 'edit'.tr : 'create'.tr,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                    fontSize: ResponsiveUtils.getResponsiveFontSize(
                      context,
                      20,
                    ),
                    letterSpacing: -0.5,
                  ),
                ),
                SizedBox(height: AppConstants.spacingXS),
                Text(
                  widget.edit ? 'editCityHint'.tr : 'createCityHint'.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: ResponsiveUtils.getResponsiveFontSize(
                      context,
                      12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: padding * 0.8),
          _buildSaveButton(colorScheme),
        ],
      ),
    );
  }

  Widget _buildSaveButton(ColorScheme colorScheme) {
    return ValueListenableBuilder<bool>(
      valueListenable: _editingController.canCompose,
      builder: (context, canCompose, _) {
        return AnimatedScale(
          scale: canCompose || _isSaving ? 1.0 : 0.92,
          duration: AppConstants.longAnimation,
          curve: Curves.easeOutCubic,
          child: Material(
            color: canCompose || _isSaving
                ? colorScheme.primary
                : colorScheme.surfaceContainerHigh,
            elevation: canCompose || _isSaving ? AppConstants.elevationLow : 0,
            shadowColor: colorScheme.primary.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(
              AppConstants.borderRadiusXLarge,
            ),
            child: InkWell(
              onTap: (canCompose && !_isSaving) ? _onSavePressed : null,
              borderRadius: BorderRadius.circular(
                AppConstants.borderRadiusXLarge,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: AppConstants.spacingS,
                ),
                child: _isSaving
                    ? SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            colorScheme.onPrimary,
                          ),
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            IconsaxPlusBold.tick_circle,
                            size: AppConstants.iconSizeSmall,
                            color: canCompose
                                ? colorScheme.onPrimary
                                : colorScheme.onSurfaceVariant,
                          ),
                          SizedBox(width: AppConstants.spacingXS + 2),
                          Text(
                            widget.edit ? 'save'.tr : 'done'.tr,
                            style: TextStyle(
                              fontSize: ResponsiveUtils.getResponsiveFontSize(
                                context,
                                13,
                              ),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2,
                              color: canCompose
                                  ? colorScheme.onPrimary
                                  : colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildForm(BuildContext context, double padding) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(padding * 1.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSearchSection(context, padding),
              SizedBox(height: padding * 1.5),
              _buildLocationSection(context, padding),
              SizedBox(height: padding * 1.5),
              _buildInfoSection(context, padding),
              SizedBox(height: padding * 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchSection(BuildContext context, double padding) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          context,
          'search'.tr,
          IconsaxPlusBold.global_search,
        ),
        SizedBox(height: padding),
        RawAutocomplete<CitySearchResult>(
          focusNode: _focusNode,
          textEditingController: _searchController,
          fieldViewBuilder: _buildSearchField,
          optionsBuilder: _buildCityOptions,
          onSelected: fillController,
          displayStringForOption: (CitySearchResult option) =>
              '${option.name}, ${option.admin1}',
          optionsViewBuilder: _buildOptionsView,
        ),
      ],
    );
  }

  Widget _buildSearchField(
    BuildContext context,
    TextEditingController fieldTextEditingController,
    FocusNode fieldFocusNode,
    VoidCallback onFieldSubmitted,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return MyTextForm(
      elevation: kTextFieldElevation,
      labelText: 'searchCity'.tr,
      type: TextInputType.text,
      icon: Icon(IconsaxPlusLinear.global_search, color: colorScheme.primary),
      controller: _searchController,
      focusNode: _focusNode,
      margin: EdgeInsets.zero,
    );
  }

  Future<Iterable<CitySearchResult>> _buildCityOptions(
    TextEditingValue textEditingValue,
  ) {
    if (textEditingValue.text.isEmpty) {
      return Future.value(const Iterable<CitySearchResult>.empty());
    }
    final locale = ref.read(localeProvider);
    return ref
        .read(weatherRemoteDatasourceProvider)
        .searchCities(textEditingValue.text, locale.languageCode);
  }

  Widget _buildOptionsView(
    BuildContext context,
    AutocompleteOnSelected<CitySearchResult> onSelected,
    Iterable<CitySearchResult> options,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(top: AppConstants.spacingXS),
      child: Align(
        alignment: Alignment.topCenter,
        child: Material(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
          elevation: AppConstants.elevationHigh,
          shadowColor: colorScheme.shadow.withValues(alpha: 0.2),
          color: colorScheme.surfaceContainerHigh,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 250),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: AppConstants.spacingXS,
              ),
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (BuildContext context, int index) {
                final CitySearchResult option = options.elementAt(index);
                return InkWell(
                  onTap: () => onSelected(option),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.spacingL,
                      vertical: AppConstants.spacingM,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          IconsaxPlusLinear.location,
                          color: colorScheme.primary,
                          size: AppConstants.iconSizeSmall,
                        ),
                        SizedBox(width: AppConstants.spacingM),
                        Expanded(
                          child: Text(
                            '${option.name}, ${option.admin1}',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
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

  Widget _buildLocationSection(BuildContext context, double padding) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, 'location'.tr, IconsaxPlusBold.location),
        SizedBox(height: padding),
        MyTextForm(
          elevation: kTextFieldElevation,
          controller: _latController,
          labelText: 'lat'.tr,
          type: TextInputType.number,
          icon: Icon(IconsaxPlusLinear.location, color: colorScheme.primary),
          onChanged: (value) => _editingController.lat.value = value,
          validator: _validateLatitude,
          margin: EdgeInsets.zero,
        ),
        SizedBox(height: padding),
        MyTextForm(
          elevation: kTextFieldElevation,
          controller: _lonController,
          labelText: 'lon'.tr,
          type: TextInputType.number,
          icon: Icon(IconsaxPlusLinear.location, color: colorScheme.primary),
          onChanged: (value) => _editingController.lon.value = value,
          validator: _validateLongitude,
          margin: EdgeInsets.zero,
        ),
      ],
    );
  }

  Widget _buildInfoSection(BuildContext context, double padding) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTextForm(
          elevation: kTextFieldElevation,
          controller: _cityController,
          labelText: 'city'.tr,
          type: TextInputType.name,
          icon: Icon(IconsaxPlusLinear.building_3, color: colorScheme.primary),
          onChanged: (value) => _editingController.city.value = value,
          validator: _validateCity,
          margin: EdgeInsets.zero,
        ),
        SizedBox(height: padding),
        MyTextForm(
          elevation: kTextFieldElevation,
          controller: _districtController,
          labelText: 'district'.tr,
          type: TextInputType.streetAddress,
          icon: Icon(IconsaxPlusLinear.global, color: colorScheme.primary),
          onChanged: (value) => _editingController.district.value = value,
          validator: _validateDistrict,
          margin: EdgeInsets.zero,
        ),
      ],
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(
          icon,
          size: AppConstants.iconSizeSmall + 2,
          color: colorScheme.primary,
        ),
        SizedBox(width: AppConstants.spacingS),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
            fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
          ),
        ),
      ],
    );
  }

  String? _validateLatitude(String? value) {
    if (value == null || value.isEmpty) {
      return 'validateValue'.tr;
    }
    final numericValue = double.tryParse(value);
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
    final numericValue = double.tryParse(value);
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
    if (_formKey.currentState!.validate()) {
      try {
        if (widget.edit) {
          await ref
              .read(citiesNotifierProvider.notifier)
              .updateCardLocation(
                widget.card!,
                double.parse(_latController.text),
                double.parse(_lonController.text),
                _cityController.text,
                _districtController.text,
              );
        } else {
          await ref
              .read(citiesNotifierProvider.notifier)
              .addCard(
                double.parse(_latController.text),
                double.parse(_lonController.text),
                _cityController.text,
                _districtController.text,
              );
        }
        if (mounted) NavigationHelper.back(context);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('error_occurred'.tr)));
        }
        rethrow;
      }
    }
  }
}

class _EditingController extends ChangeNotifier {
  _EditingController(
    this._initialLat,
    this._initialLon,
    this._initialCity,
    this._initialDistrict,
  ) {
    lat.value = _initialLat;
    lon.value = _initialLon;
    city.value = _initialCity;
    district.value = _initialDistrict;

    lat.addListener(_updateCanCompose);
    lon.addListener(_updateCanCompose);
    city.addListener(_updateCanCompose);
    district.addListener(_updateCanCompose);
  }

  final String _initialLat;
  final String _initialLon;
  final String _initialCity;
  final String _initialDistrict;

  final ValueNotifier<String> lat = ValueNotifier<String>('');
  final ValueNotifier<String> lon = ValueNotifier<String>('');
  final ValueNotifier<String> city = ValueNotifier<String>('');
  final ValueNotifier<String> district = ValueNotifier<String>('');

  final _canCompose = ValueNotifier<bool>(false);
  ValueListenable<bool> get canCompose => _canCompose;

  void _updateCanCompose() {
    final hasChanges =
        lat.value != _initialLat ||
        lon.value != _initialLon ||
        city.value != _initialCity ||
        district.value != _initialDistrict;

    final isComplete =
        lat.value.isNotEmpty &&
        lon.value.isNotEmpty &&
        city.value.isNotEmpty &&
        district.value.isNotEmpty;

    _canCompose.value = hasChanges && isComplete;
  }

  @override
  void dispose() {
    lat.removeListener(_updateCanCompose);
    lon.removeListener(_updateCanCompose);
    city.removeListener(_updateCanCompose);
    district.removeListener(_updateCanCompose);
    lat.dispose();
    lon.dispose();
    city.dispose();
    district.dispose();
    super.dispose();
  }
}
