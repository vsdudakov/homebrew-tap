# Homebrew cask for Yara Code, rendered by .github/workflows/release.yml and
# pushed to vsdudakov/homebrew-tap on every release.
#
# A cask rather than the formula, because only a cask may put an application in
# /Applications. A formula's post-install step runs in a sandbox that stops at
# Homebrew's own prefix, so the copy it tried to make never happened — and
# never said so.
#
# It reads the same archive the formula does; the bundle inside it is the whole
# install.
cask "yara-code" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.16"
  sha256 arm: "2789cbd99898726ae35dcdfbef2928189f3be7cefce849609e96505794c8e0bb", intel: "d23d02420b23a3ec393f7892782368ff257cc1b85f0f14282d24f778ec72cf00"

  url "https://github.com/vsdudakov/yara-code/releases/download/v#{version}/ycode-v#{version}-#{arch}-apple-darwin.tar.gz"
  name "Yara Code"
  desc "Lightweight code editor for agent-driven development: terminal UI and GPU window"
  homepage "https://github.com/vsdudakov/yara-code"

  depends_on macos: :big_sur

  app "ycode-v#{version}-#{arch}-apple-darwin/Yara Code.app"
  # Both commands come out of the bundle onto the PATH, the way Visual Studio
  # Code's cask hands over `code`: one install, and `ycode` works over SSH from
  # the same machine.
  binary "#{appdir}/Yara Code.app/Contents/MacOS/ycode"
  binary "#{appdir}/Yara Code.app/Contents/MacOS/ycode-gui"

  zap trash: [
    "~/.config/yara",
    "~/Library/Saved Application State/com.vsdudakov.ycode.savedState",
  ]

  # Homebrew quarantines what it installs, and macOS refuses to open a
  # quarantined bundle that carries no Developer ID — the dialog it shows
  # offers Move to Trash and nothing else, so there is no "open it anyway" to
  # fall back on. The flag comes off here, which is the same thing the user
  # would have to do by hand, said out loud in the caveats below rather than
  # done quietly.
  postflight do
    # Every file in the bundle, not only its root: the flag is set on all of
    # them, and this xattr has no recursive form of its own.
    system_command "/usr/bin/find",
                   args: ["#{appdir}/Yara Code.app", "-exec",
                          "/usr/bin/xattr", "-d", "com.apple.quarantine", "{}", ";"],
                   must_succeed: false
  end

  caveats <<~CAVEATS
    Yara Code is signed ad-hoc rather than with an Apple Developer ID, and is
    not notarised, so macOS would refuse to open it. This cask clears the
    quarantine flag on the copy it installs — the same step you would take by
    hand — and nothing else on the machine is affected.
  CAVEATS
end
