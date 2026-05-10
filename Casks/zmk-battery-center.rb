cask "zmk-battery-center" do
  version "0.8.0"

  on_arm do
    sha256 "0df8b06846b7e7b84d45be3b74061bbce658516da4e582e9b35698b5bb1bb909"
    url "https://github.com/kot149/zmk-battery-center/releases/download/v#{version}/zmk-battery-center_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "3d47bc1f06cd3aff27305e8407edc6307cbb64362e667d434580b8c5e1835f55"
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

  caveat <<~EOS
    This app is not code-signed. To open it for the first time:
      1. Right-click "zmk-battery-center.app" in Finder
      2. Select "Open"
      3. Click "Open" in the warning dialog
  EOS
end
