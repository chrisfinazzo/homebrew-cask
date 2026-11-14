cask "ghost-downloader" do
  arch arm: "arm64", intel: "x86_64"

  version "4.5.3"
  sha256 arm:   "817651b70f307afe8016f26a1e59ad2471e5c65210837845e6e247ac3729bce1",
         intel: "591b8c19943c86d2ca73697f93780dfbcfc08ab916dd46f912c2141ed73e8c44"

  url "https://github.com/XiaoYouChR/Ghost-Downloader-3/releases/download/v#{version}/Ghost-Downloader-v#{version}-macOS-#{arch}.dmg"
  name "Ghost Downloader"
  desc "Cross-platform multithreaded download manager"
  homepage "https://gd.xychr.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Ghost Downloader.app"

  uninstall quit: [
    "com.xychr.ghostdownloader",
    "io.github.xiaoyouchr.GhostDownloader",
  ]

  zap trash: [
    "~/Library/Application Support/GhostDownloader",
    "~/Library/Preferences/io.github.xiaoyouchr.GhostDownloader.plist",
  ]
end
