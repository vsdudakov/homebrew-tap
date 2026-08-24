# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.0/ycode-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "74b6b8000a759e4846cca6240d2e22e2886ac00e1dfe06058fe8d5a6454c206a"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.0/ycode-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "c263eebece1e57b99aa2eef09677f9dfbfa6e226ba28aa24bb240a793f6358f5"
    end
  end

  on_linux do
    url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.0/ycode-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d054f38f52760d762d1c11856c7363dedb78e806a1957968b43a857fcec2cf98"
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
