class Legmacs < Formula
  desc "Terminal text editor scriptable in let-go, a Clojure-dialect Lisp"
  homepage "https://github.com/nooga/legmacs"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.5.0/legmacs_0.5.0_darwin_arm64.tar.gz"
      sha256 "c3d20ba9c229a789f3e530c90ec0602ec0f605e1554d1d3ff5cca1b26b55f4f0"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.5.0/legmacs_0.5.0_darwin_amd64.tar.gz"
      sha256 "45560d0bb5724f22b71f698f387e4926f535541ba597b9f3140155d81267e82b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.5.0/legmacs_0.5.0_linux_arm64.tar.gz"
      sha256 "d80acfa4adc23e2aef0d7de01220f1fc0430f8b5627bb56de23143b388eeb9c9"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.5.0/legmacs_0.5.0_linux_amd64.tar.gz"
      sha256 "d1ce5d7622cac6c3afb513311121ad021c88306c19930d64c87c9a9bb2267e69"
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
