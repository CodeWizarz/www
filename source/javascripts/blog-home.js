$(function() {
  $('.blog-card-excerpt').each(function() {
    var len = $(this).text().length;
    if (len > 140) {
      $(this).text($(this).text().substr(0, 140) + '...');
    }
  });
});


(function() {
  var videoButton = document.getElementById('video-button');
  var iframeContainer = document.getElementById('iframe-container');
  var iframeVideo = document.getElementById('iframe-video');
  var videoSource = getMainVideoFromEmbeddedJSON().source;

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


(function() {
  var videoArray = getFeaturedVideosFromEmbeddedJSON()
  videoArray.forEach((video, index) => {

    var videoButton = document.querySelector(`[data-video-id="${index}"]`);
    var iframeContainer = document.getElementById('iframe-container');
    var iframeVideo = document.getElementById('iframe-video');

    function showVideo() {
      iframeContainer.style.display = 'flex';
      iframeVideo.src = video.source;
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
  })
})();
  

function getMainVideoFromEmbeddedJSON() {
  var json = document.getElementById('main-video-data').innerHTML;
  var data = JSON.parse(json);
  var video = data;
  var videoObj = {};
  videoObj.title = video.title;
  videoObj.source = video.source;
  videoObj.thumbnail = video.thumbnail;
  return videoObj;
}

function getFeaturedVideosFromEmbeddedJSON() {
  var videos = [];
  var json = document.getElementById('featured-video-data').innerHTML;
  var data = JSON.parse(json);
  var videoElements = data;
  for (var i = 0; i < videoElements.length; i++) {
    var video = videoElements[i];
    var videoObj = {};
    videoObj.title = video.title;
    videoObj.source = video.source;
    videoObj.thumbnail = video.thumbnail;
    videos.push(videoObj);
  }
  return videos;
}
