(function() {
  TweenMax.staggerTo('.video-item', 1.6, {ease: Power4.easeOut, y: 0, opacity: 1}, 0.1);
  var videoThumbs = document.getElementsByClassName('video-thumb-container');
  var nav = document.getElementById('main-nav');
  var transparent = false;

  var heroVideoContainer = document.getElementById('hero-video-container');
  var heroVideo = document.getElementById('hero-video');

  function init() {

    if (videoThumbs.length > 0) {
      for (let item of videoThumbs) {
        item.addEventListener('click', showVideo);
      }
    }

    heroVideoContainer.addEventListener('click', hideVideo);
    heroVideo.addEventListener('click', stopProp);
  }

  function showVideo(event) {
    var videoUrl = this.dataset.videourl || null;
    if (videoUrl) {
      document.body.style.overflow = 'hidden';
      heroVideoContainer.style.display = 'flex';
      heroVideo.src = videoUrl;
    }
  }

  function hideVideo() {
    document.body.style.overflow = 'visible';
    heroVideoContainer.style.display = 'none';
    heroVideo.src = '';
  }

  function stopProp(event) {
    event.stopPropagation();
  }

  init();
})();
