cask "celeris@nightly" do
  version "0.5.0-src0000003432.c0.nightly.gb7597d8f"
  sha256 "864547b93cdd32131d6f9a49b44a9eb4a0009c4aac82b13840334ae653bbee06"

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
