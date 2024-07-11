$('.comm-channels-link').on('click', function() {
  $('#comms-channels').addClass('is-open');
  $(this).closest('.faq-item').removeClass('is-open');
});
