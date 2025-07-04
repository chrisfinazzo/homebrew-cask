cask "writefull" do
  version "3.0.0-beta19"
  sha256 "0b424a82bbf184661ca7f0dd6459a8248ccb643cf07855fadab1481e10445c8d"

  url "https://writefull-binaries.s3.amazonaws.com/#{version}/Writefull.dmg",
      verified: "writefull-binaries.s3.amazonaws.com/"
  name "Writefull"
  desc "Provides feedback on your writing"
  homepage "https://writefullapp.com/"

  no_autobump! because: :requires_manual_review

  disable! date: "2024-12-16", because: :discontinued

  app "Writefull.app"

  zap trash: [
    "~/Library/Application Support/com.paraphrase.Writefull.ShipIt",
    "~/Library/Application Support/Writefull_3beta",
    "~/Library/Caches/com.paraphrase.Writefull",
    "~/Library/Caches/Writefull_3beta",
    "~/Library/Preferences/com.paraphrase.Writefull.plist",
    "~/Library/Saved Application State/com.paraphrase.Writefull.savedState",
  ]
end
