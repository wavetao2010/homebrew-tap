class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.24/tessivum-0.1.0-alpha.24-x86_64-apple-darwin.tar.gz"
      sha256 "944179b1bb5f32d37b09df4cbcd9aca6a0898ebb04414f8e58ef053d5a866566"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.24/tessivum-0.1.0-alpha.24-aarch64-apple-darwin.tar.gz"
      sha256 "e2bba2302e4b1bcd6c1571b5e770ef01d395027fda2dd68fca24ad0764ec933e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.24/tessivum-0.1.0-alpha.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b046985e7594dd40b89241f6040fadd8e1f0e3138bc86567aa186ff34289071b"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.24/tessivum-0.1.0-alpha.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1301eec3e8f4d8230da00351c66093a568b588422f51282c669b572635a3972f"
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
