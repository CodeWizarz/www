(function($) {
  'use strict';

  var InPageNav = {
    $body: [],
    $group: [],
    nav: null,
    placeholder: null,
    $navItems: [],
    $sections: [],
    init: function() {
      this.$group = $('.js-in-page-nav-group');
      if (this.$group.length > 0) {
        this.$body = $('body');
        this.setup();
      }
    },
    setup: function() {
      this.$sections = this.$group.find('.js-in-page-nav-section');
      var $nav = $('<nav class="in-page-nav animated"/>');
      var $ul = $('<ul class="list-unstyled"/>');
      this.$sections.each(function() {
        var $section = $(this);
        var $heading = $section.find('h2:first');
        var iconImg = '<img src="/images/sdlc-icons/' + this.id + '.svg"/>';
        var headingText = ($heading.attr('data-js-in-page-nav-title') || $heading.text());
        var dataGaName = 'data-ga-name="' + this.id + '" ';
        if ($('#test').hasClass('features-page')){
          var $li = $('<li class="js-in-page-nav-item"><a id="navicon" data-ga-location="header" href="#' + this.id + '" ' + dataGaName + '>' + iconImg + headingText + '</a></li>');
        } else {
          var $li = $('<li class="js-in-page-nav-item"><a data-ga-location="header" href="#' + this.id + '" ' + dataGaName + '>' + headingText + '</a></li>');
        }
        $li.data('section', $section.get(0));
        $ul.append($li);
      });
      $ul.children().first().addClass('is-active');
      this.$navItems = $ul.children();
      $nav.append($ul);
      this.$group.prepend($nav);
      var $placeholder = $('<div class="in-page-nav-placeholder"/>').height($nav.innerHeight());
      this.placeholder = $placeholder.get(0);
      this.nav = $nav.get(0);
      this.$group.prepend($placeholder);
      this.is_sticky = false;
      this.scrollOnLoad();
      this.scrollCallback();
      window.an_OnScroll.addFunction(this.scrollCallback.bind(this));
      $(document).on('click', '.js-in-page-nav-item', this.clickCallback);
    },
    scrollOnLoad: function() {
      var id = window.location.hash;
      if ( id.substr(0, 1) === '#' ) {
        id = id.substr(1);
      }

      var section = document.getElementById(id);
      if ( section ) {
        this.scrollTo(section);
      }
    },
    scrollCallback: function() {
      this.checkForStick();
      this.checkForActiveSection();
    },
    clickCallback: function(event) {
      event.preventDefault();
      InPageNav.scrollTo( $(this).data('section') );
    },
    scrollTo: function(section) {
      var scrollTop = section.getBoundingClientRect().top + window.scrollY;

      var offsetTop = this.$group.attr('offset') || 125;
      var showHash = this.$group.attr('showhash') || null;

      $('html, body').animate({
        scrollTop: scrollTop - offsetTop
      }, 400);

      if ( showHash && showHash == "true" ) {
        var sectionId = event.target.href || null;
        if (sectionId) window.location.hash = sectionId.substr(sectionId.indexOf("#") + 1);
      }
    },
    checkForStick: function() {
      var boundingRect;
      if ( this.is_sticky ) {
        boundingRect = this.placeholder.getBoundingClientRect();
      } else {
        boundingRect = this.nav.getBoundingClientRect();
      }

      if ( boundingRect.top <= 50 ) {
        if ( !this.is_sticky )  {
          this.$body.addClass('body--has-in-page-nav-stuck');
          this.is_sticky = true;
        }
      } else if ( this.is_sticky ) {
        this.$body.removeClass('body--has-in-page-nav-stuck');
        this.is_sticky = false;
      }
    },
    checkForActiveSection: function() {
      var self = this;
      var navRect = this.nav.getBoundingClientRect();

      this.$navItems.each(function() {
        var $$ = $(this);
        var sectionRect = $$.data('section').getBoundingClientRect();
        if ( self.rectsOverlap(navRect, sectionRect) ) {
          $$.addClass('is-active').siblings().removeClass('is-active');
        }
      });
    },
    rectsOverlap: function(navRect, sectionRect) {
      return navRect.top > sectionRect.top - 80 && navRect.bottom < sectionRect.bottom;
    }
  };
  $(InPageNav.init.bind(InPageNav));
}(jQuery));
