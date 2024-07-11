/* global setupCountdown */

function setupContributeCountdown() {
  var nextSummitDate = new Date('March 22, 2020 02:00:00 UTC').getTime();

  setupCountdown(nextSummitDate, 'nextSummitCountdown');
}

function setupVideo() {
  var videoButton = document.getElementById('video-button');
  var iframeContainer = document.getElementById('iframe-container');
  var iframeVideo = document.getElementById('iframe-video');
  var videoSource = 'https://www.youtube.com/embed/TExMuUjDg6I?autoplay=1';

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

  if (videoButton && iframeContainer && iframeVideo) {
    videoButton.addEventListener('click', showVideo);
    iframeContainer.addEventListener('click', hideVideo);
    iframeVideo.addEventListener('click', stopProp);
  }

}


(function() {
  setupVideo();
  setupContributeCountdown();
})();
