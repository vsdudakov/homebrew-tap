# Homebrew formula for Yara Code, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Terminal editor for the agent loop: your coding agent beside the diff of what it did"
  homepage "https://github.com/vsdudakov/yara-code"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.3.0/ycode-v1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "625a75514e0d9a33d644dcbcb1be8f06059c73127e55765a59633d426e6296b1"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.3.0/ycode-v1.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "16ed39dc2c16f3f8053dcbb50bad3752e135992dd37d35bb23cd29d120dbae72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.3.0/ycode-v1.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4d34b8538050920ccef911cbef6be33a18f091a810cb6e2713cacfd79609aafb"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.3.0/ycode-v1.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c462a92fa6b0c14ad8a8371dc7c69626d13f3e1fb5ac504cd86b36573214861"
    end
  end

  def install
    bin.install "ycode"
  end

  test do
    assert_match "ycode", shell_output("#{bin}/ycode --version")
  end
end
