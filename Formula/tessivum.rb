class Tessivum < Formula
  desc "Tessivum AI agent"
  homepage "https://github.com/wavetao2010/tessivum"
  version "0.1.0-alpha.11"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.11/tessivum-0.1.0-alpha.11-x86_64-apple-darwin.tar.gz"
      sha256 "2638c448d1556ef96f866a6d2077fdd40f9748f3bbd185756bbe7edfd8a576b0"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.11/tessivum-0.1.0-alpha.11-aarch64-apple-darwin.tar.gz"
      sha256 "186cdac995d061f3e2d0fb0d733c8c7321e9c713a8f943197ab6b7d9e93f5637"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.11/tessivum-0.1.0-alpha.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "91ee3bd388bdb00921e5dde105e2ec917e79731b7ded6dcb4d43b629560a50fe"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.11/tessivum-0.1.0-alpha.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fadf6f74e4295a14946736ce21c11ba65799fc67ba14a36d00e684fb3c062ce3"
    end
  end

  depends_on "bun"
  depends_on "pnpm"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/tessivum"
  end

  test do
    system "#{bin}/tessivum", "--version"
  end
end
