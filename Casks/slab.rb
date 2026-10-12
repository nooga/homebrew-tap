cask "slab" do
  version "0.0.12"
  sha256 "47bf756e2ed174d885eb183253dc285d4db850ea3faebd4e39d5480c432b207b"

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
