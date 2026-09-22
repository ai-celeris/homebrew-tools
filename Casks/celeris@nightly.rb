cask "celeris@nightly" do
  version "0.5.0-src0000003463.c0.nightly.gae9fc46a"
  sha256 "480a3a75fa7c19819dc7f274bc77ac178afbeba4c24eb2796a4dd81727fb5259"

  url "https://downloads.celeris.ai/releases/v#{version}/celeris-dash-#{version}-macos-arm64.zip"
  name "Celeris (nightly)"
  desc "Fast assistant that acts on whatever is on your screen"
  homepage "https://app.celeris.ai/"

  livecheck do
    skip "Release channel is managed by Celeris automation"
  end

  auto_updates true
  conflicts_with cask: ["celeris", "celeris@beta"]
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Celeris.app"

  zap trash: "~/Library/Application Support/Celeris"
end
