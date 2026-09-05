cask "zmk-battery-center" do
  version "0.11.0"

  on_arm do
    sha256 "2db723022c18cf7d2347182d4889574596858ae5501b4e1e3f27459f41de1350"
    url "https://github.com/kot149/zmk-battery-center/releases/download/v#{version}/zmk-battery-center_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "92d955583eec8079c1d335327e74e1658f398e721ae2fd7d3b60fe4664c7ef64"
    url "https://github.com/kot149/zmk-battery-center/releases/download/v#{version}/zmk-battery-center_#{version}_x64.dmg"
  end

  name "ZMK Battery Center"
  desc "System tray app to monitor ZMK keyboard battery levels"
  homepage "https://github.com/kot149/zmk-battery-center"

  app "zmk-battery-center.app"

  zap trash: [
    "~/Library/Application Support/com.zmk-battery-center.app",
    "~/Library/Preferences/com.zmk-battery-center.app.plist",
    "~/Library/Logs/zmk-battery-center",
  ]

  caveats <<~EOS
    This app is not code-signed. On macOS, the app may be blocked from opening.
    To allow it, either:

    Option 1: Open System Settings > Privacy & Security > Security
              and click "Open Anyway".

    Option 2: Run the following command in Terminal to remove quarantine:
              sudo xattr -d com.apple.quarantine /Applications/zmk-battery-center.app
              (Change the path if the app is installed elsewhere.)
  EOS
end
