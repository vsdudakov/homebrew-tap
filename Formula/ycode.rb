# Homebrew formula for Yara, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
class Ycode < Formula
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"
  version "0.5.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.18/ycode-v0.5.18-aarch64-apple-darwin.tar.gz"
      sha256 "7ead0097e26d9a71aa5111d16ad6699429c889459f85f780d4730cb95c5c3fe0"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.18/ycode-v0.5.18-x86_64-apple-darwin.tar.gz"
      sha256 "f6a20cbac853b3611659e39b4eb59e7d9c2ab9f63a5267776aa34e9a4358164d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.18/ycode-v0.5.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0fa2d3d04ebe002fd192cfc39dde0437dad6d1c5185ae4bb1f95adcc2c969c89"
    end
    on_intel do
      url "https://github.com/vsdudakov/yara-code/releases/download/v0.5.18/ycode-v0.5.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3b05e87eacdccd6b83cb5ad88cee8ac9b05237f8c9ba1df98f5e97a6ae0eda9"
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
