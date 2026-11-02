cask "slab" do
  version "0.0.21"
  sha256 "2cffccf5e76a4c54b81d783faa190bee476331a2322114bc8d06803008ef28fe"

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
