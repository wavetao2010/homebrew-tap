class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.16/tessivum-0.1.0-alpha.16-x86_64-apple-darwin.tar.gz"
      sha256 "b59e640da78f0b197b89a9e8b3825d96e63278a5af3b7005b3dec8a609c0acc1"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.16/tessivum-0.1.0-alpha.16-aarch64-apple-darwin.tar.gz"
      sha256 "f65f4ec829867b813c1bf098a7f3a6c1970aeb1ab86d90badc438d912c6f9579"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.16/tessivum-0.1.0-alpha.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69da1f4089bc243de883eff1020eeceb1b66da0b6272af64991761dc737d56f5"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.16/tessivum-0.1.0-alpha.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f216f26aad73866bb373196ff1b9a5f952d1852ab84c03b6bd7d6731710856d4"
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
