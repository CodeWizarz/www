(function() {
  var videoButton = document.getElementById('video-button');
  var iframeContainer = document.getElementById('iframe-container');
  var iframeVideo = document.getElementById('iframe-video');
  var videoSource = 'https://www.youtube.com/embed/FmimIGNR2S4?autoplay=1';

  function showVideo() {
    iframeContainer.style.display = 'flex';
    iframeVideo.src = videoSource;
  }

  function hideVideo() {
    iframeContainer.style.display = 'none';
    iframeVideo.src = '';
  }

  function stopProp(event) {
    event.stopPropagation();
  }

  videoButton.addEventListener('click', showVideo);
  iframeContainer.addEventListener('click', hideVideo);
  iframeVideo.addEventListener('click', stopProp);
})();
