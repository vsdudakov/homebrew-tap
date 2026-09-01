# Homebrew formula for Yara Code, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Terminal editor for the agent loop: your coding agent beside the diff of what it did"
  homepage "https://github.com/vsdudakov/yara-code"
  version "1.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.4.1/ycode-v1.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "ea829acfc9eebf72e676e90be7355517c2d20e89b21f1f32db8c56eefed01160"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.4.1/ycode-v1.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "5b4b7ddf7cc7406fecf71f43163086d7b9444ed11f018d62c3952716ffd8cb7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.4.1/ycode-v1.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "769e696be110d74eeea8649ac5c09c055866bc2041004f916aed701604ec440c"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v1.4.1/ycode-v1.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "061e8622d43325c531ae3892f8b4df0d532a04a47f8ab64cc2ab91a89b8a038d"
    end
  end

  def install
    bin.install "ycode"
  end

  test do
    assert_match "ycode", shell_output("#{bin}/ycode --version")
  end
end
