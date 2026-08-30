# Homebrew formula for Yara Code, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Terminal editor for the agent loop: your coding agent beside the diff of what it did"
  homepage "https://github.com/vsdudakov/yara-code"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.0.0/ycode-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "ef1761ac9d4ce4b8833cab81f7b174c0d1bcdb40d3eb588782cb989ed18fa293"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.0.0/ycode-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "befeb64b46e7c656f54fcbc5ffa1d76f3c52c3e4bdd86300e575d70672bd3eda"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.0.0/ycode-v1.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fef48a2f3bc348c8d11e773ea6339a7c441164c81858b365fc9dd46a3d1e3ce9"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.0.0/ycode-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f8ee5649fcd851837570f2ae2121bd726514663415471dfe2b353fee06eecca"
    end
  end

  def install
    bin.install "ycode"
  end

  test do
    assert_match "ycode", shell_output("#{bin}/ycode --version")
  end
end
