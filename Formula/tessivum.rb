class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.28/tessivum-0.1.0-alpha.28-x86_64-apple-darwin.tar.gz"
      sha256 "e54bc295ff04020cd4ea9fd043f4e2527c132a710f4fa4cf0cc66658177acb1d"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.28/tessivum-0.1.0-alpha.28-aarch64-apple-darwin.tar.gz"
      sha256 "107855fd0a2a665c9141893d72cd1a775175f03ee3e127230ca576a98a8987b9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.28/tessivum-0.1.0-alpha.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3a51c5b31421586f621b4ddebbb338f09d4152d7db75d6719cee5cb45504bf0"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.28/tessivum-0.1.0-alpha.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a25495f10611c1ebe92a9304860b1e34ebc9dd7dabc8d0016d8315f79b162b9f"
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
