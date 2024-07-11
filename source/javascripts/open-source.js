(function() {
  var blockquoteBackground = document.getElementById('blockquote-background');
  var covers = 20;
  var randomDelays = [];
  var randomDurations = [];
  var delayCount;
  var durationCount;

  function createCovers() {
    var top = 0;
    var coverHeight = blockquoteBackground.offsetHeight / covers;
    for (var i = 0; i < covers; i++) {
      var randomIndex = Math.floor(Math.random() * randomDelays.length);
      var randomDurationIndex = Math.floor(Math.random() * randomDurations.length) + 4;
      var cover = document.createElement('DIV');
      cover.classList.add('code-cover');
      cover.style.height = coverHeight + 'px';
      cover.style.top = top + 'px';
      cover.style.animation = 'reveal ' + randomDurationIndex + 's cubic-bezier(1,.4,.4,1) infinite';
      cover.style.animationDelay = randomIndex + 's';
      blockquoteBackground.appendChild(cover);
      top += coverHeight;
    }
  }

  function load() {
    delayCount = 0;
    durationCount = 4;
    for (var i = 0; i < 10; i++) {
      delayCount += 0.1;
      durationCount += 0.4;
      randomDelays.push(delayCount.toFixed(1));
      randomDurations.push(durationCount.toFixed(1));
    }

    createCovers();
  }

  load();
})();
