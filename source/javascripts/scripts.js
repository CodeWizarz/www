// eslint-disable-next-line no-unused-vars
function openSocialLink(link, width, height) {
  var left = (window.innerWidth / 2) - (width / 2);
  var top = (window.innerHeight / 2) - (height / 2);

  window.open(link.href, 'targetWindow', 'menubar=no,status=no,resizable=no,width=' + width + ',height=' + height + ',top=' + top + ',left=' + left);
}

// eslint-disable-next-line consistent-return
function getUrlParameter(sParam) {
  var sPageURL = window.location.search.substring(1);
  var sURLVariables = sPageURL.split('&');
  for (var i = 0; i < sURLVariables.length; i++) {
    var sParameterName = sURLVariables[i].split('=');
    if (sParameterName[0] === sParam) {
      return sParameterName[1];
    }
  }
}

function isElementOnScreen($el, scrollTop) {
  // Get very bottom of element
  var elementBottom = $el.offset().top + $el.outerHeight();
  // Get very top of element
  var elementTop = $el.offset().top - scrollTop;

  if (elementTop <= $(window).height() && elementBottom - scrollTop >= 0) {
    // Element is on-screen
    return true;
  }
  return false;
}

$(function() {
  var $ci = $('#ci-subt');
  var $tagLine = $('#tagline');
  var $hireUs = $('#hire-us');
  var $tabs = $('#tabs');
  var $imageLink = $('.image-link');
  var $tables = $('table').filter(':not(:parent(.table-responsive))');
  var $testimonialsSlider = $('#js-testimonials-slider');
  var internalNavigationEvent = 'onpopstate' in window ? 'popstate' : 'hashchange';


  $('input').not('[type=submit]').jqBootstrapValidation();

  // Remove out of the box marketo styling altogether
        /*
     * @author Sanford Whiteman
     * @version v1.104
     * @license MIT License: This license must appear with all reproductions of this software.
     *
     * Create a completely barebones, user-styles-only Marketo form
     * by removing inline STYLE attributes and disabling STYLE and LINK elements
     */
    function destyleMktoForm(mktoForm, moreStyles) {
    	var formEl = mktoForm.getFormElem()[0],
    		arrayFrom = Function.prototype.call.bind(Array.prototype.slice);

    	// remove element styles from <form> and children
    	var styledEls = arrayFrom(formEl.querySelectorAll("[style]")).concat(formEl);
    	styledEls.forEach(function(el) {
    		el.removeAttribute("style");
    	});

    	// disable remote stylesheets and local <style>s
    	var styleSheets = arrayFrom(document.styleSheets);
    	styleSheets.forEach(function(ss) {
    		if ( [mktoForms2BaseStyle,mktoForms2ThemeStyle].indexOf(ss.ownerNode) != -1 || formEl.contains(ss.ownerNode) ) {
    			ss.disabled = true;
    		}
    	});

       if(!moreStyles) {
          formEl.setAttribute("data-styles-ready", "true");
       }
    };

    if (document.querySelector('[id^=mktoForm_]')) {
      MktoForms2.whenRendered(function(form) {
        destyleMktoForm(form);
      });
    }

    if (document.querySelector('.mktoForm')) {
      MktoForms2.whenRendered(function(form) {
        destyleMktoForm(form);
      });
    }

  if ($testimonialsSlider.length) {
    $testimonialsSlider.slick({
      arrows: false,
      autoplay: true,
      autoplaySpeed: 5000,
      dots: true
    });
  }

  if (getUrlParameter('s') === 'ph' && $ci.length) {
    $ci.append('<br><br>Hello, Product Hunters!<br><br> Get 75% off a GitLab.com bronze subscription forever! <br> Use the code: producthunt75');
  }

  // Consultancy
  if ($tagLine.length && $hireUs.length) {
    $tagLine.addClass('animated fadeInLeft');
    $hireUs.addClass('animated bounceIn');
  }

  // Tabs
  if ($tabs.length) {
    var current = window.location.hash;

    $('.tab:not(' + current + ')', $tabs).hide();
    window.scrollTo(0, 0);

    $('.js-select-os.dropdown-menu a').on('click', function(e) {
      e.preventDefault();

      var selText = $(this).text();
      var currentHref = $(this).attr('href');

      $(this).parents('.btn-group').find('.dropdown-toggle').html(selText + ' <span class="caret"></span>');

      $('.tab:not(' + currentHref + ')', $tabs).hide();
      $(currentHref).show();
      window.location.replace(window.location.origin + window.location.pathname + currentHref);
      window.scrollTo(0, 0);

      $(this).dropdown('toggle');

      return false;
    });
  }

  if ($imageLink.length) {
    $imageLink.magnificPopup({
      type: 'image'
    });
  }

  if ($tables.length) {
    $tables.each(function() {
      $(this).wrap('<div class="table-responsive"></div>');
    });
  }

  var changeScrollPosition = function() {
    if (window.location.hash === '' || window.location.hash.indexOf('#stq=') === 0) { return; }

    var hash = window.location.hash;

    var $el = $('a[name="' + hash.replace('#', '') + '"], ' + hash + '');
    var extraHeight = $('.navbar').outerHeight();
    var $qnav = $('#qnav');

    if ($qnav.length) {
      extraHeight += $qnav.outerHeight() - 2;
    }

    if ($el.length) {
      var elTop = $el.offset().top;
      var elPosition = elTop - $(window).scrollTop();

      if (extraHeight < elPosition) {
        $(window).scrollTop(elTop - extraHeight);
      }
    }
  };

  $(window).on('load ' + internalNavigationEvent, function() {
    if ($('body').hasClass('installation_index')) return;
    setTimeout(changeScrollPosition, 10);
  });

  // Search
  var $search = $('.js-search');

  $('.js-search-toggle').on('click', function() {
    $search.parent().toggleClass('search-visible');

    setTimeout(function() {
      $search.focus();
    }, 350);
  });

  $search.on('keyup', function(e) {
    if (e.which === 13) {
      // Trigger a search by changing hash
      window.location.hash = '#stq=' + $(this).val();
    }
  });

  // Swiftype search data analytics
  $('body').on('click', '.st-ui-result', function () {
    var link_name = $(this).children('span.st-ui-type-heading').text()

    window.dataLayer=window.dataLayer||[];
    window.dataLayer.push({
      'event':'siteSearchPreview',
      'siteSearchQuery': link_name
    })
  });

  $('.js-faq-question').on('click', function(e) {
    e.preventDefault();
    var isOpen = $(this).closest('.faq-item').is('.is-open');
    $('.faq-item.is-open').removeClass('is-open');

    if (!isOpen) {
      $(this).closest('.faq-item').toggleClass('is-open');
    }
  });

  function updateHash(hash) {
    // manually trigger :target update
    // described here: http://www.softwire.com/blog/2016/11/02/better-css-tabs-target/#a588
    history.pushState(null, null, hash);
    history.pushState(null, null, hash);
    history.back();
  }

  function closeModal(e) {
    e.preventDefault();
    e.stopImmediatePropagation();

    const hash = '#close-modal';
    updateHash(hash);
  }

  // Team page card popups
  function handleEscape(e) {
    var ESCAPE = 27;

    var members = [].slice.call(document.querySelectorAll('.member-id'));
    var memberActive = members.find(function(link) {
      return document.location.hash === link.getAttribute('href');
    });

    if (e.keyCode === ESCAPE && memberActive) {
      closeModal(e);
    }
  }

  function setActiveMember(hash) {
    updateHash(hash);
  }

  $('.modal-overlay').click(closeModal);
  $('.close-modal').on('click', closeModal);
  $(document).on('keyup', handleEscape);

  $('.front').click(function(e) {
    var clickedLink = $(e.target).closest('a').length;
    if (clickedLink) {
      return;
    }

    var hash = $(e.currentTarget).find('.member-id').attr('href');
    setActiveMember(hash);
  });

  $('.member-id').click(function(e) {
    e.preventDefault();
    e.stopImmediatePropagation();
    var hash = new URL(e.currentTarget.href).hash;
    setActiveMember(hash);
  });
});



