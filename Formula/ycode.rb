# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.2.0/ycode-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "2e27146a7b331f59ef1aea92c5de17f2dcb992e4d2b663e058965bb846b5c14a"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.2.0/ycode-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "ddb633889513690b70e920f0f58e5e59e30c727203f7c6240ed528dbb5f4e59b"
    end
  end

  on_linux do
    url "https://github.com/vsdudakov/yara-code/releases/download/v0.2.0/ycode-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "325a73be431375c18511ffe9657169568ffac4877deecdddfa95ab5d0661276b"
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
