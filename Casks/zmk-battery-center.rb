cask "zmk-battery-center" do
  version "0.13.2"

  on_arm do
    sha256 "ba7d564e73eb87ded41e8ab9e6fdf6baba4216fd265f3ac4aef1630ddb68cbcb"
    url "https://github.com/kot149/zmk-battery-center/releases/download/v#{version}/zmk-battery-center_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "5b4255c090ebfd97b7e435a8f441bea79737bd3b70260939917b32a5e94e1f9c"
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
