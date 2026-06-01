#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"

rm -f pubspec_overrides.yaml
flutter pub get

echo "Default dependencies restored (pub.dev geolocator_android)."
