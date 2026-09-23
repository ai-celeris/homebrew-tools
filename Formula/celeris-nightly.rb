class CelerisNightly < Formula
  desc "Fast assistant that acts on whatever is on your screen (nightly channel)"
  homepage "https://app.celeris.ai/"
  url "https://downloads.celeris.ai/releases/v0.5.0-src0000003509.c0.nightly.g89704112/celeris-dash-0.5.0-src0000003509.c0.nightly.g89704112-linux-x64.AppImage"
  version "0.5.0-src0000003509.c0.nightly.g89704112"
  sha256 "ea107685896d28690de2b05c34e11739592847a0c082d80ff1d4deef7acd9ff5"
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
