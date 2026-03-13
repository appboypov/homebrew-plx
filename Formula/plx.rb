class Plx < Formula
  desc "Dart CLI tool for project file monitoring and tooling automation"
  homepage "https://github.com/appboypov/pew_pew_plx"
  version "0.5.0"

  on_macos do
    url "https://github.com/appboypov/pew_pew_plx/releases/download/v#{version}/plx-macos-arm64"
    sha256 "9da876ebfad3955aff322f196bf3370210f130419acdd54bb6dd730010812126"
  end

  on_linux do
    url "https://github.com/appboypov/pew_pew_plx/releases/download/v#{version}/plx-linux-x64"
    sha256 "65c1b34a96cd2cddbb7f1dec3c0c902e840d3c9d6c8de76b0dec66b39adeaf62"
  end

  def install
    binary = Dir["plx-*"].first
    bin.install binary => "plx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plx --version")
  end
end
