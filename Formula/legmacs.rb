class Legmacs < Formula
  desc "Terminal text editor scriptable in let-go, a Clojure-dialect Lisp"
  homepage "https://github.com/nooga/legmacs"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.6.1/legmacs_0.6.1_darwin_arm64.tar.gz"
      sha256 "73511cd966a2c0f38492c4c97916dbfcbfb8347bb384f1c8cc6af85af22578d7"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.6.1/legmacs_0.6.1_darwin_amd64.tar.gz"
      sha256 "caa7612ab703400e058353d4034edece4bde81523cd107fd4184cd2a3ec75a98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.6.1/legmacs_0.6.1_linux_arm64.tar.gz"
      sha256 "3055b62368a9bbce9e2e2be9155138e9bcf56b9417e4481a5569a66b9f801e95"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.6.1/legmacs_0.6.1_linux_amd64.tar.gz"
      sha256 "eead4aa4b4cd54dcd7503c54f7ddeb2a70dd83f7c5787712112f29a1598aff50"
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
