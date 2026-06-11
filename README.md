<div align='center'>
    <img src='/readme/icon.png' width='150'/>
    <h1>🌦️ Rain</h1>
    <p><strong>A beautiful, feature-rich weather application built with Flutter</strong></p>
</div>

<p align='center'>
    <a href='README.md'>English</a> • <a href='README_RU.md'>Русский</a>
</p>

<p align='center'>
    <a href='https://github.com/darkmoonight/Rain/stargazers'><img alt='Stars' src='https://img.shields.io/github/stars/darkmoonight/Rain?color=ABACD3'/></a>
    <a href='https://github.com/darkmoonight/Rain/forks'><img alt='Forks' src='https://img.shields.io/github/forks/darkmoonight/Rain?color=ABACD3'/></a>
    <a href='https://github.com/darkmoonight/Rain/releases/latest'><img alt='Downloads' src='https://img.shields.io/github/downloads/darkmoonight/Rain/total?color=ABACD3&logo=github&logoColor=white'/></a>
    <a href='https://play.google.com/store/apps/details?id=com.yoshi.rain'><img alt='Play Store Installs' src='https://img.shields.io/endpoint?color=ABACD3&logo=google-play&logoColor=white&url=https%3A%2F%2Fplay.cuzi.workers.dev%2Fplay%3Fi%3Dcom.yoshi.rain%26l%3DInstalls%26m%3D%24installs'/></a>
    <a href='https://github.com/darkmoonight/Rain/releases'><img alt='GitHub release' src='https://img.shields.io/github/v/release/darkmoonight/Rain?color=ABACD3&logo=flutter&logoColor=white'/></a>
    <a href='https://github.com/darkmoonight/Rain/blob/main/LICENSE'><img alt='License' src='https://img.shields.io/github/license/darkmoonight/Rain?color=ABACD3&logo=open-source-initiative&logoColor=white'/></a>
</p>

<p align='center'>
    Tired of unpredictable weather? Rain keeps you prepared with accurate forecasts, interactive maps, and beautiful design. 🌦️📱🗺️
</p>

<p align='center'>
    <strong>🌍 Available in 38 languages</strong> • <strong>🎨 Material You & AMOLED</strong> • <strong>💨 Air quality (EU/US AQI)</strong> • <strong>🗺️ Interactive weather map</strong> • <strong>📱 Home screen widgets</strong>
</p>

---

## ✨ Features

**🌡️ Comprehensive Weather Data**
- Real-time conditions with feels-like temperature • Hourly forecasts (12 days) • 12-day daily outlooks
- **Last updated** time on the Now card (when weather was fetched or loaded from cache)
- Today's row in the daily outlook uses the **current hourly** condition (matches the detail view)
- Location-aware time: forecast slots use each place's Open-Meteo timezone and UTC offset; HTTP `Date` skew corrects a wrong device clock
- Detailed metrics: UV index, humidity, wind speed/direction, precipitation, visibility, pressure, dew point
- **Metric help:** tap a cell to toggle its short label; **long-press** for a themed tooltip with a fuller explanation (hourly and daily detail grids)
- Day/night-aware weather icons • Sunrise/sunset times • Expandable hourly variable details
- Home daily preview uses compact forecast icons; the **12-day list** uses large classic weather artwork

**💨 Air Quality**
- Hourly air quality from [Open-Meteo Air Quality API](https://open-meteo.com/en/docs/air-quality-api) (7-day forecast, aligned to weather timestamps)
- Summary card on the main weather screen and **daily forecast detail** (updates with the selected hour): AQI value, severity badge, colored scale, health advice
- **Long-press** the AQI card for a full tooltip — standard, index, how Open-Meteo derives it, all pollutant levels, and health advice
- Collapsible **Pollutants** section with expand animation and per-pollutant progress bars: PM2.5, PM10, O₃, NO₂, SO₂, CO (μg/m³)
- Choose **European AQI** or **US AQI** in Settings • Cached offline with weather data

**🗺️ Interactive Weather Map**
- OpenStreetMap-based interactive map • Weather markers for all saved cities
- Tap markers for quick weather preview • Long-press to add new locations
- Visual city selection with GPS support • Map tile caching (30 days) • Dark mode styling

**🏙️ Multi-City Management**
- Save unlimited cities to your watchlist • Drag-to-reorder • Pull-to-refresh all • Shimmer placeholders while cities load
- Live local wall clock on each city card • Correct offsets between cities even when the device clock is off
- City search with autocomplete • Manual coordinate entry • GPS auto-detection
- Edit or remove saved cities • Timezone from the weather API for each location

**🔔 Smart Notifications**
- Scheduled weather forecasts (1-5 hour intervals) • Custom time window (start/end)
- **Persistent notification (Android):** optional ongoing status-bar tile with current temperature and conditions
- Weather-condition-specific icons • Silent notifications (no sound/vibration)
- Automatic cancellation when disabled • Background scheduling

**📱 Home Screen Widgets (Android)**
- Three Material You widgets — pin any from Settings → Widget (home screen and lock screen):
  - **Compact (1×1)** — weather icon and temperature, fixed size
  - **Current (2×2)** — resizable card with temperature on top and weather icon at bottom-left
  - **Clock (4×1 bar)** — live clock and date, weather icon, city name and temperature; horizontally resizable
- Respects app **Celsius/Fahrenheit**, **rounded temperature**, and **12h/24h** time format (Clock widget)
- Background refresh (Workmanager, ~15 min minimum): fetches stale main weather when online, then pushes widget data • Custom background and text colors (HSV picker)
- Updates when the app loads cached weather, after fresh fetches, when returning to the app, and from the periodic background task (no background GPS required — uses saved location from cache)

**🎨 Beautiful Design**
- Material You dynamic theming (wallpaper colors) • Pure AMOLED black theme
- Light/Dark/System modes • Large element mode toggle • Edge-to-edge display
- **App font** picker (Appearance): Ubuntu (default), system, Roboto, Barlow Condensed, Inter, Open Sans via Google Fonts
- Smooth animations • Shimmer loading states • **No ripple or press highlight** on tappable controls (clean, flat interaction)

**🌍 Extensive Localization**
- 38 languages including: English, Русский, 中文, العربية, हिन्दी, Español, Français, Deutsch, Português, 한국어, 日本語, Türkçe, and many more
- Regional preferences • 12h/24h time format support

**🧮 Customization Options**
- Temperature: Celsius/Fahrenheit • Measurement system: Metric/Imperial
- Wind speed: kph/m/s • Pressure: hPa/mmHg • Rounded temperatures (app + widget)
- Air quality standard: European AQI / US AQI
- 12h/24h time format (app, pickers, notifications, and Clock widget)
- Widget color customization with HSV color picker • App font in Appearance

---

## 📸 Screenshots

<img src='/readme/1.png' width='200'/> <img src='/readme/2.png' width='200'/> <img src='/readme/3.png' width='200'/> <img src='/readme/4.png' width='200'/> <img src='/readme/5.png' width='200'/> <img src='/readme/6.png' width='200'/> <img src='/readme/7.png' width='200'/> <img src='/readme/8.png' width='200'/>

---

## 📥 Download

### Android
[![Play Store](https://img.shields.io/badge/Google_Play-414141?style=for-the-badge&logo=google-play&logoColor=white)](https://play.google.com/store/apps/details?id=com.yoshi.rain)
[![IzzyOnDroid](https://img.shields.io/endpoint?url=https://apt.izzysoft.de/fdroid/api/v1/shield/com.yoshi.rain&style=for-the-badge&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAMAAABg3Am1AAAA4VBMVEXn9cuv7wDB9iGp4x2k5gKh3B6k3SyAxAGd4ASo6gCv5SCW2gHA7UTB6V+EwiOw3lK36zC+422d1yO78SWs3kfR7JhQiw2751G7+QCz8gCKzgGq3zay5DSm2jrF9jZLfwmNyiC77zXO7oaYzjW37CLj9Lze8LLA43uz3mK19ACR1QBcnRO78R6ExBek1kbE8FLI6nSPu0jH5YJxtQ2b1RiAmz53uwF7pitZkAeX1w7I72TY8KTO8HXD7La+0pKizWBzhExqjytpmR+UzSTA5Ctzy3uv1nOv3gyF3UuCsDRHcEx7M2pHAAAAS3RSTlP//////////////////////////////////////////////////////////////////////////////////////////////////wDLGfCsAAAB9ElEQVRIx72W53biMBCFhY0L7g0bTAktQEwgdMhuerbO+z/Q2sBiY0uKcvacnX8a3Y/R8YyuQPDJQP8KoExcro6ZC6C4TQXQx/oLABV3cfozgBgL/AWY9ScAsR7oBCD2AmSAoD8A+J3cWYECdBEaVm2z+U1hAuDx4fr6a08PGuuf6cmys5QvMEz0c12zhPWaAYBq9emp9/DlTrMUXsBOaw5Yjl5elrG+u9tYAxbAtjeL+Z3Wdl83Ovfr3BQyYAZBoLXbHDfQ2hykTSEAAIu+2LRcl4tD6UCm67jPCvD4/ON5YRhGpzOdrlar74fT5IcvOxDD0Xg0nvU7hjGVttv+0vYyAgyQdNgeey3Hce5DSZqN9GZmvzh8UO0F3thsiY4gqGoUtuL2AeaKpom5brVMryEKvCyXZVX0urd0wOxy4qwh8jxfLlcqZafpYoH0MzQGnNI/6CulOASFc/NWlZ17ADEG3oWjvn5TEvjbfJuyrnFaSfdyrK/f1Gp1tTAHF750aqgUJUCsr5UizFUv3EeQwmOFekmVmABDCiNVlqNwOwEqcM75vp+s/asrKpAmdxM/Gbnfuz0j8OYnPw2v9AqZ5Nt+f7hikwkw2T3Fc2l2jzdcst3DpwGCnvQ+EPUEu8c/STSAqMfZPeX5IQK0J+a//zn5MP4Am7ISN/4mSV8AAAAASUVORK5CYII=)](https://apt.izzysoft.de/packages/com.yoshi.rain)

### Other Platforms
Get the latest APK or builds for other platforms from the [Releases Section](https://github.com/darkmoonight/Rain/releases/latest).

---

## 🛠️ Building from Source

### Prerequisites
- Flutter SDK **3.44** or higher (see `pubspec.yaml`)
- Dart SDK **3.12** or higher
- Android Studio / Xcode for platform-specific builds

### Steps
```bash
# Clone the repository
git clone https://github.com/darkmoonight/Rain.git
cd Rain

# Install dependencies
flutter pub get

# Generate code (Isar, Freezed, JSON, translations)
dart run slang
dart run build_runner build --delete-conflicting-outputs

# Run the app (Android uses flavor gms by default; see pubspec `default-flavor`)
flutter run
# floss on device/emulator: flutter run --flavor floss

# Build for production
flutter build appbundle --release  # Android App Bundle (Play Store)
flutter build ios --release        # iOS
```

### Android APK

Gradle flavors **`gms`** (default, Play Store deps) and **`floss`** (no Play Services, IzzyOnDroid). Output names match [GitHub Releases](https://github.com/darkmoonight/Rain/releases).

| Variant | Files |
|---------|--------|
| **gms** | `rain-release-gms.apk`, `rain-arm64-v8a-release-gms.apk`, `rain-armeabi-v7a-release-gms.apk`, `rain-x86_64-release-gms.apk` |
| **floss** | `rain-release-floss.apk`, `rain-arm64-v8a-release-floss.apk`, `rain-armeabi-v7a-release-floss.apk`, `rain-x86_64-release-floss.apk` |

All APKs land in `build/app/outputs/flutter-apk/` after `./scripts/rename_apk_outputs.sh`.

#### Single APK (one ABI)

```bash
chmod +x scripts/*.sh

./scripts/build_apk.sh gms --target-platform android-arm64
./scripts/build_apk.sh floss --target-platform android-arm64
```

#### Full release set (8 APKs, both variants)

Per variant: first **split APKs** (`--split-per-abi`), then **universal** (no extra flags). Four builds total:

```bash
./scripts/build_release_apks.sh
```

Runs four builds and then `./scripts/restore_pub_default.sh` (FOSS overrides must not stay in `pubspec.lock` for normal dev).

Same steps manually:

```bash
./scripts/build_apk.sh gms --split-per-abi
./scripts/build_apk.sh gms

./scripts/build_apk.sh floss --split-per-abi
./scripts/build_apk.sh floss

./scripts/restore_pub_default.sh
```

#### Manual FOSS build (e.g. reproducible / IzzyOnDroid)

`pubspec_overrides.yaml` must exist **before** `flutter pub get`. After `pub get`, patch the `jni` package so `libdartjni.so` is reproducible (same step as [IzzyOnDroid RB](https://izzyondroid.org/about/security/ReproducibleBuilds/)):

```bash
cp tool/pubspec_overrides.floss.yaml pubspec_overrides.yaml
flutter pub get
./scripts/patch_jni_reproducible_build.sh
dart run slang && dart run build_runner build --delete-conflicting-outputs
flutter build apk --release --flavor floss --target-platform android-arm64
./scripts/rename_apk_outputs.sh floss
```

Equivalent one-liner for the jni patch (idempotent; set `PUB_CACHE` in CI):

```bash
sed -i -E 's|target_link_options\(jni PRIVATE "-Wl,[^"]*max-page-size=16384"\)|target_link_options(jni PRIVATE "-Wl,--build-id=none,-z,max-page-size=16384")|' \
  "${PUB_CACHE:-$HOME/.pub-cache}"/hosted/*/jni-*/src/CMakeLists.txt
```

`pubspec_overrides.yaml` is gitignored; `pubspec.lock` in the repo targets **gms**.

### Testing

The project has **368** unit and widget tests (100 `*_test.dart` files) with an Isar test bootstrap and fake platform services (geocoding, home widget, path provider).

```bash
flutter test
flutter analyze
```

If widget tests hang, run `flutter test --concurrency=1`.

Optional coverage report (output in `coverage/`, gitignored):

```bash
flutter test --coverage
```

**Well covered:** data/domain (repos, mappers, validators), core services/utils (notifications, connectivity, location parsing, HTTP date parsing), bootstrap (`AppInitializer`), router redirect/cache sync, settings provider updates, cities notifier (CRUD, `loadError`, delete edge cases), confirmation/selection dialogs, weather widgets and notifiers (`WeatherDetailView`, `DailyCardInfo`, shared hourly strip), location wall clock (`TimeIndexHelper`, clock skew persistence), air quality (`AqiHelper`, `AirQualityMapper`, graceful AQ API fallback, long-press help), metric help copy (`Message`, `DescMetricsCatalog`), daily display helpers, city list shimmer, global no-splash theme.

**Notification regression tests:** stable notification IDs (`notificationIdFor`), one slot per hour when duplicate daily rows exist, and `MainWeatherNotifier._init` not calling `cancelAll()` while notifications stay enabled.

**Widget/screen gaps (intentionally skipped):** cold-start `main.dart`, WorkManager, OSM tile network/cache, onboarding → home E2E, geolocation submit → full navigation E2E.

If alerts stopped after an update that fixed notification scheduling, toggle notifications off and on in Settings (Android 13+ may need to grant notification permission once).

Widget tests that hit city search or forecast APIs should use `createFakeWeatherRemoteDatasource()` from `test/helpers/fixtures.dart` so geocoding and forecast share one stubbed Dio client.

### Code Generation
The project uses code generation for:
- **Isar Community** — local database schemas
- **Freezed** — immutable API models
- **JSON Serializable** — JSON serialization
- **Slang** — translations from `assets/i18n/*.i18n.json`

After changing models or locale files:
```bash
dart run slang
dart run build_runner build --delete-conflicting-outputs
```

### Tech Stack (highlights)
- **Flutter** + **Riverpod 3** • **Go Router** • **Isar Community**
- **home_widget** + **Workmanager** (Android widgets) • **flutter_local_notifications**
- **Open-Meteo Weather API** • **Open-Meteo Air Quality API** • **flutter_map** + OSM tiles
- **timezone** + **flutter_timezone** + **lat_lng_to_timezone** for IANA lookups and per-location wall clocks
- **google_fonts** for configurable app typography • Dependencies in `pubspec.yaml` are grouped by purpose

---

## 🌐 Data Sources

Rain uses free, open weather APIs with no API key required:

- **Weather Data:** [Open-Meteo Weather API](https://open-meteo.com/en/docs) - Free, open-source weather API
- **Air Quality:** [Open-Meteo Air Quality API](https://open-meteo.com/en/docs/air-quality-api) - Hourly AQI and pollutant concentrations (CC BY 4.0)
- **Geocoding:** [Open-Meteo Geocoding API](https://open-meteo.com/en/docs/geocoding-api) - City search and coordinates
- **Map Tiles:** [OpenStreetMap](https://www.openstreetmap.org/) - Collaborative mapping project

---

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](./CONTRIBUTING.md) for setup, testing, and pull request guidelines. Use the [bug report](.github/ISSUE_TEMPLATE/bug_report.md) or [feature request](.github/ISSUE_TEMPLATE/feature_request.md) templates when opening issues.

---

## 💰 Support the Project

If Rain has become an indispensable part of your daily routine, consider supporting development:

[![ЮMoney](https://img.shields.io/badge/ЮMoney-violet?style=for-the-badge)](https://yoomoney.ru/to/4100117672775961)

---

## 📃 License

This project is licensed under the [MIT License](./LICENSE).

---

## 👨‍💻 Contributors

Thanks to all our amazing contributors!

<a href='https://github.com/darkmoonight/Rain/graphs/contributors'>
    <img src='https://contrib.rocks/image?repo=darkmoonight/Rain'/>
</a>

---

<p align='center'>
    Made with ❤️ using Flutter
</p>
