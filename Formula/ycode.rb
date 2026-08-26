# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.10/ycode-v0.5.10-aarch64-apple-darwin.tar.gz"
      sha256 "a5a589156b64e07e9d0478af77718bf1637a9f82eb204d0314c89798f034bd88"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.10/ycode-v0.5.10-x86_64-apple-darwin.tar.gz"
      sha256 "a1628a298c202bb54246e3029f2faf9d3b6cdfe6114cb70e321af6f92c591657"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.10/ycode-v0.5.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9ed34985cfa56ea7c34e551d999756df069344c556f1201f76663c708e3f6c1c"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.10/ycode-v0.5.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dae0e606277a048bf8f47c469ad51c5ab9414bdb169d52cd71f7127cad318f58"
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
