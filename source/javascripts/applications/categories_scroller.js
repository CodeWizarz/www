$(function() {
  // Selects any text that contains a has and captures the characters after the hash
  var HASH_REGEX = /^.*?#(.*)/;

  var ApplicationCategoriesScroller = {
    init: function init($container, categoryDelegationSelector) {
      this.$body = $('body');
      this.navHeight = $('nav.navbar').outerHeight() || 0;
      this.$container = $container;
      this.categoryDelegationSelector = categoryDelegationSelector;
      this.bindEvent();
    },

    bindEvent: function bindEvent() {
      $(window).on('load.scrollToCategory', this.scrollToCategory.bind(this));
      this.$container.on(
        'click.scrollToCategory',
        this.categoryDelegationSelector,
        this.scrollToCategory.bind(this)
      );
    },

    scrollToCategory: function scrollToCategory(e) {
      var id = e.type === 'click' ? e.currentTarget.href.replace(HASH_REGEX, '#$1') : location.hash;

      if (!id) return;

      var $anchor = $('.category-applications' + id);

      this.$body.animate({ scrollTop: $anchor.offset().top - this.navHeight - 150 });
    }
  };

  ApplicationCategoriesScroller.init($('.app-categories'), '.app-category > a');
});
