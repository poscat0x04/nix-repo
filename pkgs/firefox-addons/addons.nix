{ buildFirefoxXpiAddon, fetchurl, stdenv }:
  {
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
    "https-everywhere" = buildFirefoxXpiAddon {
      pname = "https-everywhere";
      version = "2020.8.13";
      addonId = "https-everywhere@eff.org";
      url = "https://addons.mozilla.org/firefox/downloads/file/3625427/https_everywhere-2020.8.13-an+fx.xpi";
      sha256 = "47034cf750c305a328e59de104cf7a5710dbffc9f2dc183283e2f770f2e74241";
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
      version = "3.2.4";
      addonId = "jid1-KKzOGWgsW3Ao4Q@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3673902/i_dont_care_about_cookies-3.2.4-an+fx.xpi";
      sha256 = "b7fa2fdbff245ca3080d3a6d82e08effb904e0909a33198141fefc7742faafeb";
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
      version = "2020.10.7";
      addonId = "jid1-MnnxcxisBPnSXQ@jetpack";
      url = "https://addons.mozilla.org/firefox/downloads/file/3656444/privacy_badger-2020.10.7-an+fx.xpi";
      sha256 = "da9d488a9ee75347b73931a7d0136540292cd3db8aa0bfe4c273503291f7019e";
      meta = with stdenv.lib;
      {
        homepage = "https://privacybadger.org/";
        description = "Automatically learns to block invisible trackers.";
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
      version = "1.30.6";
      addonId = "uBlock0@raymondhill.net";
      url = "https://addons.mozilla.org/firefox/downloads/file/3663488/ublock_origin-1.30.6-an+fx.xpi";
      sha256 = "500ecb79d9e65ff1c4d7cb3a34763c1dc2edc2b5a3f56b6c8ca225494a4535d6";
      meta = with stdenv.lib;
      {
        homepage = "https://github.com/gorhill/uBlock#ublock-origin";
        description = "Finally, an efficient wide-spectrum content blocker. Easy on CPU and memory.";
        license = licenses.gpl3;
        platforms = platforms.all;
        };
      };
    }