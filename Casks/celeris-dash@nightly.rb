cask "celeris-dash@nightly" do
  version "0.5.0-src0000002894.c0.nightly.g059d5bd0"
  sha256 "6e4aa82cecfb722b39ce2acaf522fa6543b029471af6a1a39b88cda630015dc2"

  url "https://downloads.dash.celeris.ai/releases/v#{version}/celeris-dash-#{version}-macos-arm64.zip"
  name "Celeris Dash (nightly)"
  desc "Local desktop dispatcher powered by celeris-1"
  homepage "https://dash.celeris.ai/"

  livecheck do
    skip "Release channel is managed by Celeris Dash automation"
  end

  auto_updates true
  conflicts_with cask: ["celeris-dash", "celeris-dash@beta"]
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Celeris Dash.app"

  zap trash: "~/Library/Application Support/Celeris Dash"
end
