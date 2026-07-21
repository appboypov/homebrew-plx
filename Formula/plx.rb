class Plx < Formula
  desc "Dart CLI tool for project file monitoring and tooling automation"
  homepage "https://github.com/appboypov/homebrew-plx"
  version "0.17.0"

  on_macos do
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v0.17.0/plx-macos-arm64"
    sha256 "da37ff820d97e30f2216397ce4c4289736dca24df0896ba6b41812969ba5d0be"
  end

  on_linux do
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v0.17.0/plx-linux-x64"
    sha256 "2b734be3aaba5ba4eb15089b9b000e556099e038a384c6f4345afc919bf334a9"
  end

  def install
    binary = Dir["plx-*"].first
    bin.install binary => "plx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plx --version")
  end
end
