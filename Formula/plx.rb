class Plx < Formula
  desc "Dart CLI tool for project file monitoring and tooling automation"
  homepage "https://github.com/appboypov/homebrew-plx"
  version "0.11.0"

  on_macos do
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v0.11.0/plx-macos-arm64"
    sha256 "976b1d763a8d2b6ada79f9fcdfa2fd68d90f33d04a33ee39f0275f80a5b51c7f"
  end

  on_linux do
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v0.11.0/plx-linux-x64"
    sha256 "1d5cdb6ff5a6f310a963172903ef6b158ecad58df5338e66da1f5be40f91f407"
  end

  def install
    binary = Dir["plx-*"].first
    bin.install binary => "plx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plx --version")
  end
end
