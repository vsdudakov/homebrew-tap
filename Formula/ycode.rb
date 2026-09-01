# Homebrew formula for Yara Code, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Terminal editor for the agent loop: your coding agent beside the diff of what it did"
  homepage "https://github.com/vsdudakov/yara-code"
  version "1.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.5.2/ycode-v1.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "baaebcb1d26f22847ddbd6f4697a45544f7d32e936d15270770e98d3a9fa7c98"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.5.2/ycode-v1.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "32d95560903bad0671f4e069b846929b2be6f56407ef8c5d7d61a974e96cdeec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.5.2/ycode-v1.5.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da44a18fa00455077fb222dca796ec471b949d837bfc601a876a88fe40c9fc30"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.5.2/ycode-v1.5.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5000db16b0a61acbaee401673c494ef572ecdfc9615967e057a65be814cd4b68"
    end
  end

  def install
    bin.install "ycode"
  end

  test do
    assert_match "ycode", shell_output("#{bin}/ycode --version")
  end
end
