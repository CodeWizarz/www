(function($) {
  'use strict';

  // Support for tiles or other content that is entirely clickable
  var AllClickable = {
    init: function() {
      var self = AllClickable;

      $(document).on({
        mouseenter: self.mouseenter,
        mouseleave: self.mouseleave
      }, '.js-all-clickable');
      $('.js-all-clickable').click(self.click);
    },
    mouseenter: function() {
      $(this).addClass('js-hover');
    },
    mouseleave: function() {
      $(this).removeClass('js-hover');
    },
    click: function(event) {
      var $$ = $(this);
      var link = $$.find('.js-all-clickable-click-target').get(0);

      $$.parents().blur();
      if ( !link ) {
        link = $$.find('a:first').get(0);
      }
      if (link && event.target !== link) {
        link.click();
      }
    }
  };
  $(AllClickable.init);
})(jQuery);
