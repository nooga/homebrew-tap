class Legmacs < Formula
  desc "Terminal text editor scriptable in let-go, a Clojure-dialect Lisp"
  homepage "https://github.com/nooga/legmacs"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.1.0/legmacs_0.1.0_darwin_arm64.tar.gz"
      sha256 "defb647d6a7c2f5aa3f964a518988de38d1c6d65bb10d379fa302a4809794fde"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.1.0/legmacs_0.1.0_darwin_amd64.tar.gz"
      sha256 "39d476d1a9416581ad26b364724f8f35f2c9ff76191b4eaf70c0c84f20b2a6f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nooga/legmacs/releases/download/v0.1.0/legmacs_0.1.0_linux_arm64.tar.gz"
      sha256 "66444e52bfbcfa9eaf36c8e60feaeefb232d623d15ee8b7ce86a32a7dffeb461"
    end
    on_intel do
      url "https://github.com/nooga/legmacs/releases/download/v0.1.0/legmacs_0.1.0_linux_amd64.tar.gz"
      sha256 "cf65f180b8782789fcf30d17be79264b010e43e5db08895be9e5b75816cecd0f"
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
