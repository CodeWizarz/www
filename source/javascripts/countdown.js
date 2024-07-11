/* eslint-disable no-unused-vars */

function setupCountdown(countDownDate, countdownElementId) {
  var x = setInterval(function() {
    var now = new Date().getTime();

    var distance = countDownDate.start - now;
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // If the count down is over, write some text
    if ((countDownDate.end - now) < 0) {
      clearInterval(x);
      document.getElementById(countdownElementId).innerHTML = 'The next hackathon is around the corner';
    } else if (distance < 0) {
      clearInterval(x);
      document.getElementById(countdownElementId).innerHTML = 'The hackathon is in progress';
    } else {
      document.getElementById(countdownElementId).innerHTML = days + ' days ' + hours + ' hours '
        + minutes + ' minutes ' + seconds + ' seconds ';
    }
  }, 1000);
}

window.setupCountdown = setupCountdown;
