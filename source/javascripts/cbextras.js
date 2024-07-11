!(function() {
  var loopcount;
  var attemptedAction;
  var extraClassnames = "";

  function getCookie(name) {
    var v = document.cookie.match("(^|;) ?" + name + "=([^;]*)(;|$)");
    return v ? v[2] : "";
  }

  if (window.CBNCLanguage === undefined) {
    window.CBNCLanguage = "en";
  }

  var renderMessageStandard = function(
    loopcount,
    targets,
    attemptedAction,
    extraClassnames,
    messageLocation,
    isThisExpandable
  ) {
    if (window.CBNCLanguage.toLowerCase() == "de") {
      var cookieCategory = "all"
      var CBNCMessage =
        '<div class="cbnc-message' +
        extraClassnames +
        " cbnc-message-expands-" +
        isThisExpandable +
        '"><span class="cbnc-message-toggle">Haben Sie Probleme ' +
        attemptedAction +
        '?</span> <span class="cbnc-message-expandable">Möglicherweise müssen Sie Ihre <button id="ot-sdk-btn" class="ot-sdk-show-settings" style="font-size: unset !important; color: unset !important; text-decoration: underline;">Cookie-Einstellungen aktualisieren, um' +
        cookieCategory +
        "-Cookies zuzulassen</button></span></div>";
    } else {
      var cookieCategory = "all"
      var CBNCMessage =
        '<div class="cbnc-message' +
        extraClassnames +
        " cbnc-message-expands-" +
        isThisExpandable +
        '"><span class="cbnc-message-toggle">Having trouble ' +
        attemptedAction +
        '?</span> <span class="cbnc-message-expandable">You may need to update your <button id="ot-sdk-btn" class="ot-sdk-show-settings" style="font-size: unset !important; color: unset !important; text-decoration: underline;">cookie settings </button> to allow ' +
        cookieCategory +
        " cookies. You might also need to allow us on your adblocker, firewall, or browser privacy settings.</span></div>";
    }
    var wrapper = document.createElement("div");
    wrapper.setAttribute("class", "cbneedsconsent");
    targets[loopcount].parentNode.insertBefore(wrapper, targets[loopcount]);
    wrapper.appendChild(targets[loopcount]);
    if (messageLocation == "before") {
      wrapper.insertAdjacentHTML("afterbegin", CBNCMessage);
    }
    if (messageLocation == "after") {
      wrapper.insertAdjacentHTML("beforeend", CBNCMessage);
    }
    if (messageLocation == "afterSubtitle") {
      wrapper
        .querySelector(".form-container .form")
        .insertAdjacentHTML("beforebegin", CBNCMessage);
    }
    if (isThisExpandable === true) {
      expandableTargets = document.querySelectorAll(
        ".cbnc-message-expands-true"
      );
      for (loopcount = 0; loopcount < expandableTargets.length; loopcount++) {
        expandableTargets[loopcount].addEventListener("click", function() {
          var expandThis = document.querySelectorAll(
            ".cbnc-message-expandable"
          );
          for (loopcount2 = 0; loopcount2 < expandThis.length; loopcount2++) {
            expandThis[loopcount2].style.display = "inline";
          }
        });
      }
    }
  };

  isCookieConsentRequired = getCookie("CookieConsent");
  if (isCookieConsentRequired !== "-1") {
    /* if consent is required */
    if (isCookieConsentRequired.indexOf("marketing:true") == -1) {
      /* if personalization is not currently enabled */

      // youtube videos
      var targets = document.querySelectorAll('iframe[data-src*="youtube"]');
      for (loopcount = 0; loopcount < targets.length; loopcount++) {
        attemptedAction = "viewing this video";
        extraClassnames = " cbnc-youtube";
        messageLocation = "before";
        isThisExpandable = false;
        renderMessageStandard(
          loopcount,
          targets,
          attemptedAction,
          extraClassnames,
          messageLocation,
          isThisExpandable
        );
      }

      // youtube images
      var targets = document.querySelectorAll('img[data-src*="img.youtube"]');
      for (loopcount = 0; loopcount < targets.length; loopcount++) {
        attemptedAction = "viewing this video";
        extraClassnames = " cbnc-youtube";
        messageLocation = "before";
        isThisExpandable = false;
        renderMessageStandard(
          loopcount,
          targets,
          attemptedAction,
          extraClassnames,
          messageLocation,
          isThisExpandable
        );
      }

      // vimeo videos
      var targets = document.querySelectorAll('iframe[data-src*="player.vimeo"]');
      for (loopcount = 0; loopcount < targets.length; loopcount++) {
        attemptedAction = "viewing this video";
        extraClassnames = " cbnc-youtube";
        messageLocation = "before";
        isThisExpandable = false;
        renderMessageStandard(
          loopcount,
          targets,
          attemptedAction,
          extraClassnames,
          messageLocation,
          isThisExpandable
        );
      }

      // sched events
      var targets = document.querySelectorAll('iframe[data-cookieblock-src*="sched"]');
      for (loopcount = 0; loopcount < targets.length; loopcount++) {
        var dataSrc = targets[loopcount].getAttribute("data-cookieblock-src");
        attemptedAction =
          "<a href='" + dataSrc + "' target='_blank'>viewing this schedule</a>";
        extraClassnames = " cbnc-sched";
        messageLocation = "before";
        isThisExpandable = false;
        renderMessageStandard(
          loopcount,
          targets,
          attemptedAction,
          extraClassnames,
          messageLocation,
          isThisExpandable
        );
      }

      // marketo gated content forms
      var targets = document.querySelectorAll(".form-to-resource-content .form-container, .sales form, .bl-modal form, .centered-form form, .demo-form-container form, .newsletter-form-content form, .newsletter-form-short form, #gitlab-oss-form, .commit-content form, .services-form .form-container, .all-remote-newsletter-block form, .newsletter-form form");
      for (loopcount = 0; loopcount < targets.length; loopcount++) {
        if (window.CBNCLanguage.toLowerCase() == "de") {
          attemptedAction = "beim Absenden dieses Formulars";
        } else {
          attemptedAction = "viewing or submitting this form";
        }
        extraClassnames = " cbnc-marketo";
        var formSubtitleExists = targets[loopcount].querySelector(
          ".form-container .f2r-cta-subtitle"
        );
        if (typeof formSubtitleExists != "undefined" && formSubtitleExists) {
          messageLocation = "afterSubtitle";
        } else {
          messageLocation = "after";
        }
        isThisExpandable = true;
        renderMessageStandard(
          loopcount,
          targets,
          attemptedAction,
          extraClassnames,
          messageLocation,
          isThisExpandable
        );
      }
    }
  }

})();
