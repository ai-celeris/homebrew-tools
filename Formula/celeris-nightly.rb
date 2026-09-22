class CelerisNightly < Formula
  desc "Fast assistant that acts on whatever is on your screen (nightly channel)"
  homepage "https://app.celeris.ai/"
  url "https://downloads.celeris.ai/releases/v0.5.0-src0000003409.c0.nightly.gc518dde5/celeris-dash-0.5.0-src0000003409.c0.nightly.gc518dde5-linux-x64.AppImage"
  version "0.5.0-src0000003409.c0.nightly.gc518dde5"
  sha256 "88b4a13c53547f1f01d8ec8fba48fa91eb60f63ec36a8cd0dabab16baf756b79"
  license :cannot_represent

  def install
    if OS.mac?
      odie "On macOS install the signed app instead: brew install --cask ai-celeris/tools/celeris@nightly"
    end

    appimage = Dir["*.AppImage"].first
    odie "the published Linux artifact is not an AppImage" if appimage.nil?
    libexec.install appimage => "celeris.AppImage"
    chmod 0755, libexec/"celeris.AppImage"

    (bin/"celeris-nightly").write <<~LAUNCHER
      #!/bin/sh
      exec "#{libexec}/celeris.AppImage" --appimage-extract-and-run "$@"
    LAUNCHER
    chmod 0755, bin/"celeris-nightly"
  end

  def caveats
    <<~CAVEATS
      Start Celeris with `celeris-nightly`.
    CAVEATS
  end

  test do
    assert_path_exists libexec/"celeris.AppImage"
    assert_predicate bin/"celeris-nightly", :executable?
  end
end
