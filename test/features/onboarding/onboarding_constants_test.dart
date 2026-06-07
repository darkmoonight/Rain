import '../../helpers/test_helpers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/features/onboarding/presentation/onboarding_screen.dart';

void main() {
  setUpAll(initTestEnvironment);

  group('OnboardingConstants', () {
    test('getData returns three localized slides', () {
      final slides = OnboardingConstants.getData();

      expect(slides, hasLength(3));
      expect(slides.first.image, 'assets/icons/Rain.png');
      expect(slides.first.title, isNotEmpty);
      expect(slides.first.description, isNotEmpty);
    });

    test('imagesPath prefix is stable', () {
      expect(OnboardingConstants.imagesPath, 'assets/icons/');
    });
  });
}
