# Solace Box Android shell

This directory contains the Android wrapper used by GitHub Actions to package the production web build as an APK. No Android/Gradle build is required on the user's phone.

The workflow copies `build/` into `android/app/src/main/assets/web/`, then builds the APK on an Ubuntu GitHub runner.
