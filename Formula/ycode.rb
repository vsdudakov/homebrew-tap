# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.3.0/ycode-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "62da4a5452958d321f0dc9208e7510369db0aa6bc9ff3cc8a9f21a7f9247dc9d"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.3.0/ycode-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "7b67d2b60b4c569a67747015e5bca3da56968489f5177ee0444f2cb766541725"
    end
  end

  on_linux do
    url "https://github.com/vsdudakov/yara-code/releases/download/v0.3.0/ycode-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d3ea9224febe7179ba7e1a5f918d2fd8fc6c4a28f389c9a3c733d5a3548205fd"
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
