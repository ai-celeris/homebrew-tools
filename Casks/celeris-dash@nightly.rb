cask "celeris-dash@nightly" do
  version "0.5.0"
  sha256 "919297b657eba63dc1412fbeac2b582ab85325f0e70ec3f141463abf7b5e2f9c"

  url "https://downloads.dash.celeris.ai/releases/v#{version}/celeris-dash-#{version}-macos-arm64.zip"
  name "Celeris Dash (nightly)"
  desc "Local desktop dispatcher powered by celeris-1"
  homepage "https://dash.celeris.ai/"

  disable! date: "2026-08-29", because: "a notarized nightly release is not available yet"

  livecheck do
    skip "Release channel is managed by Celeris Dash automation"
  end

  conflicts_with cask: ["celeris-dash", "celeris-dash@beta"]
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Celeris Dash.app"

  zap trash: "~/Library/Application Support/Celeris Dash"
end
