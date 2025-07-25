cask "amazon-workdocs-drive" do
  arch arm: "mac_v2", intel: "mac"

  sha256 :no_check

  on_arm do
    version "1.0.11931.0"
  end
  on_intel do
    version "1.0.10729.0"
  end

  url "https://d3f2hupz96ggz3.cloudfront.net/#{arch}/AmazonWorkDocsDrive.pkg",
      verified: "d3f2hupz96ggz3.cloudfront.net/"
  name "Amazon WorkDocs Drive"
  desc "Fully managed, secure enterprise storage and sharing service"
  homepage "https://aws.amazon.com/workdocs/"

  no_autobump! because: :requires_manual_review

  disable! date: "2025-04-25", because: :discontinued

  depends_on macos: ">= :el_capitan"

  pkg "AmazonWorkDocsDrive.pkg"

  uninstall launchctl: [
              "aws.workdrive.Drive.Launcher",
              "aws.workdrive.Drive.Updater",
              "com.Amazon.WorkDocs.DriveUpdater",
            ],
            quit:      "aws.workdrive.Drive",
            signal:    ["TERM", "com.Amazon.WorkDocs.Drive"],
            pkgutil:   [
              "aws.workdrive.Drive",
              "com.Amazon.WorkDocs.Drive",
              "com.Amazon.WorkDocs.Drive.pkg.core",
            ]

  zap trash: [
    "~/Library/Application Scripts/com.Amazon.WorkDocs.DriveFinderExtension",
    "~/Library/Containers/com.Amazon.WorkDocs.DriveFinderExtension",
    "~/Library/LaunchAgents/com.amazon.workdocs.workdocsclient.plist",
    "~/Library/Preferences/com.amazon.workdocs.workdocsclient.plist",
  ]
end
