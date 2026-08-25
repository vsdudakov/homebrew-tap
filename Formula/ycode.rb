# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.7/ycode-v0.5.7-aarch64-apple-darwin.tar.gz"
      sha256 "6f4ea3528020e0c5a5bb9d6272bb9b0ec5ebb154b36e51dcc6774fceae1a5341"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.7/ycode-v0.5.7-x86_64-apple-darwin.tar.gz"
      sha256 "73a5134a58604086dbd1f0973fd0e3cb4ff3ee27fac482d51f7dbf83a877a21e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.7/ycode-v0.5.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2d93c7a6924650b486c1c718e7fc819e177d1e239d2b23b601f151c961f1ac3a"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.7/ycode-v0.5.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cce0e42e7a935564cd3366dfd31cd471c3aab6cb0382cecdecab8a6e98d580bd"
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
