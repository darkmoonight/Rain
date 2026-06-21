# Contributing to Rain

Thank you for helping improve Rain! We welcome bug fixes, tests, docs, and features.

## Code of Conduct

Participation is governed by the [Code of Conduct](CODE_OF_CONDUCT.md). Report issues to [darkmoonight2022@gmail.com](mailto:darkmoonight2022@gmail.com).

## Setup

**Requirements:** Flutter 3.44+, Dart 3.12+ (`pubspec.yaml`)

```bash
git clone https://github.com/darkmoonight/Rain.git && cd Rain
flutter pub get
dart run slang
dart run build_runner build --delete-conflicting-outputs
flutter run                  # gms (default)
flutter run --flavor floss   # FOSS, no Play Services
```

**Project layout:** `lib/features/` — screens and notifiers · `lib/core/` — shared services, theme, navigation · `test/` mirrors `lib/`

**Codegen** (after model or i18n changes):

```bash
dart run slang
dart run tool/validate_i18n.dart --fail-on-english
dart run build_runner build --delete-conflicting-outputs
```

When adding or updating translations, edit `assets/i18n/<locale>.i18n.json`, run `dart run slang`, then `dart run tool/validate_i18n.dart --fail-on-english`. Locale-specific fixes can be applied via `python3 tool/apply_i18n_overrides.py` when using `tool/i18n_overrides.json`.

## Pull requests

1. Fork, branch from `main`, make focused changes.
2. Run checks (below) and add tests when behavior changes.
3. Open a PR with a clear title and short description of *why*.
4. For larger work, check [existing issues](https://github.com/darkmoonight/Rain/issues) first.

**Standards:** match existing style (Riverpod, feature folders), keep diffs small, fix new `flutter analyze` warnings.

## Checks before submit

```bash
flutter analyze
dart format --output=none --set-exit-if-changed .
dart run slang
dart run build_runner build --delete-conflicting-outputs
git diff --exit-code
dart run tool/validate_i18n.dart --fail-on-english
flutter test
```

496 tests in `test/`. If widget tests hang: `flutter test --concurrency=1`.

**Test helpers:** Isar setup in `test/helpers/` · stubbed APIs via `createFakeWeatherRemoteDatasource()` in `test/helpers/fixtures.dart`

## Release builds (maintainers)

Android flavors **`gms`** (Play Store) and **`floss`** (IzzyOnDroid). Scripts in [`scripts/`](scripts/):

```bash
chmod +x scripts/*.sh
./scripts/build_apk.sh gms --target-platform android-arm64
./scripts/build_release_apks.sh   # full release set
```

FOSS reproducible build: see `tool/pubspec_overrides.floss.yaml` and `scripts/patch_jni_reproducible_build.sh`.

## Documentation

- [README.md](README.md) / [README_RU.md](README_RU.md) — user-facing overview (keep short; sync both languages)
- [CHANGELOG.md](CHANGELOG.md) — release notes for maintainers
- [CONTRIBUTING.md](CONTRIBUTING.md) — this file

## Issues

Use templates: [bug report](.github/ISSUE_TEMPLATE/bug_report.md) · [feature request](.github/ISSUE_TEMPLATE/feature_request.md)

Include version, platform, and flavor (`gms` / `floss`) when relevant.

## License

Contributions are licensed under the [MIT License](LICENSE).
