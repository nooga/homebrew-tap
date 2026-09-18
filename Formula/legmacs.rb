class Legmacs < Formula
  desc "Terminal text editor scriptable in let-go, a Clojure-dialect Lisp"
  homepage "https://github.com/nooga/legmacs"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.6.0/legmacs_0.6.0_darwin_arm64.tar.gz"
      sha256 "a1b2121d081319b410fe066ecf98faffb6fbb0f7385b1052502a1b5ec9d6cf0d"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.6.0/legmacs_0.6.0_darwin_amd64.tar.gz"
      sha256 "77c37014379fb805cbdb546cba429cfe6e77caccf7eac2b490e5e2f3109a9813"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.6.0/legmacs_0.6.0_linux_arm64.tar.gz"
      sha256 "8841d665d70efca1f9587da879f7ef87ac26d5d12a52e57b2e65cb3787d3a478"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.6.0/legmacs_0.6.0_linux_amd64.tar.gz"
      sha256 "a3733ae93d1f121ba6fe02df7f237ea2b8618cca2bc01e54b49ee0c0d264c15c"
    end
  end

  def install
    bin.install "legmacs"
  end

  test do
    # legmacs refuses to start without a TTY and exits 1; assert it
    # got far enough to print that message rather than crash.
    assert_match "terminal", shell_output("#{bin}/legmacs 2>&1", 1)
  end
end
