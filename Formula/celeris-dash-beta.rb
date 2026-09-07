class CelerisDashBeta < Formula
  desc "Local desktop dispatcher powered by celeris-1 (beta channel)"
  homepage "https://dash.celeris.ai/"
  url "https://downloads.dash.celeris.ai/releases/v0.5.0-src0000002771.c1.rc.g75446b7d/celeris-dash-0.5.0-src0000002771.c1.rc.g75446b7d-linux-x64.AppImage"
  version "0.5.0-src0000002771.c1.rc.g75446b7d"
  sha256 "e6f70b27edc797cd83c5e165a74c678043ccb36ca709d9dac7481a8cce083bdc"
  license :cannot_represent

  def install
    if OS.mac?
      odie "On macOS install the signed app instead: brew install --cask ai-celeris/tools/celeris-dash@beta"
    end

    appimage = Dir["*.AppImage"].first
    odie "the published Linux artifact is not an AppImage" if appimage.nil?
    libexec.install appimage => "celeris-dash.AppImage"
    chmod 0755, libexec/"celeris-dash.AppImage"

    (bin/"celeris-dash-beta").write <<~LAUNCHER
      #!/bin/sh
      exec "#{libexec}/celeris-dash.AppImage" --appimage-extract-and-run "$@"
    LAUNCHER
    chmod 0755, bin/"celeris-dash-beta"
  end

  def caveats
    <<~CAVEATS
      Start Dash with `celeris-dash-beta`.
    CAVEATS
  end

  test do
    assert_path_exists libexec/"celeris-dash.AppImage"
    assert_predicate bin/"celeris-dash-beta", :executable?
  end
end
