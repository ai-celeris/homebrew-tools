cask "celeris@nightly" do
  version "0.5.0-src0000003502.c0.nightly.g40d6508e"
  sha256 "146fc9a51424f132f815a38b1db4447f9161e7dc8c194c98f93ad5e966bcc2db"

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
