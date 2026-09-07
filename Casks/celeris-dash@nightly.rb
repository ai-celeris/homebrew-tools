cask "celeris-dash@nightly" do
  version "0.5.0-src0000002844.c0.nightly.gb1453f49"
  sha256 "a46383405ca7d3103103c5e60828c6986d6bfc123b24d90bcd332ce3efb10cb9"

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
