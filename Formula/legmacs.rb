class Legmacs < Formula
  desc "Terminal text editor scriptable in let-go, a Clojure-dialect Lisp"
  homepage "https://github.com/nooga/legmacs"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.3.0/legmacs_0.3.0_darwin_arm64.tar.gz"
      sha256 "605ef018c38e760b457c9880fe94d9a9ba5864ce68e999fa63afe3385b283404"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.3.0/legmacs_0.3.0_darwin_amd64.tar.gz"
      sha256 "a9dc829e0729ee31a6260d07945e0ca6aba24685b703e3ee083cd4c30dfe6127"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.3.0/legmacs_0.3.0_linux_arm64.tar.gz"
      sha256 "68538fd5f5cb3bad45698094ead7ef440381e2e33a46fe23cb0dbb856b6825f2"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.3.0/legmacs_0.3.0_linux_amd64.tar.gz"
      sha256 "fd330b9b6dd6ed96c7efb826a0c579578a10af344a8f9e5c3fc64a1590944f01"
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
