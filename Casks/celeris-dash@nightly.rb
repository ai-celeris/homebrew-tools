cask "celeris-dash@nightly" do
  version "0.5.0-src0000002847.c0.nightly.g147e61b2"
  sha256 "f9c84fdf3156ff22bacb902b7dd59e9252d45724be8c7b612e8b9d1b1ed74be3"

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
