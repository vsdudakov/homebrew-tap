# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.6/ycode-v0.5.6-aarch64-apple-darwin.tar.gz"
      sha256 "702d757dc6378e93ae07fb358e7d0f2d76cbb0579e5e12ae534d03cdf385a70f"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.6/ycode-v0.5.6-x86_64-apple-darwin.tar.gz"
      sha256 "fdbe12150ad20929ff0d148ce459931c685dd1bb95e19b5c71970c18dfbed577"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.6/ycode-v0.5.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d8f6782f7c3635628d5def2c52efb3150c757dfef7732a1007ee05652d51633"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.6/ycode-v0.5.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac0942105079efbca19b93c60a212198deb81d34090de1e82c023f35a6a802a2"
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
