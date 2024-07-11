
var animateBlastoff = function()
{
  $(".footer-after-2").animate(
  {
    top: "-3000"
  }, 8000);
};

var callbackMktoFormOnSuccess = function() 
{
  animateBlastoff();
};

window.animateBlastoff = animateBlastoff;
window.callbackMktoFormOnSuccess = callbackMktoFormOnSuccess;