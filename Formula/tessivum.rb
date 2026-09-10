class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.27/tessivum-0.1.0-alpha.27-x86_64-apple-darwin.tar.gz"
      sha256 "3b47d0a2bba488b54bec8bf35ae9b269947a2728a02a986de526b1ba78bc6f07"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.27/tessivum-0.1.0-alpha.27-aarch64-apple-darwin.tar.gz"
      sha256 "e7b30814614a675512dee994f07d7391dba55a8a9d2a879e50c51e0a63ee979c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.27/tessivum-0.1.0-alpha.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b3942188cd7b672e062805401cb8af430aeb85b7f670eb8edeac4a2daf65f4e"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.27/tessivum-0.1.0-alpha.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7e8218b5487ebf507b913cb635153013c03ce265950ddde801cd86607af1a7e"
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
