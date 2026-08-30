# Homebrew formula for Yara Code, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Terminal editor for the agent loop: your coding agent beside the diff of what it did"
  homepage "https://github.com/vsdudakov/yara-code"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.1.0/ycode-v1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "ddda5fce9484b57af7c28fdbc54867d5f94409f942eb3675a5c495205d959990"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.1.0/ycode-v1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "6d3d4568b9080c623a8a0e974d0c4dadf8ad2ac9db39f4b9b13dd9f6e9704aad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.1.0/ycode-v1.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "306ce327980ee12fab31e6cc8d890bf849816a3d75eacee2ce095305b5fd97ed"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.1.0/ycode-v1.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ab2d9809f894e49506428ac5306011ef423e611cac2e109cfd2449276777e95b"
    end
  end

  def install
    bin.install "ycode"
  end

  test do
    assert_match "ycode", shell_output("#{bin}/ycode --version")
  end
end
