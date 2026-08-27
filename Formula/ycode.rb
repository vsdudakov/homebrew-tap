# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.17/ycode-v0.5.17-aarch64-apple-darwin.tar.gz"
      sha256 "cd4c340788535e3a4d33c3443801035581e17d133b5f0a861606f06953e9a7ca"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.17/ycode-v0.5.17-x86_64-apple-darwin.tar.gz"
      sha256 "4cf1afb9c4da51d0f639451febc39be81da31bc3297b3fd94f9b3f0839f102d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.17/ycode-v0.5.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9bccbb8278e53e01c37d556db14df2da8d7eba5941a16bb9d18440887375160c"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.17/ycode-v0.5.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8dc8a2cb6dfc69762344c6d386bc9996cefc9ab64a68f96348f94b63889921fa"
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
