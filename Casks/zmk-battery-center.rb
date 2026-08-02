cask "zmk-battery-center" do
  version "0.10.2"

  on_arm do
    sha256 "62dbb2ed749ca7c5f8e27d84eabfb0e521bb5bc1465fc94efbf804898a11eeec"
    url "https://github.com/kot149/zmk-battery-center/releases/download/v#{version}/zmk-battery-center_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "7b17e7070b59278da948a8c1569594c84cc6c250f2bf07b695b41e498b6613d5"
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
