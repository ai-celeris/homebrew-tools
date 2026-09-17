class CelerisNightly < Formula
  desc "Fast assistant that acts on whatever is on your screen (nightly channel)"
  homepage "https://app.celeris.ai/"
  url "https://downloads.celeris.ai/releases/v0.5.0-src0000003198.c0.nightly.gb49d9d59/celeris-dash-0.5.0-src0000003198.c0.nightly.gb49d9d59-linux-x64.AppImage"
  version "0.5.0-src0000003198.c0.nightly.gb49d9d59"
  sha256 "a28fad37387153e7d6e4b1a1e47774188adae7f699f71cae8ca3e0299e5dc93c"
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
