cask "vozcribe" do
  version "1.11"
  sha256 "88ca7376ad5bf99e0f33648b789939add62f5549d46e2c0f7bb2e79ea6ba7261"

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
