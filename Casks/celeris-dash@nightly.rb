cask "celeris-dash@nightly" do
  version "0.5.0-src0000002297.c0.nightly.g91b32992"
  sha256 "e3941d35b34753595ae7121b8a70c4efef5d480a33bc1493018f02562db9b1b0"

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
