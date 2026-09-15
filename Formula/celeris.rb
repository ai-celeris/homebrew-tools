class Celeris < Formula
  desc "Fast assistant that acts on whatever is on your screen"
  homepage "https://app.celeris.ai/"
  url "https://downloads.celeris.ai/releases/v0.0.0/celeris-dash-0.0.0-linux-x64.AppImage"
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license :cannot_represent

  disable! date: "2026-09-01", because: "a notarized stable release is not available yet"

  def install
    if OS.mac?
      odie "On macOS install the signed app instead: brew install --cask ai-celeris/tools/celeris"
    end

    appimage = Dir["*.AppImage"].first
    odie "the published Linux artifact is not an AppImage" if appimage.nil?
    libexec.install appimage => "celeris.AppImage"
    chmod 0755, libexec/"celeris.AppImage"

    (bin/"celeris").write <<~LAUNCHER
      #!/bin/sh
      exec "#{libexec}/celeris.AppImage" --appimage-extract-and-run "$@"
    LAUNCHER
    chmod 0755, bin/"celeris"
  end

  def caveats
    <<~CAVEATS
      Start Celeris with `celeris`.
    CAVEATS
  end

  test do
    assert_path_exists libexec/"celeris.AppImage"
    assert_predicate bin/"celeris", :executable?
  end
end
