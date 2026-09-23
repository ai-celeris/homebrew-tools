cask "celeris@nightly" do
  version "0.5.0-src0000003527.c0.nightly.g9abf95cf"
  sha256 "24a6e785b9e5c6b9d8b6d9d5a07a5ff26e514b98d4ca417fa9ff965d4121fea6"

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
