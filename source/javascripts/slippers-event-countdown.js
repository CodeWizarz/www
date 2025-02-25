function initializeCountdown(countdownDate) {
  // Set the date we're counting down to
  var eventDate = new Date(countdownDate).getTime();

  // Update the count down every 1 second
  var countdown = setInterval(function () {
    // Get today's date and time
    var now = new Date().getTime();

    // Find the distance between now and the count down date
    var distance = eventDate - now;

    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor(
      (distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60),
    );
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Display the result in the elements with corressponding ids
    document.getElementById('slp-countdown-days').innerHTML = days;
    document.getElementById('slp-countdown-hours').innerHTML = hours;
    document.getElementById('slp-countdown-minutes').innerHTML = minutes;
    document.getElementById('slp-countdown-seconds').innerHTML = seconds;

    // If the count down is finished, hide block
    if (distance < 0) {
      clearInterval(countdown);
      document.getElementById('slpEventCountdown').style.display = 'none';
    }
  }, 1000);
};


(function() {
  const countdown = document.querySelector('.slpEventCountdown')
  const countdownDate = countdown.dataset.countdownDate;
  initializeCountdown(countdownDate)
})();
