# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.8/ycode-v0.5.8-aarch64-apple-darwin.tar.gz"
      sha256 "81ede659b31bafaee97affb789f3714684fefdb925877cc3633b75a7d8c7445c"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.8/ycode-v0.5.8-x86_64-apple-darwin.tar.gz"
      sha256 "abded14fdf210deabded48a5893cd01d94545d173dd159dcda9febc7bbac7c75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.8/ycode-v0.5.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "04fb16d34fc3041523371d93e74efdb374d9ee8ecb0d0248076e0df5a5b0e1a3"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.8/ycode-v0.5.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9bd94db63acd047ff8d43f51be6e21e4da5f3e9e70ba2bdcc240c6c6d569185f"
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
