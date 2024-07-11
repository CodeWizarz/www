(function($) {
  'use strict';

  var rowCollapse = {
    $els: [],
    screen_sm_max: 991,
    $body: [],
    init: function() {
      var self = rowCollapse;
      self.$els = $('.js-row-collapse');
      if ( self.$els.length > 0 ) {
        rowCollapse.setup();
      }
    },
    setup: function() {
      var self = this;
      self.$body = $('body');
      $(document).on('click', '.js-row-collapse-trigger', self.onClick);
      self.checkForMobileCollapse();
      $(window).on('resize', function() { self.checkForMobileCollapse(); });
    },
    checkForMobileCollapse: function() {
      var self = this;
      if ( self.$body.width() <= self.screen_sm_max ) {
        self.collapseAllRows();
        self.expandRow(self.getColForEl(self.$els.first())); // Expand first row
      }
    },
    onClick: function() {
      var self = rowCollapse;
      var $trigger = $(this);
      var $col = $trigger.parents('.js-row-collapse-col');

      if ( self.isCollapsed($col) ) {
        self.expandRow($col);
      } else {
        self.collapseRow($col);
      }
    },
    isCollapsed: function($col) {
      return $col.find('.is-collapsed').length > 0;
    },
    getColForEl: function($el) {
      return $el.parents('.js-row-collapse-col');
    },
    collapseAllRows: function() {
      var self = this;
      self.$els.each(function() {
        self.collapseRow(self.getColForEl($(this)));
      });
    },
    collapseRow: function($col) {
      $col
        .siblings('.js-row-collapse-col')
        .andSelf()
        .find('.js-row-collapse')
        .addClass('is-collapsed');
    },
    expandRow: function($col) {
      $col
        .siblings('.js-row-collapse-col')
        .andSelf()
        .find('.js-row-collapse')
        .removeClass('is-collapsed');
    }
  };
  $(rowCollapse.init);
})(jQuery);
