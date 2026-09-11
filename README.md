# KERVIX Android Test Build

This package is structured for Codemagic to build from the repository root.

Important: do **not** set Codemagic's working directory to `KERVIX-Android` and do **not** use `cd KERVIX-Android` in the build script.

The Gradle project root contains:
- settings.gradle
- build.gradle
- gradlew
- app/build.gradle
- codemagic.yaml

Codemagic workflow: `kervix-android-test`
Artifact: `app/build/outputs/apk/**/*.apk`
