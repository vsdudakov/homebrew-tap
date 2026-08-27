# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.16/ycode-v0.5.16-aarch64-apple-darwin.tar.gz"
      sha256 "2789cbd99898726ae35dcdfbef2928189f3be7cefce849609e96505794c8e0bb"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.16/ycode-v0.5.16-x86_64-apple-darwin.tar.gz"
      sha256 "d23d02420b23a3ec393f7892782368ff257cc1b85f0f14282d24f778ec72cf00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.16/ycode-v0.5.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c5ac72cd3a1dc16ce5c61756e16f457b0f3f68bbd902450afb47ffe407d5d404"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.16/ycode-v0.5.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "469beaf0a86e68487c2def7f86d4dd3eaafb964951c0be93cab4b5c79a00c953"
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
