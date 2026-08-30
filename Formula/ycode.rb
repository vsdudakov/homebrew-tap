# Homebrew formula for Yara Code, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Terminal editor for the agent loop: your coding agent beside the diff of what it did"
  homepage "https://github.com/vsdudakov/yara-code"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.2.0/ycode-v1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "dbaf4a466b7abc66e546744eddf49561ac5b63f598ba9fb7e8d5d5d2c6896837"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.2.0/ycode-v1.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "be5eecfe008beb31941cfe7f71bbabccdf1fbd96ef9d7599a16f520c287b60d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.2.0/ycode-v1.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2354b4c878bfb70eb363f9403be011b12b85d220dd6a9a54b928370c49f783a6"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.2.0/ycode-v1.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b13f59df0fa551fd90996d67ec237136957a0f94a47b5475f9400723692ba083"
    end
  end

  def install
    bin.install "ycode"
  end

  test do
    assert_match "ycode", shell_output("#{bin}/ycode --version")
  end
end
