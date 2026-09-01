# Homebrew formula for Yara Code, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Terminal editor for the agent loop: your coding agent beside the diff of what it did"
  homepage "https://github.com/vsdudakov/yara-code"
  version "1.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.6.1/ycode-v1.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "e24d22353810a0afa85f6d8692adabc5000b3f1f1f21cbc913bd6c44a0315f3e"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.6.1/ycode-v1.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "91d78d7fadd75ea0f665682e3c89cf4480d9df684dde3617da1a282b46a5b881"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.6.1/ycode-v1.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5228214315920058fe511a86e9120af963f472a4578cadf7e3bb745507797ac5"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.6.1/ycode-v1.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb1a9492b21e2054387e27d21d4ee4d7eb0322262fa58824851b229bb00bfce7"
    end
  end

  def install
    bin.install "ycode"
  end

  test do
    assert_match "ycode", shell_output("#{bin}/ycode --version")
  end
end
