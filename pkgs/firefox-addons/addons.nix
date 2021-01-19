{ buildFirefoxXpiAddon, fetchurl, stdenv }:
  {
    "absolute-enable-right-click" = buildFirefoxXpiAddon {
      pname = "absolute-enable-right-click";
      version = "1.3.8";
      addonId = "{9350bc42-47fb-4598-ae0f-825e3dd9ceba}";
      url = "https://addons.mozilla.org/firefox/downloads/file/1205179/absolute_enable_right_click_copy-1.3.8-fx.xpi";
      sha256 = "d1ca76d23234e6fd0f5d521caef62d20d071c8806887cda89914fd8325715a0a";
      meta = with stdenv.lib;
      {
        description = "Force Enable Right Click &amp; Copy";
        platforms = platforms.all;
        };
      };
    "ctrl-number-to-switch-tabs" = buildFirefoxXpiAddon {
      pname = "ctrl-number-to-switch-tabs";
      version = "1.0.1";
      addonId = "{84601290-bec9-494a-b11c-1baa897a9683}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3525464/ctrlnumber_to_switch_tabs-1.0.1-an+fx.xpi";
      sha256 = "ce31b253e77c0646347ac0a80f43b0d16d6c8c896facc3b1e360dcc0bd6ce0f7";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/AbigailBuccaneer/firefox-ctrlnumber";
        description = "Adds keyboard shortcut Ctrl+1 to switch to the first tab, Ctrl+2 to switch to the second, and so on. Ctrl+9 switches to the last tab.";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "floccus" = buildFirefoxXpiAddon {
      pname = "floccus";
      version = "4.4.8";
      addonId = "floccus@handmadeideas.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3711458/floccus-4.4.8-fx.xpi";
      sha256 = "bd2dcd520e10821dd8af656258c983a52d99cc5d46d2b3683a50287f20d30ecf";
      meta = with stdenv.lib;
      {
        homepage = "https://floccus.org";
        description = "Sync your bookmarks across browsers via Nextcloud, WebDAV or a local file (and thus any file sync solution)";
        license = licenses.mpl20;
        platforms = platforms.all;
        };
      };
    "grammarly" = buildFirefoxXpiAddon {
      pname = "grammarly";
      version = "8.868.0";
      addonId = "87677a2c52b84ad3a151a4a72f5bd3c4@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3697782/grammarly_for_firefox-8.868.0-an+fx.xpi";
      sha256 = "8c36f9a11967df240dfa19a0eff5af3e8f815bdf710524c9fdef609ae197eddc";
      meta = with stdenv.lib;
      {
        homepage = "http://grammarly.com";
        description = "Grammarly’s writing assistant has you covered in any writing situation. With real-time suggestions to help with grammar, clarity, tone, and more, you can be confident that your writing will make the impression you want.";
        platforms = platforms.all;
        };
      };
    "https-everywhere" = buildFirefoxXpiAddon {
      pname = "https-everywhere";
      version = "2020.11.17";
      addonId = "https-everywhere@eff.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3679479/https_everywhere-2020.11.17-an+fx.xpi";
      sha256 = "a6ebcb0a05607e54e7a9fc0b5b3832eda6f13f8dce2ee802164a455919e385c9";
      meta = with stdenv.lib;
      {
        homepage = "https://www.eff.org/https-everywhere";
        description = "Encrypt the web! HTTPS Everywhere is a Firefox extension to protect your communications by enabling HTTPS encryption automatically on sites that are known to support it, even when you type URLs or follow links that omit the https: prefix.";
        license = {
          shortName = "https-everywhere-license";
          fullName = "Multiple";
          url = "https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/license/";
          free = true;
          };
        platforms = platforms.all;
        };
      };
    "i-dont-care-about-cookies" = buildFirefoxXpiAddon {
      pname = "i-dont-care-about-cookies";
      version = "3.2.7";
      addonId = "jid1-KKzOGWgsW3Ao4Q@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3707490/i_dont_care_about_cookies-3.2.7-an+fx.xpi";
      sha256 = "d5f917408c64a254694d34ffa14c48edd5c3fc9f9d2ab45459cf7236acc9352d";
      meta = with stdenv.lib;
      {
        homepage = "https://www.i-dont-care-about-cookies.eu/";
        description = "Get rid of cookie warnings from almost all websites!";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "link-cleaner" = buildFirefoxXpiAddon {
      pname = "link-cleaner";
      version = "1.5";
      addonId = "{6d85dea2-0fb4-4de3-9f8c-264bce9a2296}";
      url = "https://addons.mozilla.org/firefox/downloads/file/671858/link_cleaner-1.5-an+fx.xpi";
      sha256 = "1ecec8cbe78b4166fc50da83213219f30575a8c183f7a13aabbff466c71ce560";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/idlewan/link_cleaner";
        description = "Clean URLs that are about to be visited:\n- removes utm_* parameters\n- on item pages of aliexpress and amazon, removes tracking parameters\n- skip redirect pages of facebook, steam and reddit";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "pixiv-toolkit" = buildFirefoxXpiAddon {
      pname = "pixiv-toolkit";
      version = "4.2.1";
      addonId = "{6706d386-2d33-4e1e-bbf1-51b9e1ce47e1}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3599813/pixiv_toolkit-4.2.1-fx.xpi";
      sha256 = "db60ca7cadfe1fa4b48a11ea613863a29e25a411cdf86079c6b74d6d7bd8efca";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/leoding86/webextension-pixiv-toolkit";
        description = "Convert ugoira to gif or/and webm, pack manga for downloading and download novel on Pixiv.";
        platforms = platforms.all;
        };
      };
    "plasma-integration" = buildFirefoxXpiAddon {
      pname = "plasma-integration";
      version = "1.7.6";
      addonId = "plasma-browser-integration@kde.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3619363/plasma_integration-1.7.6-fx.xpi";
      sha256 = "4603b20d884a472fc9eee538cf4aebf8e824b52cd537eaebdd4aa20c3a41ac70";
      meta = with stdenv.lib;
      {
        homepage = "http://kde.org";
        description = "Multitask efficiently by controlling browser functions from the Plasma desktop.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "privacy-badger" = buildFirefoxXpiAddon {
      pname = "privacy-badger";
      version = "2020.12.10";
      addonId = "jid1-MnnxcxisBPnSXQ@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3691765/privacy_badger-2020.12.10-an+fx.xpi";
      sha256 = "635ded379b5c3259d7bf0997689215bcb0f1bbb77f9289f33b0c01b0cddc7ff0";
      meta = with stdenv.lib;
      {
        homepage = "https://privacybadger.org/";
        description = "Automatically learns to block invisible trackers.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "save-to-the-wayback-machine" = buildFirefoxXpiAddon {
      pname = "save-to-the-wayback-machine";
      version = "5.4.9";
      addonId = "{c5f00c00-e4bc-414d-9784-933857514bd0}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3678406/save_to_the_wayback_machine-5.4.9-fx.xpi";
      sha256 = "3687b4985e9409cfe4c1043d5d8c785d205cfd4a56691cee38842232ab823c8e";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/VerifiedJoseph/Save-to-the-Wayback-Machine";
        description = "Quickly save web pages to the Internet Archive's Wayback Machine and see the last time your current page was archived.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "transmission-easy-client" = buildFirefoxXpiAddon {
      pname = "transmission-easy-client";
      version = "2.2.0";
      addonId = "jid1-0GMKQAI8A9x5jg@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3042549/transmission_easy_client-2.2.0-fx.xpi";
      sha256 = "2beb4ce0dcc24ca8b45c222896e2e01d397ab17a2adcbf708e9e80062af4d65f";
      meta = with stdenv.lib;
      {
        description = "Transmission easy client - это дополнение позволяет легко интегрировать Transmission в браузер!";
        license = licenses.mpl20;
        platforms = platforms.all;
        };
      };
    "ublock-origin" = buildFirefoxXpiAddon {
      pname = "ublock-origin";
      version = "1.32.4";
      addonId = "uBlock0@raymondhill.net";
      url = "https://addons.mozilla.org/firefox/downloads/file/3701081/ublock_origin-1.32.4-an+fx.xpi";
      sha256 = "5b94fd7f749319a6ff6d83dd20b05b29e733446465aff2ab7669499a3e8fb9cc";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/gorhill/uBlock#ublock-origin";
        description = "Finally, an efficient wide-spectrum content blocker. Easy on CPU and memory.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    }