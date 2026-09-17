cask "celeris@nightly" do
  version "0.5.0-src0000003192.c0.nightly.g3a48cdbe"
  sha256 "a0452bd5502c4d9daeeb41303eb2ae5c6f2ce1d55f965d2c1325ef9566ecf11b"

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
