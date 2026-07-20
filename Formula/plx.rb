class Plx < Formula
  desc "Dart CLI tool for project file monitoring and tooling automation"
  homepage "https://github.com/appboypov/homebrew-plx"
  version "0.16.0"

  on_macos do
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v0.16.0/plx-macos-arm64"
    sha256 "7e749947d5465a93918bf29794e9433991d906c84f8431232e98beb7ce056d20"
  end

  on_linux do
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v0.16.0/plx-linux-x64"
    sha256 "af4f82cba69756428905d08c68aeba6e821934ea25ad3a7657e5f857f0e843b5"
  end

  def install
    binary = Dir["plx-*"].first
    bin.install binary => "plx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plx --version")
  end
end
