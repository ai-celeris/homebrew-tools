class CelerisNightly < Formula
  desc "Fast assistant that acts on whatever is on your screen (nightly channel)"
  homepage "https://app.celeris.ai/"
  url "https://downloads.celeris.ai/releases/v0.5.0-src0000003341.c0.nightly.gc43bd26d/celeris-dash-0.5.0-src0000003341.c0.nightly.gc43bd26d-linux-x64.AppImage"
  version "0.5.0-src0000003341.c0.nightly.gc43bd26d"
  sha256 "e9293b56c181d1edee1460daf22e0b56d03e69e0d2f0605c9014e8bb5f9ac244"
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
