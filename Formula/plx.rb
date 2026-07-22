class Plx < Formula
  desc "Dart CLI tool for project file monitoring and tooling automation"
  homepage "https://github.com/appboypov/homebrew-plx"
  version "0.18.0"

  on_macos do
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v#{version}/plx-macos-arm64.tar.gz"
    sha256 "9bad90bef55f6caf2abde0b65cca25aae4ce86aa86a882604c8e292514bccdce"
  end

  on_linux do
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v#{version}/plx-linux-x64.tar.gz"
    sha256 "208c607809315dcb1fe0a102e84292f6dd096dc9a3d44f269b6c710b45360739"
  end

  def install
    bin.install "bin/plx"
    libexec.install Dir["libexec/*"]
    (share/"licenses/plx-codemap").install Dir["share/licenses/plx-codemap/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plx --version")

    repo = testpath/"codemap-smoke"
    repo.mkpath
    (repo/"sample.dart").write <<~DART
      class FormulaSmoke {
        String greet(String name) => 'Hello, $name';
      }
    DART
    system "git", "-C", repo, "init", "--quiet"
    output = Dir.chdir(repo) do
      shell_output("#{bin}/plx get rp-codemap sample.dart --json")
    end
    assert_match '"status": "mapped"', output
    assert_match "FormulaSmoke", output
  end
end
