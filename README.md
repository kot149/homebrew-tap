# homebrew-tap

Homebrew tap for [kot149](https://github.com/kot149)'s apps.

## Usage

```sh
brew tap kot149/tap
```

## Casks

| Cask | Description |
|------|-------------|
| `zmk-battery-center` | System tray app to monitor ZMK keyboard battery levels |

### zmk-battery-center

```sh
brew install --cask kot149/tap/zmk-battery-center
```

> **Note:** This app is not code-signed. On first launch, right-click the app in Finder, select **Open**, then click **Open** in the warning dialog.

## Updating Casks

Cask updates are automated via the [Update zmk-battery-center Cask](.github/workflows/update-cask.yml) workflow.

**Manual trigger** (GitHub Actions → Update zmk-battery-center Cask → Run workflow):
- Leave the version field empty to pull the latest release automatically.
- Or specify a version (e.g. `1.2.3`) to update to a specific release.

**Automatic trigger** from the source repository via `repository_dispatch`:

Add the following step to a release workflow in `kot149/zmk-battery-center`, using a personal access token with `repo` scope stored as `TAP_UPDATE_TOKEN`:

```yaml
- name: Trigger tap update
  run: |
    gh api repos/kot149/homebrew-tap/dispatches \
      --method POST \
      --field event_type=release \
      --field client_payload='{"version":"${{ github.ref_name }}"}'
  env:
    GH_TOKEN: ${{ secrets.TAP_UPDATE_TOKEN }}
```
