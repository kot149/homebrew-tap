cask "zmk-battery-center" do
  version "0.9.0"

  on_arm do
    sha256 "ff441424c1b2a0af31c7d74581e4ef81dbf6c1a87bef76ed541ef6ea19697766"
    url "https://github.com/kot149/zmk-battery-center/releases/download/v#{version}/zmk-battery-center_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "93ab478f56f6280e6ec70e64a5dbd32a386c7b870b9dde331ed5e63a05bab586"
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
