#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"
BRANCH="development"
WORKFLOW="build.yml"
ARTIFACT="solace-box-debug"
OUT="dist/apk"

printf '\n=== SOLACE BOX → GITHUB → APK ===\n'
git checkout "$BRANCH"
git add .
if ! git diff --cached --quiet; then
  git commit -m "Update Solace Box premium build"
fi
git push origin "$BRANCH"

echo "Waiting for GitHub Actions..."
sleep 3
RUN_ID="$(gh run list --workflow "$WORKFLOW" --branch "$BRANCH" --limit 1 --json databaseId --jq '.[0].databaseId')"
if [ -z "$RUN_ID" ]; then
  echo "Could not find the GitHub Actions run." >&2
  exit 1
fi

gh run watch "$RUN_ID" --exit-status
rm -rf "$OUT"
mkdir -p "$OUT"
gh run download "$RUN_ID" -n "$ARTIFACT" -D "$OUT"

APK="$(find "$OUT" -type f -name '*.apk' | head -1)"
if [ -z "$APK" ]; then
  echo "Build completed, but no APK was found in the artifact." >&2
  exit 1
fi

echo
echo "=== APK READY ==="
echo "$APK"
ls -lh "$APK"
