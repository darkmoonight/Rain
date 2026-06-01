#!/usr/bin/env bash
# Rename Flutter APK outputs to match GitHub release asset names:
#   rain-{abi}-release-{gms|floss}.apk  or  rain-release-{gms|floss}.apk
set -euo pipefail

variant="${1:-}"
out_dir="${2:-build/app/outputs/flutter-apk}"

if [[ "$variant" != "gms" && "$variant" != "floss" ]]; then
  echo "Usage: $0 <gms|floss> [output_dir]" >&2
  exit 1
fi

if [[ ! -d "$out_dir" ]]; then
  echo "APK output directory not found: $out_dir" >&2
  exit 1
fi

apk_dest_name() {
  local base="$1"
  if [[ "$base" == "app-${variant}-release" ]]; then
    echo "rain-release-${variant}.apk"
    return 0
  fi
  if [[ "$base" =~ ^app-(.+)-${variant}-release$ ]]; then
    echo "rain-${BASH_REMATCH[1]}-release-${variant}.apk"
    return 0
  fi
  return 1
}

renamed=0
shopt -s nullglob
for apk in \
  "$out_dir"/app-"${variant}"-release.apk \
  "$out_dir"/app-*-"${variant}"-release.apk; do
  [[ -f "$apk" ]] || continue
  base="$(basename "$apk" .apk)"
  dest="$(apk_dest_name "$base")" || continue
  mv -f "$apk" "$out_dir/$dest"
  echo "$out_dir/$dest"
  renamed=$((renamed + 1))
done

if [[ "$renamed" -eq 0 ]]; then
  echo "No APK files to rename for flavor ${variant} in $out_dir" >&2
  exit 1
fi
