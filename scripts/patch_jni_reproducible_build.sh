#!/usr/bin/env bash

set -euo pipefail

if [[ -n "${PUB_CACHE:-}" ]]; then
  pub_cache="$PUB_CACHE"
else
  pub_cache="${HOME}/.pub-cache"
fi

shopt -s nullglob
files=("$pub_cache"/hosted/*/jni-*/src/CMakeLists.txt)

if (( ${#files[@]} == 0 )); then
  echo "patch_jni_reproducible_build: no jni CMakeLists.txt under ${pub_cache}/hosted" >&2
  exit 1
fi

canonical='target_link_options(jni PRIVATE "-Wl,--build-id=none,-z,max-page-size=16384")'
for f in "${files[@]}"; do
  if ! grep -q 'max-page-size=16384' "$f"; then
    echo "patch_jni_reproducible_build: no Android link line in $f" >&2
    exit 1
  fi
  sed -i -E \
    "s|target_link_options\\(jni PRIVATE \"-Wl,[^\"]*max-page-size=16384\"\\)|${canonical}|" \
    "$f"
done
