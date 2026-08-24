# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.4.0/ycode-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "a99041c556c27e2d3627dc1b7e4048fff82253861f68725a4d066d4758fa4635"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.4.0/ycode-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "71a48faf597ede04f32050747e15dacb8d1137330781e19929215424777fb9e0"
    end
  end

  on_linux do
    url "https://github.com/vsdudakov/yara-code/releases/download/v0.4.0/ycode-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c3447b1a8675d05b05355bfec2a78559e8d7598cf02149bd68f4446534616c0b"
  end

  # One formula, both frontends: `yara` for the terminal, `yara-gui` for the
  # window. Installing one without the other would defeat the point of them
  # mirroring each other.
  def install
    bin.install "ycode"
    bin.install "ycode-gui"
  end

  test do
    assert_match "ycode [PATH]", shell_output("#{bin}/ycode --help")
    assert_predicate bin/"ycode-gui", :exist?
  end
end
