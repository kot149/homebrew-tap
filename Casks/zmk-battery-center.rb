cask "zmk-battery-center" do
  version "0.12.0"

  on_arm do
    sha256 "d168477c0e39ab0ab86528df6e7015ba759143d1851f73606f453a32710a306f"
    url "https://github.com/kot149/zmk-battery-center/releases/download/v#{version}/zmk-battery-center_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "2d34f391ebe731b70b0a7950f2c2ed9dbf31fd05f8fe08560ad8f8d27b3db438"
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
