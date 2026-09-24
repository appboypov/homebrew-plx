require "json"

class Plx < Formula
  desc "Dart CLI tool for project file monitoring and tooling automation"
  homepage "https://github.com/appboypov/homebrew-plx"
  version "0.40.0"
  depends_on "python@3.12"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v#{version}/plx-macos-arm64.tar.gz"
    sha256 "d0a8653fbb04519607bc5ae4bb191ae4a10c2c7936dc6b4d4110d3bc866abce3"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/appboypov/homebrew-plx/releases/download/plx-v#{version}/plx-linux-x64.tar.gz"
    sha256 "04945e772f36403ae5faf1d980b6e3df5a56a0b9426ec710630c1f5fd2362103"
  end

  def install
    bin.install "bin/plx"
    libexec.install Dir["libexec/*"]
    (share/"licenses").install Dir["share/licenses/*"]
    (share/"plx").install "share/plx/context-runtime.json"
  end

  test do
    ENV["HOME"] = testpath.to_s
    ENV["XDG_CACHE_HOME"] = (testpath/"cache").to_s
    assert_match version.to_s, shell_output("#{bin}/plx --version")

    repo = testpath/"context-smoke"
    repo.mkpath
    (repo/"sample.dart").write <<~DART
      class FormulaSmoke {
        String greet() {
          return 'FORMULA_SOURCE_BODY';
        }
      }
    DART
    system "git", "-C", repo, "init", "--quiet"
    Dir.chdir(repo) do
      maps = JSON.parse(shell_output("#{bin}/plx get codemaps --payload '{\"paths\":[\"sample.dart\"]}' --json"))
      assert_equal true, maps.fetch("ok")
      mapped = maps.fetch("result").fetch("files").first
      assert_equal "codemap", mapped.fetch("mode")
      assert_match "FormulaSmoke", mapped.fetch("content")
      refute_match "FORMULA_SOURCE_BODY", mapped.fetch("content")

      payload = {name: "formula-smoke", instructions: "FORMULA_INSTRUCTIONS", entries: [{path: "sample.dart", pathKind: "file", mode: "full"}]}.to_json
      created = JSON.parse(shell_output("#{bin}/plx create bundle --payload '#{payload}' --json")).fetch("result")
      id = created.fetch("id")
      saved = JSON.parse(shell_output("#{bin}/plx get bundle --id #{id} --json")).fetch("result")
      assert_equal created, saved
      input = {bundleIds: [id]}.to_json
      preview = JSON.parse(shell_output("#{bin}/plx preview context --payload '#{input}' --json")).fetch("result")
      assert_match "FORMULA_SOURCE_BODY", preview.fetch("context")
      refute_match "FORMULA_INSTRUCTIONS", preview.fetch("context")
      assert_equal [{"id" => id, "instructions" => "FORMULA_INSTRUCTIONS"}], preview.fetch("bundles")
      count = JSON.parse(shell_output("#{bin}/plx count context --payload '#{input}' --json")).fetch("result")
      assert_equal preview.fetch("tokenCount"), count.fetch("tokenCount")
    end
  end
end
