class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.23/tessivum-0.1.0-alpha.23-x86_64-apple-darwin.tar.gz"
      sha256 "6bb1220182b1c4cec0814ba756baca0a5c0fdb30879af50c0e3bd787ee10269b"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.23/tessivum-0.1.0-alpha.23-aarch64-apple-darwin.tar.gz"
      sha256 "b1b9ad169c5e53fc25360ae81388a6acd012cb12267ebff1bdc5975598f7abd6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.23/tessivum-0.1.0-alpha.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "860ef3769cad7846b992b134faf650c79a9ad4c7fb3ebc9254c8c68a455866b7"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.23/tessivum-0.1.0-alpha.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0cbbd34ddc838333c89b3afda66c89e932f5947490c50e3cf847657be3f7f95c"
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
