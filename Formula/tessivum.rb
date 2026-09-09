class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.26/tessivum-0.1.0-alpha.26-x86_64-apple-darwin.tar.gz"
      sha256 "d8f25ee35949992ca3836b0c136967eadbf611cdbda1b452e5f2600c16d927b4"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.26/tessivum-0.1.0-alpha.26-aarch64-apple-darwin.tar.gz"
      sha256 "34224e21967ed18b8d452ed05dae8d0d2cfe629611a1fdaaae9d1805975e3705"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.26/tessivum-0.1.0-alpha.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b5ae292478f1ce575e5ff3a990db44a94f75a23b266151f084161faa6c8bc79"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.26/tessivum-0.1.0-alpha.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ac6fd43cd1fd3f91f25d0e63bd3cb9e350bb5af42f0215b3d724946ba7b0130"
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
