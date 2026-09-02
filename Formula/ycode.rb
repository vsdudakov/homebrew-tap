# Homebrew formula for Yara Code, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Terminal editor for the agent loop: your coding agent beside the diff of what it did"
  homepage "https://github.com/vsdudakov/yara-code"
  version "1.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.6.2/ycode-v1.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "5767da1e86457ff789b59b2c68920ba3917af30b193f0e3c5cb3d7b95df0ad28"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.6.2/ycode-v1.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "5a138019cb4e7656866fc29abfb10596b9d2efe659ab4ca202f38c4debddf0ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.6.2/ycode-v1.6.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b672ffd190b71f8cb7bc0c8112d81a80431fdd1c4ccf3c53bfdb3743fa9dbb43"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.6.2/ycode-v1.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f167d653c3b98dc40011e1e3685ac9fb01b90397a8b3169495366e3755d1d762"
    end
  end

  def install
    bin.install "ycode"
  end

  test do
    assert_match "ycode", shell_output("#{bin}/ycode --version")
  end
end
