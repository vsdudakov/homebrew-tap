# Homebrew formula for Yara Code, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Terminal editor for the agent loop: your coding agent beside the diff of what it did"
  homepage "https://github.com/vsdudakov/yara-code"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.4.0/ycode-v1.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "c9a0ec85152d90f46c22c7db1382b2c646ece36433baf7fd42c498160cf8a808"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.4.0/ycode-v1.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "aaca1d307e3fd76821fefa77dde3e8c7bb12ac3fbf2c9da9f9874c7d38951267"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.4.0/ycode-v1.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "307c18c8d40d364a60b00dda1c00a9a24d83bec54db853d317cfc26259ce96ef"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.4.0/ycode-v1.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7048b5e6b6346f9fe02fd6654fb4ca869bd1efe678de039996bd6c8062208e16"
    end
  end

  def install
    bin.install "ycode"
  end

  test do
    assert_match "ycode", shell_output("#{bin}/ycode --version")
  end
end
