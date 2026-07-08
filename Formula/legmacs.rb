class Legmacs < Formula
  desc "Terminal text editor scriptable in let-go, a Clojure-dialect Lisp"
  homepage "https://github.com/nooga/legmacs"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.4.0/legmacs_0.4.0_darwin_arm64.tar.gz"
      sha256 "9ba1397b22e47df1442350fa8e6bf1038ad6b80587e663171a7ba4c1ae3df7f2"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.4.0/legmacs_0.4.0_darwin_amd64.tar.gz"
      sha256 "656ab3d52c73a8fc7b0602f5d602d4ae7af71715c277424ca60e094de0875bd0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.4.0/legmacs_0.4.0_linux_arm64.tar.gz"
      sha256 "9a5d540c7c09ef338685c072c278bc01c31808ac8af0135d7f5de7dd7fcf6856"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.4.0/legmacs_0.4.0_linux_amd64.tar.gz"
      sha256 "7b0ce74a450ba280b7241a74eaba9b754bc153864a7f632a4ce6a32f4a940ae6"
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
