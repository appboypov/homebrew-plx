class Plx < Formula
  desc "Dart CLI tool for project file monitoring and tooling automation"
  homepage "https://github.com/appboypov/homebrew-plx"
  version "0.15.0"

  on_macos do
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v0.15.0/plx-macos-arm64"
    sha256 "a843de468420ca780494c57fa1af16723cff8f9e8e326327ddb84e1032e4d7bb"
  end

  on_linux do
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v0.15.0/plx-linux-x64"
    sha256 "6212abc4bd5ab1b7aed0c8bcd8b94c72ff01d98b72f40c0bbef4b3e2e461c470"
  end

  def install
    binary = Dir["plx-*"].first
    bin.install binary => "plx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plx --version")
  end
end
