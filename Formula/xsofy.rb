class Xsofy < Formula
  desc "Roguelike written in let-go where the magic system is Lisp"
  homepage "https://github.com/nooga/xsofy"
  url "https://github.com/nooga/xsofy/archive/refs/tags/v0.0.2.tar.gz"
  version "0.0.2"
  sha256 "6677697bab5e8f0ea421692221e9f14e9626cb28dfbd91c51ba1a904ee7a31cd"
  license "MIT"

  depends_on "nooga/tap/let-go"

  def install
    libexec.install "main.lg", "xsofy"
    (bin/"xsofy").write <<~EOS
      #!/bin/sh
      cd "#{libexec}" || exit 1
      exec "#{Formula["let-go"].opt_bin}/lg" main.lg "$@"
    EOS
  end

  test do
    assert_path_exists libexec/"main.lg"
    assert_path_exists libexec/"xsofy/title.lg"
  end
end
