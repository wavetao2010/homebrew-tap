class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.17/tessivum-0.1.0-alpha.17-x86_64-apple-darwin.tar.gz"
      sha256 "a13cfcb398e80c3959eebf2193965ac37366e03a825f35d5c32eb379db3e9bce"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.17/tessivum-0.1.0-alpha.17-aarch64-apple-darwin.tar.gz"
      sha256 "3703ff9f3af47b87e54bfe9bdeb0fc4f98c8b689d461d85451c18cb700c9d5dc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.17/tessivum-0.1.0-alpha.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac462ea15deebbbf84a6c5ebcbc9d06cdf40cf5e7c4ace89a5e1f3bd9714f007"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.17/tessivum-0.1.0-alpha.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "45a4254030f2d9975cc4b1a6fbf0b448a9ef31bab02cb538bbc54bc4f60b97e6"
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
