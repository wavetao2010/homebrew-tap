class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.31/tessivum-0.1.0-alpha.31-x86_64-apple-darwin.tar.gz"
      sha256 "c25f1c36380559f29d7552ba00658b6144fa8a44f3aa45affb0a1095b9d75308"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.31/tessivum-0.1.0-alpha.31-aarch64-apple-darwin.tar.gz"
      sha256 "9f816c62a038b8a1c8ab1ff3b4a95ee6cd744269520014157312d56b29840d63"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.31/tessivum-0.1.0-alpha.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "37bd9062b5e434d49eb8fdbf20d12ff1b792e650a08c9ca68fcf7dbf60db46fb"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.31/tessivum-0.1.0-alpha.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "84ccca82333a1236c49739964950cdc28cb621e6165a51785b0d62f55c2cdca8"
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
