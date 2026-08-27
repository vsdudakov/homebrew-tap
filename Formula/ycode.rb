# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.15/ycode-v0.5.15-aarch64-apple-darwin.tar.gz"
      sha256 "311541e4764b7f3d16301c1ee1136340d15da836bfb9ea5e38faf1b8d4c0fb87"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.15/ycode-v0.5.15-x86_64-apple-darwin.tar.gz"
      sha256 "2473b5d32acf92f5e58263df7cf8cd834f407415bdc12497b3d3d3ef2c702f78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.15/ycode-v0.5.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "29ac9a682bbf2804929d2051ae6415b198ebac4ce0f1fb9eaff10e358d7c5670"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.15/ycode-v0.5.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eb090fc4cb216a6bbecee4864426b8f42998bf3b96ea3e56bb9eec2792964d0f"
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
