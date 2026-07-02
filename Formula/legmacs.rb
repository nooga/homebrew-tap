class Legmacs < Formula
  desc "Terminal text editor scriptable in let-go, a Clojure-dialect Lisp"
  homepage "https://github.com/nooga/legmacs"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.2.0/legmacs_0.2.0_darwin_arm64.tar.gz"
      sha256 "9a6d3e1bbd5a9ed12c161032d145b5ff48406e6ae214fd2168644e9e55de2fbd"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.2.0/legmacs_0.2.0_darwin_amd64.tar.gz"
      sha256 "8fe5aab9c980f9bcfec14a95f2fc187b2a7dcacc624f4cc6ee18541b523b3810"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.2.0/legmacs_0.2.0_linux_arm64.tar.gz"
      sha256 "a9214a0b7760a0d3f714c445f21b4db86f84e819ac36fec6919775169858b088"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.2.0/legmacs_0.2.0_linux_amd64.tar.gz"
      sha256 "a432b9506c9f81a9ea920dae29c8957a7138ceab36a323f652a5152e2a5debd7"
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
