# Solace Box — GitHub → APK

The project now includes an Android WebView shell and a GitHub Actions build pipeline. Termux does **not** run Gradle.

## One-tap-ish Termux build

From the repository:

```bash
./scripts/build-apk-termux.sh
```

The script commits pending changes, pushes `development`, waits for GitHub Actions, and downloads the `solace-box-debug` APK into `dist/apk/`.

## Manual flow

```bash
git add .
git commit -m "Update Solace Box"
git push origin development
gh run watch
```

Then download the `solace-box-debug` artifact from the completed workflow run.
