class Legmacs < Formula
  desc "Terminal text editor scriptable in let-go, a Clojure-dialect Lisp"
  homepage "https://github.com/nooga/legmacs"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.5.1/legmacs_0.5.1_darwin_arm64.tar.gz"
      sha256 "f81c7f34f15c2f9a0aa13e258ead7837fb22a40446945960a6326135dce7fd22"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.5.1/legmacs_0.5.1_darwin_amd64.tar.gz"
      sha256 "e7962432cd762a39e783e0e0e9b72ee8f1a0aaf252fc203fe4103e07eaa15cd0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.5.1/legmacs_0.5.1_linux_arm64.tar.gz"
      sha256 "72084f574673a3394848b92b5ea420c85591a36bde536131a166ea7edd952c2f"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.5.1/legmacs_0.5.1_linux_amd64.tar.gz"
      sha256 "0738618dfca401ca6d0ae70519a24c314d67751485e1f5450265386cf0673b68"
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
