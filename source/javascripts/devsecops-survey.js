var devsecopsSurvey = function()
{
  var nav = document.getElementById('main-nav');
  var elem = document.querySelector('#hero');

  //https://bit.ly/2Lu7euk
  var isOutOfViewport = function (elem) {

    // Get element's bounding
    var bounding = elem.getBoundingClientRect();
  
    // Check if it's out of the viewport on each side
    var out = {};
    out.top = bounding.top < 0;
    out.left = bounding.left < 0;
    out.bottom = bounding.bottom < 0;
    out.right = bounding.right > (window.innerWidth || document.documentElement.clientWidth);
      // ^ personal modification to get this to work as expected
    out.any = out.top || out.left || out.bottom || out.right;
    out.all = out.top && out.left && out.bottom && out.right;
  
    return out;
  
  };

  var checkPositions = function () {
    var isOut = isOutOfViewport(elem);
    if (isOut.bottom)
    {
      nav.style.display = "flex";
    } else {
      nav.style.display = "none";
    };
  };

  checkPositions();
  window.addEventListener('scroll', checkPositions, false);

};

document.addEventListener("DOMContentLoaded", function(){
  devsecopsSurvey();
});
