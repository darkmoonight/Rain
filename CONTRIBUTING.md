# Contribution Guidelines

Thank you for considering contributing to Rain! We welcome bug fixes, tests, documentation updates, and new features. Please read this guide before opening a pull request.

## Code of Conduct

This project and everyone participating in it are governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to [darkmoonight2022@gmail.com](mailto:darkmoonight2022@gmail.com).

## Getting Started

1. Fork the repository and clone it locally.
2. Install [Flutter SDK 3.44+](https://docs.flutter.dev/get-started/install) and [Dart 3.12+](https://dart.dev/get-dart) (see `pubspec.yaml`).
3. Set up the project:

```bash
flutter pub get
dart run slang
dart run build_runner build --delete-conflicting-outputs
```

4. Run the app: `flutter run` (Android default flavor is `gms`; use `flutter run --flavor floss` for the FOSS build).

See [README.md](README.md) (English) or [README_RU.md](README_RU.md) (Русский) for build flavors, APK scripts, and reproducible FOSS builds.

## How to Contribute

1. Create a new branch for your feature or bug fix.
2. Make your changes and commit them with a clear message.
3. Push your changes to your fork on GitHub.
4. Open a pull request against `main` with a descriptive title and summary of what changed and why.

Before starting work on a larger change, check the [issue tracker](https://github.com/darkmoonight/Rain/issues) for related discussions.

## Coding Standards

- Follow the existing code style and architecture (Riverpod, feature folders under `lib/features/`, shared code under `lib/core/`).
- Keep diffs focused; avoid unrelated refactors in the same PR.
- Run `flutter analyze` and fix any new warnings before submitting.

## Testing

Ensure your changes do not break existing functionality. Add or update tests for new behavior and bug fixes when practical.

The project currently has **368** tests in **100** `*_test.dart` files. Before opening a pull request, run:

```bash
flutter pub get
flutter analyze
flutter test
```

Tips:

- If widget tests hang, use `flutter test --concurrency=1`.
- Widget tests that hit city search or forecast APIs should use `createFakeWeatherRemoteDatasource()` from `test/helpers/fixtures.dart`.
- Database tests rely on the Isar bootstrap in `test/helpers/`.
- Optional local coverage: `flutter test --coverage` (output in `coverage/`, gitignored).

## Documentation

Update documentation when your changes affect setup, behavior, or contributor workflow:

- [README.md](README.md) and [README_RU.md](README_RU.md) — user-facing features, build steps, testing
- [CONTRIBUTING.md](CONTRIBUTING.md) — contributor workflow (this file)
- Issue templates under [`.github/ISSUE_TEMPLATE/`](.github/ISSUE_TEMPLATE/) — when bug/feature reporting fields should change

Keep English and Russian README sections in sync when you edit both.

## Issues

Use the GitHub issue templates when reporting bugs or requesting features:

- [Bug report](.github/ISSUE_TEMPLATE/bug_report.md)
- [Feature request](.github/ISSUE_TEMPLATE/feature_request.md)

Include app version, platform, and build variant (`gms` / `floss`) when relevant.

## License

By contributing, you agree that your contributions will be licensed under the project's [MIT License](LICENSE).

Thank you for your contribution!
