class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"
  version "0.1.0-alpha.14"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.14/tessivum-0.1.0-alpha.14-x86_64-apple-darwin.tar.gz"
      sha256 "4e46656564b10ee5d0b9f20c044a7f201141408107f90db07f79cbf9ba3f73c8"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.14/tessivum-0.1.0-alpha.14-aarch64-apple-darwin.tar.gz"
      sha256 "dc318d028fed828ef218740ac2686547777f5206b544ba293b4f8185baff1531"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.14/tessivum-0.1.0-alpha.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db74b680a6f4fdccba5b6a14c1306fa2f09705281ec908249acee2985ff624e1"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.14/tessivum-0.1.0-alpha.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "119726067573c0b9525314add9f01ac087245f141a3a8c2a4ed35108da43d7d5"
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
