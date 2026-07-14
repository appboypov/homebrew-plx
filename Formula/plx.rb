class Plx < Formula
  desc "Dart CLI tool for project file monitoring and tooling automation"
  homepage "https://github.com/appboypov/homebrew-plx"
  version "0.13.0"

  on_macos do
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v0.13.0/plx-macos-arm64"
    sha256 "918666e3a223f89d6d4c871479a79643a92f04165abbc2226bf38bfd52d1f19d"
  end

  on_linux do
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v0.13.0/plx-linux-x64"
    sha256 "ba0f1f861387906ea4f081f18477c110a3aac57120505dd8657014c64732706d"
  end

  def install
    binary = Dir["plx-*"].first
    bin.install binary => "plx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plx --version")
  end
end
