{ buildFirefoxXpiAddon, fetchurl, lib, stdenv }:
  {
    "absolute-enable-right-click" = buildFirefoxXpiAddon {
      pname = "absolute-enable-right-click";
      version = "1.3.8";
      addonId = "{9350bc42-47fb-4598-ae0f-825e3dd9ceba}";
      url = "https://addons.mozilla.org/firefox/downloads/file/1205179/absolute_enable_right_click-1.3.8.xpi";
      sha256 = "d1ca76d23234e6fd0f5d521caef62d20d071c8806887cda89914fd8325715a0a";
      meta = with lib;
      {
        description = "Force Enable Right Click &amp; Copy";
        platforms = platforms.all;
        };
      };
    "bitwarden" = buildFirefoxXpiAddon {
      pname = "bitwarden";
      version = "2022.6.1";
      addonId = "{446900e4-71c2-419f-a6a7-df9c091e268b}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3972752/bitwarden_password_manager-2022.6.1.xpi";
      sha256 = "ded8a3fd0e88deccb1354685c0ced8d6fd35af1dbb133f5341e903b9d49cc50d";
      meta = with lib;
      {
        homepage = "https://bitwarden.com";
        description = "A secure and free password manager for all of your devices.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "bypass-paywalls-clean" = buildFirefoxXpiAddon {
      pname = "bypass-paywalls-clean";
      version = "2.7.5.0";
      addonId = "{d133e097-46d9-4ecc-9903-fa6a722a6e0e}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3973814/bypass_paywalls_clean-2.7.5.0.xpi";
      sha256 = "31e20dcaf7cb8c0fd73654b88ca3120e6384ba14a1e2559d98726352a9d580f4";
      meta = with lib;
      {
        homepage = "https://gitlab.com/magnolia1234/bypass-paywalls-firefox-clean";
        description = "Bypass Paywalls of (custom) news sites";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "ctrl-number-to-switch-tabs" = buildFirefoxXpiAddon {
      pname = "ctrl-number-to-switch-tabs";
      version = "1.0.1";
      addonId = "{84601290-bec9-494a-b11c-1baa897a9683}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3525464/ctrl_number_to_switch_tabs-1.0.1.xpi";
      sha256 = "ce31b253e77c0646347ac0a80f43b0d16d6c8c896facc3b1e360dcc0bd6ce0f7";
      meta = with lib;
      {
        homepage = "https://github.com/AbigailBuccaneer/firefox-ctrlnumber";
        description = "Adds keyboard shortcut Ctrl+1 to switch to the first tab, Ctrl+2 to switch to the second, and so on. Ctrl+9 switches to the last tab.";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "cxmooc" = buildFirefoxXpiAddon {
      pname = "cxmooc";
      version = "2.5.1";
      addonId = "love@xloli.top";
      url = "https://addons.mozilla.org/firefox/downloads/file/3683505/1478146-2.5.1.xpi";
      sha256 = "b1f4cf97546f8895816ecf0e711f2586a7eaabd4847b47209bdc12318a0194ed";
      meta = with lib;
      {
        homepage = "https://blog.icodef.com";
        description = "一个 大学生网课 学习工具,火狐,谷歌,油猴支持.全自动任务,视频倍速";
        license = licenses.mit;
        platforms = platforms.all;
        };
      };
    "floccus" = buildFirefoxXpiAddon {
      pname = "floccus";
      version = "4.16.0";
      addonId = "floccus@handmadeideas.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3967736/floccus-4.16.0.xpi";
      sha256 = "e2f170e5a5cde4cc196e2d379ca4e41b0421cf560943c715fca649777bfb1bf4";
      meta = with lib;
      {
        homepage = "https://floccus.org";
        description = "Sync your bookmarks across browsers via Nextcloud, WebDAV or Google Drive";
        license = licenses.mpl20;
        platforms = platforms.all;
        };
      };
    "grammarly" = buildFirefoxXpiAddon {
      pname = "grammarly";
      version = "8.900.0";
      addonId = "87677a2c52b84ad3a151a4a72f5bd3c4@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3967047/grammarly_1-8.900.0.xpi";
      sha256 = "970f5c66cb1c5e70293193a6a4fdfcd2444d38580af841b99b1bf1edefb45b86";
      meta = with lib;
      {
        homepage = "http://grammarly.com";
        description = "Improve your writing with Grammarly's communication assistance. Spell check, grammar check, and punctuation check in one tool. Real-time suggestions for improving tone and clarity help ensure your writing makes the impression you want.";
        platforms = platforms.all;
        };
      };
    "https-everywhere" = buildFirefoxXpiAddon {
      pname = "https-everywhere";
      version = "2021.7.13";
      addonId = "https-everywhere@eff.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3809748/https_everywhere-2021.7.13.xpi";
      sha256 = "e261461b5d4d3621285fce70773558184d691c614b330744dab672f032db731c";
      meta = with lib;
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
      version = "3.4.1";
      addonId = "jid1-KKzOGWgsW3Ao4Q@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3965730/i_dont_care_about_cookies-3.4.1.xpi";
      sha256 = "dd52cbd31c24d11cc8c0fc6448a4697cfe4989a7c3fd501868e4b14e2cbeb96e";
      meta = with lib;
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
      url = "https://addons.mozilla.org/firefox/downloads/file/671858/link_cleaner-1.5.xpi";
      sha256 = "1ecec8cbe78b4166fc50da83213219f30575a8c183f7a13aabbff466c71ce560";
      meta = with lib;
      {
        homepage = "https://github.com/idlewan/link_cleaner";
        description = "Clean URLs that are about to be visited:\n- removes utm_* parameters\n- on item pages of aliexpress and amazon, removes tracking parameters\n- skip redirect pages of facebook, steam and reddit";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "pixiv-toolkit" = buildFirefoxXpiAddon {
      pname = "pixiv-toolkit";
      version = "5.5.3";
      addonId = "{6706d386-2d33-4e1e-bbf1-51b9e1ce47e1}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3917876/pixiv_toolkit-5.5.3.xpi";
      sha256 = "1147a91916160438a04ccd4e473ce1932cf332db4f1cdea9be30179ec573c3be";
      meta = with lib;
      {
        homepage = "https://github.com/leoding86/webextension-pixiv-toolkit";
        description = "Convert ugoira to gif or/and webm, pack manga for downloading and download novel on Pixiv.";
        platforms = platforms.all;
        };
      };
    "plasma-integration" = buildFirefoxXpiAddon {
      pname = "plasma-integration";
      version = "1.8.1";
      addonId = "plasma-browser-integration@kde.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3859385/plasma_integration-1.8.1.xpi";
      sha256 = "e156e82091bbff44cb9d852e16aedacdcc0819c5a3b8cb34cedd77acf566c5c4";
      meta = with lib;
      {
        homepage = "http://kde.org";
        description = "Multitask efficiently by controlling browser functions from the Plasma desktop.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "privacy-badger" = buildFirefoxXpiAddon {
      pname = "privacy-badger";
      version = "2021.11.23.1";
      addonId = "jid1-MnnxcxisBPnSXQ@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3872283/privacy_badger17-2021.11.23.1.xpi";
      sha256 = "50274cd280413bd0e7c4b53d2ef3d019f6a3ce14a7396fed6d248f295ae7f63e";
      meta = with lib;
      {
        homepage = "https://privacybadger.org/";
        description = "Automatically learns to block invisible trackers.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "save-to-the-wayback-machine" = buildFirefoxXpiAddon {
      pname = "save-to-the-wayback-machine";
      version = "5.6.1";
      addonId = "{c5f00c00-e4bc-414d-9784-933857514bd0}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3933900/save_to_the_wayback_machine-5.6.1.xpi";
      sha256 = "3fa9c4553a6032f1afd23eedf1e07c4edf295e674586683191c5ce0f6a2d27d7";
      meta = with lib;
      {
        homepage = "https://github.com/VerifiedJoseph/Save-to-the-Wayback-Machine";
        description = "[Discontinued] Quickly save web pages to the Internet Archive's Wayback Machine and see the last time your current page was archived.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    "sponsorblock" = buildFirefoxXpiAddon {
      pname = "sponsorblock";
      version = "4.6.4";
      addonId = "sponsorBlocker@ajay.app";
      url = "https://addons.mozilla.org/firefox/downloads/file/3975486/sponsorblock-4.6.4.xpi";
      sha256 = "16174dd17e863a8d8e11325069a91912d3750e6e0f5967cfff29ebcaa70b44da";
      meta = with lib;
      {
        homepage = "https://sponsor.ajay.app";
        description = "Easily skip YouTube video sponsors. When you visit a YouTube video, the extension will check the database for reported sponsors and automatically skip known sponsors. You can also report sponsors in videos.\n\nOther browsers: https://sponsor.ajay.app";
        license = licenses.lgpl3;
        platforms = platforms.all;
        };
      };
    "transmission-easy-client" = buildFirefoxXpiAddon {
      pname = "transmission-easy-client";
      version = "2.2.0";
      addonId = "jid1-0GMKQAI8A9x5jg@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3042549/transmission_easy_client-2.2.0.xpi";
      sha256 = "2beb4ce0dcc24ca8b45c222896e2e01d397ab17a2adcbf708e9e80062af4d65f";
      meta = with lib;
      {
        description = "Transmission easy client - это дополнение позволяет легко интегрировать Transmission в браузер!";
        license = licenses.mpl20;
        platforms = platforms.all;
        };
      };
    "ublock-origin" = buildFirefoxXpiAddon {
      pname = "ublock-origin";
      version = "1.43.0";
      addonId = "uBlock0@raymondhill.net";
      url = "https://addons.mozilla.org/firefox/downloads/file/3961087/ublock_origin-1.43.0.xpi";
      sha256 = "ab2d4fa8dfc4f50841093830ff131d7a6e99052ba6e7359f8592e84f39c18a16";
      meta = with lib;
      {
        homepage = "https://github.com/gorhill/uBlock#ublock-origin";
        description = "Finally, an efficient wide-spectrum content blocker. Easy on CPU and memory.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    }