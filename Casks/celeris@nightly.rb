cask "celeris@nightly" do
  version "0.5.0-src0000003385.c0.nightly.g8e004be6"
  sha256 "a818b7c601662ca71ed33b009bcce14cfa0fc10de07e9c39b82e1dd34f8bbd2f"

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
