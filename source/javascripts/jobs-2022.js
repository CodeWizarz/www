(function() {

  // moments that matter modal
  $('#momentsModal').on('show.bs.modal', function (event) {
    // trigger
    var trigger = $(event.relatedTarget);
    // get video embed URL and person
    var video = trigger.data('video');
    var current = trigger.data('person');
    // update modal content
    $('#momentsModal').find('iframe').attr('src', video);
    $('#video-thumbnails').addClass(current);
  });

  // unload video on close
  $('#momentsModal').on('hide.bs.modal', function () {
    $('#momentsModal').find('iframe').attr('src', '');
    $('#video-thumbnails').removeClass();
  });

  // thumbnail nav
  $('#video-thumbnails img').on('click', function (event) {
    // trigger
    var btrigger = $(this);
    // get video embed URL and person
    var bvideo = btrigger.data('video');
    var bcurrent = btrigger.data('person');
    // update modal content
    $('#momentsModal').find('iframe').attr('src', bvideo);
    $('#video-thumbnails').removeClass();
    $('#video-thumbnails').addClass(bcurrent);
  });

})();
