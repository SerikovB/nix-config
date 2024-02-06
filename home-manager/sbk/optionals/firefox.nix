# Firefox browser
{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.sbk = {
      bookmarks = { };
      isDefault = true;
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
        istilldontcareaboutcookies
        sponsorblock
      ];
      bookmarks = { };
      settings = {
        # "_user.js.parrot" = "START: Oh yes, the Norwegian Blue... what's wrong with it?";
        "browser.aboutConfig.showWarning" = false;
        # "_user.js.parrot" = "0100 syntax error: the parrot's dead!";
        "browser.startup.page" = 0;
        "browser.startup.homepage" = "about:blank";
        "browser.newtabpage.enabled" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.default.sites" = "";
        # "_user.js.parrot" = "0200 syntax error: the parrot's definitely deceased!";
        "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
        "geo.provider.ms-windows-location" = false;
        "geo.provider.use_corelocation" = false;
        "geo.provider.use_gpsd" = false;
        "geo.provider.use_geoclue" = false;
        # "_user.js.parrot" = "0300 syntax error: the parrot's not pinin' for the fjords!";
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "browser.discovery.enabled" = false;
        "browser.shopping.experience2023.enabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";
        "browser.ping-centre.telemetry" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
        "captivedetect.canonicalURL" = "";
        "network.captive-portal-service.enabled" = false;
        "network.connectivity-service.enabled" = false;
        # "_user.js.parrot" = "0400 syntax error: the parrot's passed on!";
        "browser.safebrowsing.downloads.remote.enabled" = false;
        # "_user.js.parrot" = "0600 syntax error: the parrot's no more!";
        "network.prefetch-next" = false;
        "network.dns.disablePrefetch" = true;
        "network.predictor.enabled" = false;
        "network.predictor.enable-prefetch" = false;
        "network.http.speculative-parallel-limit" = 0;
        "browser.places.speculativeConnect.enabled" = false;
        # "_user.js.parrot" = "0700 syntax error: the parrot's given up the ghost!";
        "network.proxy.socks_remote_dns" = true;
        "network.file.disable_unc_paths" = true;
        "network.gio.supported-protocols" = "";
        # "_user.js.parrot" = "0800 syntax error: the parrot's ceased to be!";
        "browser.urlbar.speculativeConnect.enabled" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.trending.featureGate" = false;
        "browser.urlbar.addons.featureGate" = false;
        "browser.urlbar.mdn.featureGate" = false;
        "browser.urlbar.pocket.featureGate" = false;
        "browser.urlbar.weather.featureGate" = false;
        "browser.formfill.enable" = false;
        "browser.search.separatePrivateDefault" = true;
        "browser.search.separatePrivateDefault.ui.enabled" = true;
        # "_user.js.parrot" = "0900 syntax error: the parrot's expired!";
        "signon.autofillForms" = false;
        "signon.formlessCapture.enabled" = false;
        "network.auth.subresource-http-auth-allow" = 1;
        # "_user.js.parrot" = "1000 syntax error: the parrot's gone to meet 'is maker!";
        "browser.cache.disk.enable" = false;
        "browser.privatebrowsing.forceMediaMemoryCache" = true;
        "media.memory_cache_max_size" = 65536;
        "browser.sessionstore.privacy_level" = 2;
        "toolkit.winRegisterApplicationRestart" = false;
        "browser.shell.shortcutFavicons" = false;
        # "_user.js.parrot" = "1200 syntax error: the parrot's a stiff!";
        "security.ssl.require_safe_negotiation" = true;
        "security.tls.enable_0rtt_data" = false;
        "security.OCSP.enabled" = 1;
        "security.OCSP.require" = true;
        "security.cert_pinning.enforcement_level" = 2;
        "security.remote_settings.crlite_filters.enabled" = true;
        "security.pki.crlite_mode" = 2;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_send_http_background_request" = false;
        "security.ssl.treat_unsafe_negotiation_as_broken" = true;
        "browser.xul.error_pages.expert_bad_cert" = true;
        # "_user.js.parrot" = "1600 syntax error: the parrot rests in peace!";
        "network.http.referer.XOriginTrimmingPolicy" = 2;
        # "_user.js.parrot" = "1700 syntax error: the parrot's bit the dust!";
        "privacy.userContext.enabled" = true;
        "privacy.userContext.ui.enabled" = true;
        # "_user.js.parrot" = "2000 syntax error: the parrot's snuffed it!";
        "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
        "media.peerconnection.ice.default_address_only" = true;
        # "_user.js.parrot" = "2400 syntax error: the parrot's kicked the bucket!";
        "dom.disable_window_move_resize" = true;
        # "_user.js.parrot" = "2600 syntax error: the parrot's run down the curtain!";
        "browser.download.start_downloads_in_tmp_dir" = true;
        "browser.helperApps.deleteTempFileOnExit" = true;
        "browser.uitour.enabled" = false;
        "devtools.debugger.remote-enabled" = false;
        "permissions.manager.defaultsUrl" = "";
        "webchannel.allowObject.urlWhitelist" = "";
        "network.IDN_show_punycode" = true;
        "pdfjs.disabled" = false;
        "pdfjs.enableScripting" = false;
        "browser.tabs.searchclipboardfor.middleclick" = false;
        "browser.download.useDownloadDir" = false;
        "browser.download.alwaysOpenPanel" = false;
        "browser.download.manager.addToRecentDocs" = false;
        "browser.download.always_ask_before_handling_new_types" = true;
        "extensions.enabledScopes" = 5;
        "extensions.postDownloadThirdPartyPrompt" = false;
        # "_user.js.parrot" = "2700 syntax error: the parrot's joined the bleedin' choir invisible!";
        "browser.contentblocking.category" = "strict";
        # "_user.js.parrot" = "2800 syntax error: the parrot's bleedin' demised!";
        "privacy.sanitize.sanitizeOnShutdown" = true;
        "privacy.clearOnShutdown.cache" = true;
        "privacy.clearOnShutdown.downloads" = true;
        "privacy.clearOnShutdown.formdata" = true;
        "privacy.clearOnShutdown.history" = true;
        "privacy.clearOnShutdown.sessions" = true;
        "privacy.clearOnShutdown.cookies" = true;
        "privacy.clearOnShutdown.offlineApps" = true;
        "privacy.cpd.cache" = true;
        "privacy.cpd.formdata" = true;
        "privacy.cpd.history" = true;
        "privacy.cpd.sessions" = true;
        "privacy.cpd.offlineApps" = false;
        "privacy.cpd.cookies" = false;
        "privacy.sanitize.timeSpan" = 0;
        # "_user.js.parrot" = "1400 syntax error: the parrot's bereft of life!";
        # "_user.js.parrot" = "4500 syntax error: the parrot's popped 'is clogs";
        "privacy.resistFingerprinting" = true;
        "privacy.window.maxInnerWidth" = 1600;
        "privacy.window.maxInnerHeight" = 900;
        "privacy.resistFingerprinting.block_mozAddonManager" = true;
        "privacy.resistFingerprinting.letterboxing" = true;
        "browser.display.use_system_colors" = false;
        "widget.non-native-theme.enabled" = true;
        "browser.link.open_newwindow" = 3;
        "browser.link.open_newwindow.restriction" = 0;
        "webgl.disabled" = true;

        # "_user.js.parrot" = "5000 syntax error: the parrot's taken 'is last bow";

        # "_user.js.parrot" = "5500 syntax error: this is an ex-parrot!";

        # "_user.js.parrot" = "6000 syntax error: the parrot's 'istory!";
        "extensions.blocklist.enabled" = true;
        "network.http.referer.spoofSource" = false;
        "security.dialog_enable_delay" = 1000;
        "privacy.firstparty.isolate" = false;
        "extensions.webcompat.enable_shims" = true;
        "security.tls.version.enable-deprecated" = false;
        "extensions.webcompat-reporter.enabled" = false;
        "extensions.quarantinedDomains.enabled" = true;

        # "_user.js.parrot" = "7000 syntax error: the parrot's pushing up daisies!";

        # "_user.js.parrot" = "8000 syntax error: the parrot's crossed the Jordan";

        # "_user.js.parrot" = "9000 syntax error: the parrot's cashed in 'is chips!";
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        "browser.messaging-system.whatsNewPanel.enabled" = false;
        "browser.urlbar.showSearchTerms.enabled" = false;

        # "_user.js.parrot" = "9999 syntax error: the parrot's shuffled off 'is mortal coil!";
        "security.family_safety.mode" = 0;
        "network.dns.skipTRR-when-parental-control-enabled" = false;
      };
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox.desktop" ];
    "text/xml" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}
