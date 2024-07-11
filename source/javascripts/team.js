/* global jQuery */
(function($) {
  'use strict';

  $('#team-selector').on('change', function() {
    var selectedDepartmentName = this.value;

    if (selectedDepartmentName === 'All') {
      $('.member').removeClass('hidden');
    } else {
      $('.member').addClass('hidden');

      // show members from department with exact department name from data-department array
      $('.member').each(function() {
        var output = $(this).data('departments') || null;
        if (output && output.constructor === Array) {
          if (output.includes(selectedDepartmentName))
            $(this).removeClass('hidden');
        }
      });
    }
    // append search text in browser URL field as user selects department from dropdown
    history.pushState({}, '', "?department=" + formatString(this.value));

    showTeamListing();
  });

  // To locate old twitter slug find by data-twitter
  // and replace with current slug (href) when user first lands on the page
  $(window).on('load', function() {
    var hash = window.location.hash;
    var memberByTwitter = $('.member-id[data-twitter="' + hash + '"]');
    if (memberByTwitter.length && memberByTwitter.attr('href') != hash) {
      // Use href instead of handle to show member
      hash = memberByTwitter.attr('href');
      updateHash(hash);
    }
  });

  function updateHash(hash) {
    // manually trigger :target update
    // described here: http://www.softwire.com/blog/2016/11/02/better-css-tabs-target/#a588
    history.pushState(null, null, hash);
    history.pushState(null, null, hash);
    history.back();
  }

  // factory function for translating text with special characters into usable URL search text
  function formatString(text) {
    if (text && text.length > 0) {
      return text.toLowerCase()
      .replace(/([,-])/g, '')
      .replace(/([//])|([&])|([:])/g, ' ')
      .replace(/\s\s/g, '')
      .replace(/\s/g, '-');
    }
  }

  // checks search params for pre-selected department and sets it in the
  // department dropdown, if search param is not set — displays all depatments list
  var url = new URL(window.location.href);
  if (url.searchParams.has('department')) {
    var departmentParam = url.searchParams.get('department') || null;
    var result = $('#team-selector option').filter( function() {
      return formatString($(this).val()) === departmentParam;
    });

    var optionItem = (result && result[0]) ? result[0].value : null;

    if (optionItem) {
      $('#team-selector')
        .val(optionItem)
        .prop('selected', true)
        .trigger('change');
    }

    updateHash(url.hash);
  } else {
    showTeamListing();
  }

  function showTeamListing() {
    $('.team-listing').css('visibility', 'visible');
  }

}(jQuery));
