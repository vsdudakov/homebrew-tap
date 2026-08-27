# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.14/ycode-v0.5.14-aarch64-apple-darwin.tar.gz"
      sha256 "88306c203739c1a15c9b5f94162b3a50b5ec6c37de38bd2561e122dcfcd2af56"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.14/ycode-v0.5.14-x86_64-apple-darwin.tar.gz"
      sha256 "3af50b337b86864aa456fd6b7611eac6d2c5323e126b36dfac2c0ea7995375cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.14/ycode-v0.5.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7cdace28b4e521cdfbe40c1b4396ef7dc86cd8ba052b5f5298828d67443f29a0"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.14/ycode-v0.5.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32a710eff3efbd2b631b56929a4a57f69c8e1b7249ea5ea2c4cb24cf25a0d762"
    end
  end

  # One formula, both frontends: `ycode` for the terminal, `ycode-gui` for the
  # window. Installing one without the other would defeat the point of them
  # mirroring each other.
  #
  # On macOS the two commands live inside "Yara Code.app", which is what
  # carries the icon and the name the menu bar shows, so the bundle is what is
  # installed and the commands are linked out of it.
  def install
    if OS.mac?
      prefix.install "Yara Code.app"
      bin.install_symlink prefix/"Yara Code.app/Contents/MacOS/ycode"
      bin.install_symlink prefix/"Yara Code.app/Contents/MacOS/ycode-gui"
    else
      bin.install "ycode"
      bin.install "ycode-gui"
    end
  end

  # No copy into /Applications from here. A formula's post-install step runs in
  # a sandbox that stops at Homebrew's own prefix, so a copy attempted from one
  # never lands and never says why; putting an application where Finder can see
  # it is a cask's job, and there is a cask beside this formula that does it.
  def caveats
    return unless OS.mac?

    <<~CAVEATS
      This installs the two commands. For Yara Code as an application — in
      /Applications, with its icon, in the Dock and in Spotlight — install the
      cask instead:

        brew uninstall ycode && brew install vsdudakov/tap/yara-code
    CAVEATS
  end

  test do
    assert_match "ycode [PATH]", shell_output("#{bin}/ycode --help")
    assert_predicate bin/"ycode-gui", :exist?
  end
end
