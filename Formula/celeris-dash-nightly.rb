class CelerisDashNightly < Formula
  desc "Local desktop dispatcher powered by celeris-1 (nightly channel)"
  homepage "https://dash.celeris.ai/"
  url "https://downloads.dash.celeris.ai/releases/v0.5.0-src0000002292.c0.nightly.g216d12b0/celeris-dash-0.5.0-src0000002292.c0.nightly.g216d12b0-linux-x64.AppImage"
  version "0.5.0-src0000002292.c0.nightly.g216d12b0"
  sha256 "6e1994ff53b68d373ece9a45fcfe628c0414e52aad4e709c1b4ba70ad406ec59"
  license :cannot_represent

  def install
    if OS.mac?
      odie "On macOS install the signed app instead: brew install --cask ai-celeris/tools/celeris-dash@nightly"
    end

    appimage = Dir["*.AppImage"].first
    odie "the published Linux artifact is not an AppImage" if appimage.nil?
    libexec.install appimage => "celeris-dash.AppImage"
    chmod 0755, libexec/"celeris-dash.AppImage"

    (bin/"celeris-dash-nightly").write <<~LAUNCHER
      #!/bin/sh
      exec "#{libexec}/celeris-dash.AppImage" --appimage-extract-and-run "$@"
    LAUNCHER
    chmod 0755, bin/"celeris-dash-nightly"
  end

  def caveats
    <<~CAVEATS
      Start Dash with `celeris-dash-nightly`.
    CAVEATS
  end

  test do
    assert_path_exists libexec/"celeris-dash.AppImage"
    assert_predicate bin/"celeris-dash-nightly", :executable?
  end
end
