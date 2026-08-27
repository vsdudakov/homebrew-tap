# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.13/ycode-v0.5.13-aarch64-apple-darwin.tar.gz"
      sha256 "3bc1473f06118c9a7dacbede161e11f01deace6e670ffa2fadddd059ab0d8b5d"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.13/ycode-v0.5.13-x86_64-apple-darwin.tar.gz"
      sha256 "4974748faf17ec225e7f5278ea70ad28f65f12b4f15ba0e85a549cc491f4abf7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.13/ycode-v0.5.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8e2af1e7d8cbd12209e172ae34de146d4798220cdfdcedd53279d11f68091f58"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.13/ycode-v0.5.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0cf335ce6d38dd9b170ac57c7be504aa44c3db0d0ee26d8d9c87dafa0870e19c"
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
