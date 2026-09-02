class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.20/tessivum-0.1.0-alpha.20-x86_64-apple-darwin.tar.gz"
      sha256 "04ff7914f128c640fab0e8cc283003efea25406d3618c2b67a0569829a763a9c"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.20/tessivum-0.1.0-alpha.20-aarch64-apple-darwin.tar.gz"
      sha256 "21a5980d05a8100a3d4e6b8448ac9c7124c4f8e30e33cda80e22911d0dc82308"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.20/tessivum-0.1.0-alpha.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "995924951e7223c054553a49adb694a874d700c0e6499b75b05b7a8f13e9f5f1"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.20/tessivum-0.1.0-alpha.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c75ebf32775f0c7523b86d7c29ef56ce219aa5cd99b6499ce588b4fcd147a87b"
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
