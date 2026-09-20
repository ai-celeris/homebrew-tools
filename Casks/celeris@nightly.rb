cask "celeris@nightly" do
  version "0.5.0-src0000003333.c0.nightly.gf2545da4"
  sha256 "0d4ffbcc8b074e3c955bab6ccab4447d8980c1f89c8eff25d2d7fe263a7d2752"

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
