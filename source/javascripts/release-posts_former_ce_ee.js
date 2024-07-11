$.fn.wrapInTag = function(opts) {
  var tag = opts.tag || 'span';
  var words = opts.words || [];
  var regex = RegExp('\\b(' + words.join('|') + ')\\b', 'gi');
  var replacement = '<a href="#$&"><' + tag + ' class="$&">$&</' + tag + '></a>';

  return this.html(function() {
    return $(this).text().replace(regex, replacement);
  });
};

$(function() {
  // eslint-disable-next-line consistent-return
  return $('h2, h3').each(function(i, el) {
    // Badges

    if ( $(el).children().length === 0 ) {
      $(el).wrapInTag({
        tag: 'span',
        words: ['ce', 'ee', 'ees', 'eep', 'eeu']
      });
      $(el).children().wrapAll( "<div class='badge-container' />").first();
    }

    // Anchors
    var $el;
    var id;

    $el = $(el);
    id = $el.attr('id');
    if (id) {
      return $el.prepend($('<a />').addClass('header-link').attr('href', '#' + id));
    }
  });
});
