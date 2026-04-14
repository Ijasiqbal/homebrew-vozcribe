cask "vozcribe" do
  version "1.15"
  sha256 "9d48c8e711ab6b06c1baa8701fe6f7c307253f085b90327f8b0ac7ff4eca7ade"

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
