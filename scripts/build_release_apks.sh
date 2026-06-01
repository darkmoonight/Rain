#!/usr/bin/env bash
# Full GitHub release set: 8 APKs (gms + floss, splits + universal).
set -euo pipefail

scripts="$(cd "$(dirname "$0")" && pwd)"

echo "==> GMS (splits + universal)"
"$scripts/build_apk.sh" gms --split-per-abi
"$scripts/build_apk.sh" gms

echo "==> FOSS (splits + universal)"
"$scripts/build_apk.sh" floss --split-per-abi
"$scripts/build_apk.sh" floss

echo "==> Restore default (pub.dev) dependencies"
"$scripts/restore_pub_default.sh"

echo "==> Done: build/app/outputs/flutter-apk/"
ls -1 "$scripts/../build/app/outputs/flutter-apk/"rain-*-release-*.apk 2>/dev/null || true
