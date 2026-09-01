# Homebrew formula for Yara Code, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Terminal editor for the agent loop: your coding agent beside the diff of what it did"
  homepage "https://github.com/vsdudakov/yara-code"
  version "1.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.5.1/ycode-v1.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "025d00050f0dc4880709b0b80ee596e04f278cbcf67ad8a0144f38c363af88cc"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.5.1/ycode-v1.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "f16426d54b5177a785c9a90e8800a7a5909b0458333590c4ae4926a8c596153a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.5.1/ycode-v1.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "18d59e54d464ec675c803d5dad45490bdf1557b4ce69217da20888fe377ad2ad"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.5.1/ycode-v1.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fee7af313c309a0f6480c5d4c47415820881af98711f82a9eb21108cd23f4849"
    end
  end

  def install
    bin.install "ycode"
  end

  test do
    assert_match "ycode", shell_output("#{bin}/ycode --version")
  end
end
