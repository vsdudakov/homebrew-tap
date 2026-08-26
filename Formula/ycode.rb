# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.12/ycode-v0.5.12-aarch64-apple-darwin.tar.gz"
      sha256 "68e7e99b52fc57d3094bbc9911e66c79a656763869a6e6669dfe7ed1dba4266e"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.12/ycode-v0.5.12-x86_64-apple-darwin.tar.gz"
      sha256 "aedab4fd5b933c16ba4aefa0a179cfafa97302783beb26724eb1c194e0e5b525"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.12/ycode-v0.5.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6aee5c39ab2cbdb7545694813d12e776d8d8cf79cd7efa7b1fecc076b96cf811"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.12/ycode-v0.5.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "458dc3a99c5ba8401d3b8973818ef85506da9f3da9c3532fda36c0f243c6e20a"
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
