# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.2/ycode-v0.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "91b33b2bc297c19a032bafd9bcef99a3cb51279689af4b3cef5fef9061be9913"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.2/ycode-v0.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "e5b954545207186e787492f180cc529016cc2570090858a07e02a97a83d6c08f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.2/ycode-v0.5.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0e7001096f7212f1b7d43dd424546a65c69bb86e33344f04065917f9a75b75b"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.2/ycode-v0.5.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "53f02325dea87ca88ebd5fe421c3fcd4dfa6abeb9a40fc8ec667887df4ad2b81"
    end
  end

  # One formula, both frontends: `yara` for the terminal, `yara-gui` for the
  # window. Installing one without the other would defeat the point of them
  # mirroring each other.
  def install
    bin.install "ycode"
    bin.install "ycode-gui"
  end

  test do
    assert_match "ycode [PATH]", shell_output("#{bin}/ycode --help")
    assert_predicate bin/"ycode-gui", :exist?
  end
end
