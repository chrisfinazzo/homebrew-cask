cask "agenda" do
  version "18.2"
  sha256 "8be1d22a598e0b1e00d7880223a63609a9fbacbbc0461ac93e46c112b5c8c2ea"

  url "https://downloads.agenda.com/Agenda_#{version}.zip"
  name "Agenda"
  desc "Note taking application focusing on dates"
  homepage "https://agenda.com/"

  no_autobump! because: :requires_manual_review

  disable! date: "2024-12-16", because: :moved_to_mas

  depends_on macos: ">= :mojave"

  app "Agenda.app"

  zap trash: [
    "~/Library/Application Scripts/com.momenta.agenda.macos",
    "~/Library/Application Scripts/com.momenta.agenda.macos.extension-sharing",
    "~/Library/Application Scripts/com.momenta.agenda.macos.extension-widget",
    "~/Library/Containers/com.momenta.agenda.macos",
    "~/Library/Containers/com.momenta.agenda.macos.extension-sharing",
    "~/Library/Containers/com.momenta.agenda.macos.extension-widget",
    "~/Library/Group Containers/WRBK2Z2EG7.group.com.momenta.agenda.macos",
    "~/Library/Preferences/com.momenta.agenda.macos.plist",
  ]
end
