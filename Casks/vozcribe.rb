cask "vozcribe" do
  version "1.15.2"
  sha256 "26c62162d2f999d5056df74fc346c40d8bed106eb7178673c8ee6d5c3d8c7cb4"

  url "https://github.com/Ijasiqbal/Vozcribe-release/releases/download/v#{version}/Vozcribe-#{version}.zip"
  name "Vozcribe"
  desc "Voice-to-text for macOS — speak and transcribe into any text field"
  homepage "https://github.com/Ijasiqbal/Vozcribe-release"

  depends_on macos: ">= :ventura"

  preflight do
    system_command "/usr/bin/xattr",
      args: ["-cr", "#{staged_path}/Vozcribe.app"]
  end

  app "Vozcribe.app"

  zap trash: [
    "~/Library/Application Support/Vozcribe",
    "~/Library/Preferences/com.wozcribe.mac.plist",
  ]
end
