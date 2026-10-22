cask "slab" do
  version "0.0.15"
  sha256 "d647da8eaf99680a7562a64529ef5daf807e281171d72b31cde71a3594b1d7d5"

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
