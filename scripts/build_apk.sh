#!/usr/bin/env bash
set -euo pipefail

variant="${1:-}"
shift || true

if [[ "$variant" != "gms" && "$variant" != "floss" ]]; then
  echo "Usage: $0 <gms|floss> [flutter build apk args...]" >&2
  exit 1
fi

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"
scripts="$(dirname "$0")"

cleanup() {
  rm -f pubspec_overrides.yaml
}
trap cleanup EXIT

if [[ "$variant" == "floss" ]]; then
  cp tool/pubspec_overrides.floss.yaml pubspec_overrides.yaml
else
  rm -f pubspec_overrides.yaml
fi

flutter pub get
"$scripts/patch_jni_reproducible_build.sh"
dart run slang
dart run build_runner build --delete-conflicting-outputs

flutter build apk --release --flavor "$variant" "$@"
"$scripts/rename_apk_outputs.sh" "$variant"
