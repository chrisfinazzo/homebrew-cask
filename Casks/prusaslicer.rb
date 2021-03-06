cask "prusaslicer" do
  version "2.3.2,202107080658"
  sha256 "aca73fee3c1a9fa8143ac2667ac8ba9637b944684a59d3e84fa591e02ffd9c9a"

  url "https://github.com/prusa3d/PrusaSlicer/releases/download/version_#{version.before_comma}/PrusaSlicer-#{version.before_comma}+universal-#{version.after_comma}.dmg",
      verified: "github.com/prusa3d/PrusaSlicer/"
  name "PrusaSlicer"
  desc "G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
  homepage "https://www.prusa3d.com/slic3r-prusa-edition/"

  livecheck do
    url :url
    strategy :github_latest do |page|
      match = page.match(%r{href=.*?/PrusaSlicer-(\d+(?:\.\d+)*)\+universal-(\d+)\.dmg}i)
      "#{match[1]},#{match[2]}"
    end
  end

  app "PrusaSlicer.app"

  zap trash: [
    "~/Library/Application Support/PrusaSlicer",
    "~/Library/Preferences/com.prusa3d.slic3r",
    "~/Library/Saved Application State/com.prusa3d.slic3r.savedState",
  ]
end
