import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/core/navigation/app_routes.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/utils/responsive_utils.dart';

/// One slide in the first-run onboarding carousel.
class OnboardingData {
  final String image;
  final String title;
  final String description;

  const OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}

/// Asset paths and slide content for the onboarding flow.
class OnboardingConstants {
  static const String imagesPath = 'assets/icons/';

  /// Returns localized slides for the onboarding carousel.
  static List<OnboardingData> getData() => [
    OnboardingData(
      image: '${imagesPath}Rain.png',
      title: 'name'.tr,
      description: 'description'.tr,
    ),
    OnboardingData(
      image: '${imagesPath}Design.png',
      title: 'name2'.tr,
      description: 'description2'.tr,
    ),
    OnboardingData(
      image: '${imagesPath}Team.png',
      title: 'name3'.tr,
      description: 'description3'.tr,
    ),
  ];
}

/// First-run carousel that marks onboarding complete and routes to geolocation.
class OnBoarding extends ConsumerStatefulWidget {
  const OnBoarding({super.key});

  /// Creates the mutable state for [OnBoarding].
  @override
  ConsumerState<OnBoarding> createState() => _OnBoardingState();
}

// --- OnBoardingState ---

/// Manages carousel paging, skip, and onboarding completion.
class _OnBoardingState extends ConsumerState<OnBoarding> {
  late final PageController _pageController;
  late final List<OnboardingData> _data;

  int _pageIndex = 0;

  /// Initializes the page controller and onboarding slide data.
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _data = OnboardingConstants.getData();
  }

  /// Disposes the [PageController] when the screen is removed.
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Whether the carousel is on the final onboarding slide.
  bool get _isLastPage => _pageIndex == _data.length - 1;

  /// Marks onboarding complete and navigates to geolocation setup.
  Future<void> _completeOnboarding() async {
    final settings = ref.read(settingsProvider);
    settings.onboard = true;
    await ref.read(settingsRepositoryProvider).save(settings);
    refreshAppRouter(ref);
    if (!mounted) return;
    context.go(AppRoutes.geolocationStart);
  }

  /// Advances the carousel to the next onboarding slide.
  void _goToNextPage() {
    _pageController.nextPage(
      duration: AppConstants.longAnimation,
      curve: Curves.easeInOutCubic,
    );
  }

  /// Builds the onboarding scaffold with carousel, dots, and action button.
  @override
  Widget build(BuildContext context) {
    final padding = ResponsiveUtils.getResponsivePadding(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(padding),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            children: [
              _buildPageView(),
              SizedBox(height: padding * 2),
              _buildDotIndicators(),
              SizedBox(height: padding * 3),
              _buildActionButton(padding),
              SizedBox(height: padding),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the transparent app bar with a skip action before the last slide.
  PreferredSizeWidget _buildAppBar(double padding) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      actions: [
        if (!_isLastPage)
          TextButton.icon(
            onPressed: _completeOnboarding,
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              size: AppConstants.iconSizeSmall,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: Text(
              'skip'.tr,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
              ),
            ),
          ),
        SizedBox(width: padding),
      ],
    );
  }

  /// Builds the swipeable [PageView] of onboarding slides.
  Widget _buildPageView() {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        itemCount: _data.length,
        onPageChanged: (index) => setState(() => _pageIndex = index),
        itemBuilder: (context, index) => OnboardingContent(data: _data[index]),
      ),
    );
  }

  /// Builds the row of [DotIndicator] widgets for carousel progress.
  Widget _buildDotIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _data.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingXS,
          ),
          child: DotIndicator(
            isActive: index == _pageIndex,
            isCompleted: index < _pageIndex,
          ),
        ),
      ),
    );
  }

  /// Builds the primary next or start [FilledButton] for the current slide.
  Widget _buildActionButton(double padding) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: FilledButton(
          onPressed: _isLastPage ? _completeOnboarding : _goToNextPage,
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppConstants.borderRadiusLarge,
              ),
            ),
          ),
          child: Text(
            _isLastPage ? 'start'.tr : 'next'.tr,
            style: TextStyle(
              fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

/// Animated page indicator dot for the onboarding carousel.
class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
    this.isCompleted = false,
  });

  final bool isActive;
  final bool isCompleted;

  /// Builds the animated dot for active, completed, or inactive carousel states.
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedContainer(
      duration: AppConstants.longAnimation,
      curve: Curves.easeInOutCubic,
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: _getDotColor(colorScheme),
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }

  /// Resolves the dot color from [colorScheme] based on carousel position.
  Color _getDotColor(ColorScheme colorScheme) {
    if (isActive) return colorScheme.primary;
    if (isCompleted) return colorScheme.primaryContainer;
    return colorScheme.surfaceContainerHighest;
  }
}

/// Image, title, and description for a single onboarding slide.
class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key, required this.data});

  final OnboardingData data;

  /// Builds the image, title, and description layout for one slide.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = ResponsiveUtils.isMobile(context);
    final padding = ResponsiveUtils.getResponsivePadding(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Image.asset(
            data.image,
            height: isMobile ? 240.0 : 320.0,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: padding * 3),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            children: [
              Text(
                data.title,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: padding * 1.6),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isMobile ? 320.0 : 400.0),
                child: Text(
                  data.description,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
