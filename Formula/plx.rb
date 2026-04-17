class Plx < Formula
  desc "Dart CLI tool for project file monitoring and tooling automation"
  homepage "https://github.com/appboypov/homebrew-plx"
  version "0.10.0"

  on_macos do
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v0.10.0/plx-macos-arm64"
    sha256 "835f1ddd10063fcaef9af10299ad0e60c7985fb8d9d3fb3c5b1c41cb0cce00f1"
  end

  on_linux do
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v0.10.0/plx-linux-x64"
    sha256 "a4644ce9801336ef3188d2a146ffaad7db8bfca045cb32d6486bf4e79d947789"
  end

  def install
    binary = Dir["plx-*"].first
    bin.install binary => "plx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plx --version")
  end
end
