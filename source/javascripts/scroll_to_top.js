$(function() {
  var ScrollToTop = {
    init: function init($container) {
      this.$container = $container;

      this.$htmlBody = $('html, body');
      this.$fixedNavbar = $('.navbar-fixed-top');

      this.affixContainer();

      this.bindEvent();
    },

    affixContainer: function affixContainer() {
      var offsetTop = $('.affix-threshold').offset().top;
      if (this.$fixedNavbar) offsetTop -= this.$fixedNavbar.height();

      this.$container.affix({ offset: { top: offsetTop } });
    },

    bindEvent: function bindEvent() {
      this.$container.on(
        'click.scrollToTop',
        this.$htmlBody.animate.bind(this.$htmlBody, { scrollTop: 0 })
      );
    }
  };

  ScrollToTop.init($('.js-scroll-to-top'));
});
