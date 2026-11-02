cask "slab" do
  version "0.0.20"
  sha256 "e6eccbda4d1bd7eb0ece510c90d3b456fbcfcbdbf6b3b982c02548b3201a21ac"

  url "https://github.com/nooga/slab/releases/download/v#{version}/Slab.zip"
  name "Slab"
  desc "Livecoded audio workstation whose machines are written in fy"
  homepage "https://github.com/nooga/slab"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Slab.app"

  # Signed ad hoc, not notarized: without this Gatekeeper refuses the
  # quarantined app until Privacy & Security > Open Anyway.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Slab.app"]
  end

  # No zap: ~/Music/Slab holds the user's projects, library and takes
  # recorded into unsaved projects (Cache/recordings).
end
