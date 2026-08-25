# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.5/ycode-v0.5.5-aarch64-apple-darwin.tar.gz"
      sha256 "5d33df1c02b2f433e1e7236cd274f8fee835cb01352c581747c1009f0e85e549"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.5/ycode-v0.5.5-x86_64-apple-darwin.tar.gz"
      sha256 "10083ff2cb32fa9d0592a3ef44fa9b2782d67b9122980c648eb4a37bbf24b295"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.5/ycode-v0.5.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4571f0748fb73d7b54ebc71dfd53aa31d9e37f72d790774e9dd6a0c46697b41c"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.5/ycode-v0.5.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "75fcb85906c7b3ed9ad338346a18f1090badd43250f58b354f89fd628f5afff3"
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
