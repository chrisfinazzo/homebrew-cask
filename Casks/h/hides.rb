cask "hides" do
  version "7.1"
  sha256 :no_check

  url "https://sweetpproductions.com/products/hides/Hides.dmg"
  name "Hides"
  desc "App to hide all open apps except the current one"
  homepage "https://hides.sweetpproductions.com/"

  livecheck do
    url "https://sweetpproductions.com/products/hides/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Hides.app"

  zap trash: [
    "~/Library/Containers/com.sweetpproductions.Hides",
    "~/Library/Group Containers/*.com.sweetpproductions.Hides",
  ]
end
