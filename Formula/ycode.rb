# Homebrew formula for Yara Code, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Terminal editor for the agent loop: your coding agent beside the diff of what it did"
  homepage "https://github.com/vsdudakov/yara-code"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.6.0/ycode-v1.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "fa846a7e79b98531f580294437e1d25311863fd60da7767da381b2f74d80cf4e"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.6.0/ycode-v1.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "a66071defa255ea6d1bfac95b61065ce482430b1c61873c1c5c7df5a1d8b8aaa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.6.0/ycode-v1.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "72c86e08860d7f1ee82f1c74fb3a24513ba48dc1756851faa0cb014676de759e"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.6.0/ycode-v1.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e10efe73a00c65aa07067f149fd2cc0fbc1865dd113d6c9d43c46c73e8ce5e1"
    end
  end

  def install
    bin.install "ycode"
  end

  test do
    assert_match "ycode", shell_output("#{bin}/ycode --version")
  end
end
