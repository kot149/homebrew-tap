#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/update-cask.sh [vX.Y.Z]
# If version is omitted, uses the latest GitHub release.

REPO="kot149/zmk-battery-center"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CASK_FILE="$SCRIPT_DIR/../Casks/zmk-battery-center.rb"
WORK_DIR=$(mktemp -d)
trap "rm -rf '$WORK_DIR'" EXIT

if [[ $# -ge 1 ]]; then
  VERSION="${1#v}"
else
  VERSION=$(gh release view --repo "$REPO" --json tagName --jq '.tagName | ltrimstr("v")')
fi

echo "Updating cask to v$VERSION..."

gh release download "v$VERSION" \
  --repo "$REPO" \
  --pattern "*.dmg" \
  --dir "$WORK_DIR"

SHA_ARM=$(shasum -a 256 "$WORK_DIR/zmk-battery-center_${VERSION}_aarch64.dmg" | awk '{print $1}')
SHA_X64=$(shasum -a 256 "$WORK_DIR/zmk-battery-center_${VERSION}_x64.dmg"     | awk '{print $1}')

echo "  aarch64: $SHA_ARM"
echo "  x64:     $SHA_X64"

awk -v ver="$VERSION" -v sha_arm="$SHA_ARM" -v sha_x64="$SHA_X64" '
  /^  version /  { print "  version \"" ver "\""; next }
  /on_arm/       { in_arm=1; in_intel=0 }
  /on_intel/     { in_intel=1; in_arm=0 }
  in_arm   && /sha256/ { sub(/"[a-f0-9]+"/, "\"" sha_arm "\""); in_arm=0 }
  in_intel && /sha256/ { sub(/"[a-f0-9]+"/, "\"" sha_x64 "\""); in_intel=0 }
  { print }
' "$CASK_FILE" > "$WORK_DIR/zmk-battery-center.rb"

mv "$WORK_DIR/zmk-battery-center.rb" "$CASK_FILE"

cd "$SCRIPT_DIR/.."
git add Casks/zmk-battery-center.rb
git diff --cached
git commit -m "chore: bump zmk-battery-center to v$VERSION"
git push

echo "Done! Cask updated to v$VERSION"
