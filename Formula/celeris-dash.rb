class CelerisDash < Formula
  desc "Local desktop dispatcher powered by celeris-1"
  homepage "https://dash.celeris.ai/"
  url "https://downloads.dash.celeris.ai/releases/v0.0.0/celeris-dash-0.0.0-linux-x64.AppImage"
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license :cannot_represent

  disable! date: "2026-09-01", because: "a notarized stable release is not available yet"

  def install
    if OS.mac?
      odie "On macOS install the signed app instead: brew install --cask ai-celeris/tools/celeris-dash"
    end

    appimage = Dir["*.AppImage"].first
    odie "the published Linux artifact is not an AppImage" if appimage.nil?
    libexec.install appimage => "celeris-dash.AppImage"
    chmod 0755, libexec/"celeris-dash.AppImage"

    (bin/"celeris-dash").write <<~LAUNCHER
      #!/bin/sh
      exec "#{libexec}/celeris-dash.AppImage" --appimage-extract-and-run "$@"
    LAUNCHER
    chmod 0755, bin/"celeris-dash"
  end

  def caveats
    <<~CAVEATS
      Start Dash with `celeris-dash`.
    CAVEATS
  end

  test do
    assert_path_exists libexec/"celeris-dash.AppImage"
    assert_predicate bin/"celeris-dash", :executable?
  end
end
