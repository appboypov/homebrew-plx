class Plx < Formula
  desc "Dart CLI tool for project file monitoring and tooling automation"
  homepage "https://github.com/appboypov/homebrew-plx"
  version "0.12.0"

  on_macos do
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v0.12.0/plx-macos-arm64"
    sha256 "74e13378e8579f0918887248efaafd77aef6525ce267ee07d506d112b86a013a"
  end

  on_linux do
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v0.12.0/plx-linux-x64"
    sha256 "2b8508a3a64cf6f4021fa541deeb3676a4fab25af6f7bea4e42351c895976003"
  end

  def install
    binary = Dir["plx-*"].first
    bin.install binary => "plx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plx --version")
  end
end
