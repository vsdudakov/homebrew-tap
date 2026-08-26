# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.9/ycode-v0.5.9-aarch64-apple-darwin.tar.gz"
      sha256 "07eb59149fd2f785f6da4eb7f0b2cf63ddca356792b5e763831717c0c5cd4c80"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.9/ycode-v0.5.9-x86_64-apple-darwin.tar.gz"
      sha256 "04bc26674c61d040995959c283d03fbd6f2452a0f5619a83cd42884474f14efb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.9/ycode-v0.5.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d255ab28b23e9b33ea8d0dd1538f126981d96b09c50d80bf77ad5f549348f892"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.9/ycode-v0.5.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d669edd782184a748ddd1cbe762dc177ee94dcc4ee52d3b9b7ff0a04dcded111"
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

  # Homebrew keeps its own tree, and an application is only an application once
  # Finder and Spotlight can see it. A copy rather than a link: Homebrew's own
  # casks stopped linking years ago because Launch Services indexes what it can
  # see, and a symlinked bundle is not it. An upgrade replaces it wholesale.
  def post_install
    return unless OS.mac?

    applications = Pathname.new("/Applications")
    return unless applications.writable?

    installed = applications/"Yara Code.app"
    FileUtils.rm_rf(installed)
    system "/usr/bin/ditto", prefix/"Yara Code.app", installed
  end

  def caveats
    return unless OS.mac?

    <<~CAVEATS
      Yara Code.app is in /Applications — open it from the Dock or from
      Spotlight. It is signed ad-hoc rather than with an Apple Developer ID, so
      the first open reports an unidentified developer: allow it once in
      System Settings → Privacy & Security.

      Uninstalling leaves that copy behind; remove it with
        rm -rf "/Applications/Yara Code.app"
    CAVEATS
  end

  test do
    assert_match "ycode [PATH]", shell_output("#{bin}/ycode --help")
    assert_predicate bin/"ycode-gui", :exist?
  end
end
