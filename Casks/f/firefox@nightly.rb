cask "firefox@nightly" do
  version "162.0a1,2026-11-14-10-06-03"

  language "ca" do
    sha256 "fbf24c5e7af27cdf4a6993a776dcbaf60892c06fa54ec1ae223af510cd901d4f"
    "ca"
  end
  language "cs" do
    sha256 "471a1b275377618eb0f7104a7d948b47444fb49832c500c1d2d576c55b2fa2b6"
    "cs"
  end
  language "de" do
    sha256 "9d37a791c5ae5ea85d267befd046760867cab7915ae40b7a7c668f228d0a1fb7"
    "de"
  end
  language "en-CA" do
    sha256 "ff740642fd55ae2ff5d2907e02b1a942923711a5090f1b1266ee809e9e3580b5"
    "en-CA"
  end
  language "en-GB" do
    sha256 "ce304ef036054fecd42d146744487a9128e1717340cf72ce0185d7f0999cfbb9"
    "en-GB"
  end
  language "en", default: true do
    sha256 "75499c55a0bd24013dfba62c7acb50fb36007b9df39882efb26463190be4cd11"
    "en-US"
  end
  language "es" do
    sha256 "a1787f0380d8d52e8e9b3ab471fc523e82acdd18ea1f82991086c99bc2872ded"
    "es-ES"
  end
  language "fr" do
    sha256 "edbb4109946f71bbaf04f6301499d4769f28af23dac40cbbc9465cd6d90df644"
    "fr"
  end
  language "it" do
    sha256 "041f631017bb684f8ffcbf84844109389babb17193b85736dcd66411dca0eca1"
    "it"
  end
  language "ja" do
    sha256 "45d1c7a7e91bad8540c9c65b77747d4a62d728e99610e28167759ae11206ab09"
    "ja-JP-mac"
  end
  language "ko" do
    sha256 "2eb9e489cd9f365df8ca950ca40a0eedab126ab3adc576a9a69d1cce366bfa7e"
    "ko"
  end
  language "nl" do
    sha256 "910bd011bfbe5e6babb6206dc22c0542d70ac274f96527898de1c27f4892104e"
    "nl"
  end
  language "pt-BR" do
    sha256 "69a4a1c7b7121a728097f3cc8f4dd10448379fbf40961116744bfe08a9573b52"
    "pt-BR"
  end
  language "ru" do
    sha256 "c61c061a689c184cbbc791d99658814df05f7e301daff22719151d96a965afe9"
    "ru"
  end
  language "uk" do
    sha256 "802c896e9ad72e00ce23825c7b46069b111aeb336e65abedaf34f8b376de6959"
    "uk"
  end
  language "zh-TW" do
    sha256 "31b2daa35e1b55b08b04b47fd29e8fb1ab4db81cb764a78cb507acfb2936a453"
    "zh-TW"
  end
  language "zh" do
    sha256 "a0c345030959a95f6852d96d0f3bc74b7f5a859363bbbd572095724da916cd79"
    "zh-CN"
  end

  url "https://ftp.mozilla.org/pub/firefox/nightly/#{version.csv.second.split("-").first}/#{version.csv.second.split("-").second}/#{version.csv.second}-mozilla-central#{"-l10n" if language != "en-US"}/firefox-#{version.csv.first}.#{language}.mac.dmg"
  name "Mozilla Firefox Nightly"
  desc "Web browser"
  homepage "https://www.mozilla.org/firefox/channel/desktop/#nightly"

  livecheck do
    url "https://product-details.mozilla.org/1.0/firefox_versions.json"
    regex(%r{/(\d+(?:[._-]\d+)+)[^/]*/firefox}i)
    strategy :json do |json, regex|
      version = json["FIREFOX_NIGHTLY"]
      next if version.blank?

      content = Homebrew::Livecheck::Strategy.page_content("https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central/firefox-#{version}.en-US.mac.buildhub.json")
      next if content[:content].blank?

      build_json = Homebrew::Livecheck::Strategy::Json.parse_json(content[:content])
      build = build_json.dig("download", "url")&.[](regex, 1)
      next if build.blank?

      "#{version},#{build}"
    end
  end

  auto_updates true
  depends_on :macos

  app "Firefox Nightly.app"

  zap trash: [
        "/Library/Logs/DiagnosticReports/firefox_*",
        "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.mozilla.firefox.sfl*",
        "~/Library/Application Support/CrashReporter/firefox_*",
        "~/Library/Application Support/Firefox",
        "~/Library/Caches/Firefox",
        "~/Library/Caches/Mozilla/updates/Applications/Firefox",
        "~/Library/Caches/org.mozilla.firefox",
        "~/Library/Preferences/org.mozilla.firefox.plist",
        "~/Library/Preferences/org.mozilla.nightly.plist",
        "~/Library/Saved Application State/org.mozilla.firefox.savedState",
        "~/Library/WebKit/org.mozilla.firefox",
      ],
      rmdir: [
        "~/Library/Application Support/Mozilla", #  May also contain non-Firefox data
        "~/Library/Caches/Mozilla",
        "~/Library/Caches/Mozilla/updates",
        "~/Library/Caches/Mozilla/updates/Applications",
      ]
end
