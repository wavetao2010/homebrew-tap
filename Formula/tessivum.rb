class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.18/tessivum-0.1.0-alpha.18-x86_64-apple-darwin.tar.gz"
      sha256 "48ef75e887f2a1392e5e9c0655a140f6d3cc030447c358925eb237303e8234ac"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.18/tessivum-0.1.0-alpha.18-aarch64-apple-darwin.tar.gz"
      sha256 "89d64140b65270f365dbab13e64f518c06b5d61562f60d6bf3243d86aeb9d9ed"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.18/tessivum-0.1.0-alpha.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb4744fc5a408695b73ff76e0f6d24dda30486e175b376d395ad1a0ef5d4184c"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.18/tessivum-0.1.0-alpha.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1269d71db1cfb49681eeb5e6c9f1d65836619a1a85edc8b9d0e68681f523bc3a"
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
