cask "vozcribe" do
  version "1.14"
  sha256 "1d0158770bb97715a134a8827c6eea17def568c1a7c85d238f237768496eaf0c"

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
