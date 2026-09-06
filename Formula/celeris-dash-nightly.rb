class CelerisDashNightly < Formula
  desc "Local desktop dispatcher powered by celeris-1 (nightly channel)"
  homepage "https://dash.celeris.ai/"
  url "https://downloads.dash.celeris.ai/releases/v0.5.0-src0000002748.c0.nightly.g2f788c9c/celeris-dash-0.5.0-src0000002748.c0.nightly.g2f788c9c-linux-x64.AppImage"
  version "0.5.0-src0000002748.c0.nightly.g2f788c9c"
  sha256 "b34c8a9c80c22baea2d392f0fca113d8851de71e8fff1e01450ab99394e61541"
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
