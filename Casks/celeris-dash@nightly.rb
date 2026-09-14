cask "celeris-dash@nightly" do
  version "0.5.0-src0000003102.c0.nightly.g76d51245"
  sha256 "b9529fa1507a4ce753a9f1caa061f85c238a77862972fe0ac18e2eb396862f62"

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
