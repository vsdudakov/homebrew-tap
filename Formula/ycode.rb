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
      sha256 "26d59d77e9aa0f24e94f67fdd49cbb39cc2f437b0f0ba97f22f2bf1fe5174e2c"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.6.2/ycode-v1.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "4f1e4171bcb2b009a4e393e32e160ad5478207d564289c27cb58ba1a715cda37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.6.2/ycode-v1.6.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9dd5878e45f368f6e9b40857a831c4d90fbb7a71f35242a3f67fda9da1704c42"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.6.2/ycode-v1.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "038e4d3db8299508b070e8665ccf9a18c92525fca3c0a63e8e86cba14e475c03"
    end
  end

  def install
    bin.install "ycode"
  end

  test do
    assert_match "ycode", shell_output("#{bin}/ycode --version")
  end
end
