class CelerisNightly < Formula
  desc "Fast assistant that acts on whatever is on your screen (nightly channel)"
  homepage "https://app.celeris.ai/"
  url "https://downloads.celeris.ai/releases/v0.5.0-src0000003484.c0.nightly.ga004f29c/celeris-dash-0.5.0-src0000003484.c0.nightly.ga004f29c-linux-x64.AppImage"
  version "0.5.0-src0000003484.c0.nightly.ga004f29c"
  sha256 "96b3076fb854350b0e96c1e7b68812c6f79e9d8c4714c5265f0fb0067c36b2d6"
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
