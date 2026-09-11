#!/bin/sh
set -eu

GRADLE_VERSION="8.14.1"
CACHE_DIR="${HOME}/.gradle/kervix-bootstrap"
DIST="${CACHE_DIR}/gradle-${GRADLE_VERSION}"
BIN="${DIST}/bin/gradle"
ZIP="${CACHE_DIR}/gradle-${GRADLE_VERSION}-bin.zip"

if [ ! -x "$BIN" ]; then
  mkdir -p "$CACHE_DIR"
  URL="https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
  echo "KERVIX: bootstrapping Gradle ${GRADLE_VERSION}..."
  if command -v curl >/dev/null 2>&1; then
    curl -fL --retry 3 "$URL" -o "$ZIP"
  elif command -v wget >/dev/null 2>&1; then
    wget -q --tries=3 "$URL" -O "$ZIP"
  else
    echo "ERROR: curl or wget is required to bootstrap Gradle." >&2
    exit 127
  fi
  rm -rf "$DIST"
  unzip -q "$ZIP" -d "$CACHE_DIR"
fi

exec "$BIN" "$@"
