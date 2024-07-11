$(function() {
  $('.js-scroll-to').on('click', function(e) {
    e.preventDefault();

    var $target = $(this).attr('href');
    $('body').animate({
      scrollTop: $target.offset().top
    });
  });
});
