# Homebrew formula for Yara Code, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Terminal editor for the agent loop: your coding agent beside the diff of what it did"
  homepage "https://github.com/vsdudakov/yara-code"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.5.0/ycode-v1.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "cda6af8eb21c92a3edeecf6a60df54f7cd59df70ae14df3f25c26d3e2f38dd9c"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.5.0/ycode-v1.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "5ef83549901e3d6b994ee5ab124ed2ee33d5d86250399cbf3a232967ab0580cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.5.0/ycode-v1.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ac02c550ccb7bbf995881dfe100cbca3a79f8c27cc7adb25bcc7d661657cbfe6"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.5.0/ycode-v1.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f13806e47fa3a9796a042e1322305ef1e1bc8768eab8ced6a505949e2990ff3b"
    end
  end

  def install
    bin.install "ycode"
  end

  test do
    assert_match "ycode", shell_output("#{bin}/ycode --version")
  end
end
