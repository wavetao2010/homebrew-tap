class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.15/tessivum-0.1.0-alpha.15-x86_64-apple-darwin.tar.gz"
      sha256 "0089d7e0222f4daa6f81569577da915b73fba8ef3e0cddafb9aecef597659fd9"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.15/tessivum-0.1.0-alpha.15-aarch64-apple-darwin.tar.gz"
      sha256 "4f666541af5574b5c2007cf50a7cc5fe486bdb6c334777d85c02dc34c56ad24a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.15/tessivum-0.1.0-alpha.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9941e2006e93f04fddd50274293ff13f23cffbde78fc7ec4b74615432a00884"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.15/tessivum-0.1.0-alpha.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6e76928409a2158c8f5eb3f4313102f06e9072aaeb77f6731fa7520dac1d5f0b"
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
