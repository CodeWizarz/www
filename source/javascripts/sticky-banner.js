(function() {
    var trialDismissed = false
    document.getElementById("dismiss-trial").addEventListener("click", dismissTrial)
    function dismissTrial() {
      document.getElementById('sticky-banner').style.display = "none";
    }
  })();