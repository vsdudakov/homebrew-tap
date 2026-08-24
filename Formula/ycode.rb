# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.3/ycode-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "eebac92c3fa445973d237bdaa3e4d5966e2f700168491fa27073bee24d689e9a"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.3/ycode-v0.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "a5b4fd3cb72eb4bae4af8f42a9ecfa464acc3def221d1af187acecd93c5021a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.3/ycode-v0.5.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b5581b8e3fd88cc52663f7dc69db353017ac5d3ce1420843fd1a128a9f64b4c0"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.3/ycode-v0.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a42631f59aaf7e08c1187fde532177b9104fc6fdcc300982322be6dd6d625294"
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
