class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.25/tessivum-0.1.0-alpha.25-x86_64-apple-darwin.tar.gz"
      sha256 "960efaf89ca1c749f3f130c588fed1c678fe6acb36dd62062221f5402bfb4f15"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.25/tessivum-0.1.0-alpha.25-aarch64-apple-darwin.tar.gz"
      sha256 "ad76af64367d97ad968e8116787a5b5b947fdcb1433a7f936a5a3fd87f22a1de"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.25/tessivum-0.1.0-alpha.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3bf1ed1a0951aa6e6de05e487aa6cdbe2f64448f2749607638c3a76765ba467c"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.25/tessivum-0.1.0-alpha.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6adc5957eb22b866c65831db691328d608e40d45d8d734fd4f1409dbf0f87d8d"
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
