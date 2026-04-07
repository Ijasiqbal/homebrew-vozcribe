cask "vozcribe" do
  version "1.1"
  sha256 "aa003b14811b3d46e1504c20c5f1dc450d597fe6a7fe78c5834dba26fcffde2f"

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
