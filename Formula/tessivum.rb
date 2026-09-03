class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.21/tessivum-0.1.0-alpha.21-x86_64-apple-darwin.tar.gz"
      sha256 "9f13fbc5ccb5097e909594c4538062a0803acc1b6c54a9bf305b11db8824c1b5"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.21/tessivum-0.1.0-alpha.21-aarch64-apple-darwin.tar.gz"
      sha256 "e5efacf6bf35e0f5eef7238a383b6be8196475959e3cc5f3433244a37a7ef547"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.21/tessivum-0.1.0-alpha.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29a91df27b615765ebe24b444cd0e77f07046f9dd99d296cc65830afde78fbd1"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.21/tessivum-0.1.0-alpha.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b4d5720b79dc4e5e89032061d4c2624456597355780ab811cd4bb9e9279ec649"
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
