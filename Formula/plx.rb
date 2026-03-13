class Plx < Formula
  desc "Dart CLI tool for project file monitoring and tooling automation"
  homepage "https://github.com/appboypov/homebrew-plx"
  version "0.5.0"

  on_macos do
    url "https://github.com/appboypov/homebrew-plx/releases/download/v#{version}/plx-macos-arm64"
    sha256 "edcca77ad93dbea8d8737df2eb80516cd00d951ff73fdea56e569ae57cb393ab"
  end

  on_linux do
    url "https://github.com/appboypov/homebrew-plx/releases/download/v#{version}/plx-linux-x64"
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
