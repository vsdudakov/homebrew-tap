# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.4/ycode-v0.5.4-aarch64-apple-darwin.tar.gz"
      sha256 "5ccfde7fd7b3e7bed1166f5ef92854b692a8a6ce93e46955ae8c14364527f2a8"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.4/ycode-v0.5.4-x86_64-apple-darwin.tar.gz"
      sha256 "7594fea4a90906cc47591e14220bd235ea3b6408e6e2005e54cadaaf7dca39f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.4/ycode-v0.5.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0131517bbe2c34698d861d45f7d5b2d9dfb3f490ef9306182a5c6f2a8f445df8"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.4/ycode-v0.5.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cf5809904f5c4110aec8b6cae625aeacc93794b99c02bc31db898c3003849e9c"
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
