class Plx < Formula
  desc "Dart CLI tool for project file monitoring and tooling automation"
  homepage "https://github.com/appboypov/homebrew-plx"
  version "0.8.1"

  on_macos do
    url "https://github.com/appboypov/homebrew-plx/releases/download/v0.8.1/plx-macos-arm64"
    sha256 "53231c02dc7e9484d930b9386c41ffd6111df0d25f07e9c8d7380d6acfda3994"
  end

  on_linux do
    url "https://github.com/appboypov/homebrew-plx/releases/download/v0.8.1/plx-linux-x64"
    sha256 "a3e7809547f56e087aab3fa1263157c2fbd822cc27026bd4404cacdfd6bb35e0"
  end

  def install
    binary = Dir["plx-*"].first
    bin.install binary => "plx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plx --version")
  end
end
