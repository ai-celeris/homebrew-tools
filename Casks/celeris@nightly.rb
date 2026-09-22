cask "celeris@nightly" do
  version "0.5.0-src0000003453.c0.nightly.gf9a56d6a"
  sha256 "d1b623cc8c7e7f0e2275726f39f6966039e2f4c7cdddd227e8e5c398d7e6ad7d"

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
