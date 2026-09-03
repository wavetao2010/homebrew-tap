class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.22/tessivum-0.1.0-alpha.22-x86_64-apple-darwin.tar.gz"
      sha256 "d6298473ce316d2ae126df79415de053e352a4cfb8f8c831f53037217592e6c5"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.22/tessivum-0.1.0-alpha.22-aarch64-apple-darwin.tar.gz"
      sha256 "3453f581586aa1d6f30fd742ab88cedb706f14b490d5304faa33838b4d95bd3f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.22/tessivum-0.1.0-alpha.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d662203b7743ec99e2364195f774eb4ac9762cb7af9c7a999b0fe7fa68c6b9e2"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.22/tessivum-0.1.0-alpha.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ea261bbd8cde57f66a72a824857d1e8c7edf84149ebf3df1f28c28c1b2d64ddc"
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
