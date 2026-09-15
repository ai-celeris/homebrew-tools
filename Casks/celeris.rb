cask "celeris" do
  version "0.5.0"
  sha256 "919297b657eba63dc1412fbeac2b582ab85325f0e70ec3f141463abf7b5e2f9c"

  url "https://downloads.celeris.ai/releases/v#{version}/celeris-dash-#{version}-macos-arm64.zip"
  name "Celeris"
  desc "Fast assistant that acts on whatever is on your screen"
  homepage "https://app.celeris.ai/"

  disable! date: "2026-08-29", because: "a notarized stable release is not available yet"

  livecheck do
    skip "Release channel is managed by Celeris automation"
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Celeris.app"

  zap trash: "~/Library/Application Support/Celeris"
end
