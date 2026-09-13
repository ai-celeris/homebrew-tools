class CelerisDashBeta < Formula
  desc "Local desktop dispatcher powered by celeris-1 (beta channel)"
  homepage "https://dash.celeris.ai/"
  url "https://downloads.dash.celeris.ai/releases/v0.5.0-src0000003075.c1.rc.g66a25ed1/celeris-dash-0.5.0-src0000003075.c1.rc.g66a25ed1-linux-x64.AppImage"
  version "0.5.0-src0000003075.c1.rc.g66a25ed1"
  sha256 "e9097803cd927980bc23318d138c1c7caca54ec5ef5c72ee72ca2ad771f2bacb"
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
