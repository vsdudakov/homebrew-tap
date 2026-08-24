# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.1/ycode-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "871016912a17f6a38d45cc28a56fa700261d03a99888c86fae9f621adb73e0ac"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.1/ycode-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "b23e05c52e52bcafc7ab1004ccde050cdc1a5434b29a37ea42b198d245c9ec6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.1/ycode-v0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b2d634d3e55bc10cdd7b871eb9feb38e8c044d7742b3e6d8e35de79a5a2ab4c"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.1/ycode-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e322c666224aefa3933787324d9a4b89303098742d142e69cfb9b2de0bde7364"
    end
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
