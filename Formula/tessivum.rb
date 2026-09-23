class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.30/tessivum-0.1.0-alpha.30-x86_64-apple-darwin.tar.gz"
      sha256 "250e619b16a092b5276b3833fbf70563d003cc865a1cf4592548b79ad920b144"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.30/tessivum-0.1.0-alpha.30-aarch64-apple-darwin.tar.gz"
      sha256 "661bafb502c9878000d76c089a282082cb1af5e86c66711ea386ff4ae1c16fd7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.30/tessivum-0.1.0-alpha.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ddafb86d2f385645ae8f7921b26d330b598d583c9d431ad28507be1af810127"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.30/tessivum-0.1.0-alpha.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "88d99cc3f7285ff195bf69eedc0f67456f8d3417f9ff5a4a87f4e61243a5b14b"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/tessivum"
    bin.install_symlink libexec/"bin/tessivum" => "tsv"
  end

  test do
    assert_equal shell_output("#{bin}/tessivum --version"), shell_output("#{bin}/tsv --version")
    assert_equal shell_output("#{bin}/tessivum --help"), shell_output("#{bin}/tsv --help")
  end
end
