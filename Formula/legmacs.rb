class Legmacs < Formula
  desc "Terminal text editor scriptable in let-go, a Clojure-dialect Lisp"
  homepage "https://github.com/nooga/legmacs"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.6.2/legmacs_0.6.2_darwin_arm64.tar.gz"
      sha256 "ed3fcc71c27afac78a9e991b5eb277a40f96ac30ffe438d6e6359a783ebe3b09"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.6.2/legmacs_0.6.2_darwin_amd64.tar.gz"
      sha256 "042c3bbe353292fbe868e6573a537c08bd88716c7cb657bd807e68e4bf997304"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.6.2/legmacs_0.6.2_linux_arm64.tar.gz"
      sha256 "897c74a3e8a8f9b75bad2213d12d81ad59ed4fc576c8f5b4809600218934c4da"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.6.2/legmacs_0.6.2_linux_amd64.tar.gz"
      sha256 "192b991810b43586753767ec2c3ebfb22eb577a84b85bb6f1316b0a30834d7b8"
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
