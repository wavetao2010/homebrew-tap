class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"
  version "0.1.0-alpha.12"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.12/tessivum-0.1.0-alpha.12-x86_64-apple-darwin.tar.gz"
      sha256 "4122dd79f6a307637b8735e409bed1257790566b5d750f42d76dd11dfa24849d"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.12/tessivum-0.1.0-alpha.12-aarch64-apple-darwin.tar.gz"
      sha256 "8f8d038274812daa7c7ae268aa6d5846a1f135569bb01dc72444d0843b247f8b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.12/tessivum-0.1.0-alpha.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "666590612388cd065228cd93d898585772b6e3a6090a254e02fb10b29fc3ec8e"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.12/tessivum-0.1.0-alpha.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6af064f384e2ad9de5dd03e25235adb3e499ee05edee36b7dfc491f278f2c1ec"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/tessivum"
  end

  test do
    system "#{bin}/tessivum", "--version"
  end
end
