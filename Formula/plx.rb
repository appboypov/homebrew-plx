class Plx < Formula
  desc "Dart CLI tool for project file monitoring and tooling automation"
  homepage "https://github.com/appboypov/homebrew-plx"
  version "0.8.0"

  on_macos do
    url "https://github.com/appboypov/homebrew-plx/releases/download/v0.8.0/plx-macos-arm64"
    sha256 "719aef5c632b2db9198fe925cfb4fe7f39ec2d0321690d80944468fbc372daa7"
  end

  on_linux do
    url "https://github.com/appboypov/homebrew-plx/releases/download/v0.8.0/plx-linux-x64"
    sha256 "19ec0b3131100ccac797aacb4c7cf741bfc7e2ef065e292ee03e399f228a091e"
  end

  def install
    binary = Dir["plx-*"].first
    bin.install binary => "plx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plx --version")
  end
end
