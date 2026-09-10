class Tessivum < Formula
  desc "Rust-native AI agent harness"
  homepage "https://github.com/wavetao2010/tessivum"

  depends_on "bun"
  depends_on "pnpm"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.29/tessivum-0.1.0-alpha.29-x86_64-apple-darwin.tar.gz"
      sha256 "4eb9ac96d83bc12df57f8dac30dda24aef1141c2a719d0fa92419c5338b5f2ef"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.29/tessivum-0.1.0-alpha.29-aarch64-apple-darwin.tar.gz"
      sha256 "1276f01e6a8d5dbc37ddcde2e933b72ce90082b3491f7680556a51494071add7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.29/tessivum-0.1.0-alpha.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef91ef62212157225aec7b20adb3c3955fb9dd66ca52228219aeb8863d7ec876"
    elsif Hardware::CPU.arm?
      url "https://github.com/wavetao2010/tessivum/releases/download/v0.1.0-alpha.29/tessivum-0.1.0-alpha.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "de0e28d5afcf82517eccad461e8df28d67cebff1ec359728be1a362d97897d3d"
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
